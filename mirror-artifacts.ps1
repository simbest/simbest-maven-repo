# mirror-artifacts.ps1 — 从 Nexus 私服镜像私有构件到本仓 repository/ 目录
#
# 用途：让非局域网团队成员经 GitHub（raw.githubusercontent.com/simbest/simbest-maven-repo）
#       解析 Nexus 独有的私有构件，无需访问内网。
# 用法：在局域网内任一可访问 Nexus 的机器上执行：
#         powershell -File mirror-artifacts.ps1
# 可选环境变量：NEXUS_BASE_URL（默认 http://10.87.57.26:8082/nexus/repository）
#
# 说明：
# - 只镜像 uums 构建链必需的私有构件（经 mvn dependency:tree 实测清单），
#   公有依赖一律走阿里云，不入本仓。
# - 新增/升级构件时，在 $artifacts 清单中加一行重跑即可；下载后自动做 sha1 校验。
# - 凭证：Nexus 匿名可读，无需账密；如私服收紧匿名，请自行在 URL 中带凭证或改用
#   Invoke-WebRequest -Credential（不要把密码写进本文件）。

$ErrorActionPreference = "Stop"

$nexus = if ($env:NEXUS_BASE_URL) { $env:NEXUS_BASE_URL.TrimEnd("/") } else { "http://10.87.57.26:8082/nexus/repository" }

# repo = Nexus 内仓库名；path = 构件仓库路径；files = 需镜像的文件（.sha1 自动附带）
$artifacts = @(
    @{ repo = "releases";         path = "com/simbest/boot/simbest-boot-parent/0.3";  files = @("simbest-boot-parent-0.3.pom") },
    @{ repo = "releases";         path = "com/simbest/boot/simbest-boot-cores/0.3";   files = @("simbest-boot-cores-0.3.jar", "simbest-boot-cores-0.3.pom") },
    @{ repo = "releases";         path = "com/simbest/boot/simbest-boot-orguser/0.1"; files = @("simbest-boot-orguser-0.1.jar", "simbest-boot-orguser-0.1.pom") },
    @{ repo = "maven-thirdparty"; path = "com/simbest/boot/oceanbase-client/2.4.9";   files = @("oceanbase-client-2.4.9.jar", "oceanbase-client-2.4.9.pom") }
)

$root = Join-Path $PSScriptRoot "repository"

foreach ($a in $artifacts) {
    $destDir = Join-Path $root ($a.path -replace "/", "\")
    New-Item -ItemType Directory -Force $destDir | Out-Null
    foreach ($f in $a.files) {
        $url = "$nexus/$($a.repo)/$($a.path)/$f"
        $dest = Join-Path $destDir $f
        Write-Host "下载 $url"
        Invoke-WebRequest -Uri $url -OutFile $dest -UseBasicParsing

        $sha1Remote = ((Invoke-WebRequest -Uri "$url.sha1" -UseBasicParsing).Content -split "\s+")[0].Trim().ToLower()
        $sha1Local = (Get-FileHash $dest -Algorithm SHA1).Hash.ToLower()
        if ($sha1Local -ne $sha1Remote) {
            throw "sha1 不一致：$f 远程=$sha1Remote 本地=$sha1Local"
        }
        [System.IO.File]::WriteAllText("$dest.sha1", $sha1Remote)
        Write-Host "OK   $($a.path)/$f  sha1=$sha1Local"
    }
}
Write-Host "镜像完成。"
