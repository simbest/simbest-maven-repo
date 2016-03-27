# simbest-maven-repo
Github 做私服，托管第三方依赖包
		1）在Github创建依赖包托管仓库simbest-maven-repo
		2）将仓库simbest-maven-repo克隆至本地
		3）将第三方依赖包安装至本地仓库simbest-maven-repo，执行命令如下：
		```
		mvn install:install-file -DgroupId=javabase64 -DartifactId=javabase64 -Dversion=1.3 -Dfile=E:\01_Work\01_DevSpace\Repository\javabase64\javabase64\1.3\javabase64-1.3.jar -Dpackaging=jar -DgeneratePom=true -DlocalRepositoryPath=E:\01_Work\01_DevSpace\worksapce_github\simbest-maven-repo\repository -DcreateChecksum=true
		```
		4）将maven生成的文件提交并推送至Github
		5）结束
		
其他项目需要使用该第三方依赖包时，在pom文件添加如下片段		
		```
		<repositories>
			<repository>
				<id>simbest-cores-mvn-repo</id>
				<url>https://raw.github.com/simbest/simbest-maven-repo/master/repository/</url>
				<snapshots>
					<enabled>true</enabled>
					<updatePolicy>always</updatePolicy>
				</snapshots>
			</repository>
		</repositories>	
		```
