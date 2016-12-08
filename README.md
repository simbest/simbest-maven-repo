##使用Github作为第三方依赖包的托管仓库，实现公网的Maven私服Nexus

  1）在Github创建依赖包托管仓库simbest-maven-repo
  
  2）将仓库simbest-maven-repo克隆至本地
	 
  3）将第三方依赖包安装至本地仓库simbest-maven-repo，执行命令如下：

    mvn install:install-file -DgroupId=javabase64 -DartifactId=javabase64 -Dversion=1.3 -Dfile=E:\01_Work\01_DevSpace\Repository\javabase64\javabase64\1.3\javabase64-1.3.jar -Dpackaging=jar -DgeneratePom=true -DlocalRepositoryPath=E:\01_Work\01_DevSpace\worksapce_github\simbest-maven-repo\repository -DcreateChecksum=true
	mvn install:install-file -DgroupId=com.cloopen -DartifactId=CCP_REST_SMS_SDK_JAVA -Dversion=2.6.3 -Dfile=E:\01_Work\01_DevSpace\Repository\com\cloopen\CCP_REST_SMS_SDK_JAVA\2.6.3\CCP_REST_SMS_SDK_JAVA-2.6.3.jar -Dpackaging=jar -DgeneratePom=true -DlocalRepositoryPath=E:\01_Work\01_DevSpace\worksapce_github\simbest-maven-repo\repository -DcreateChecksum=true
	mvn install:install-file -DgroupId=com.oracle -DartifactId=ojdbc -Dversion=6 -Dfile=D:\ojdbc6.jar -Dpackaging=jar -DgeneratePom=true -DlocalRepositoryPath=E:\01_Work\01_DevSpace\worksapce_github\simbest-maven-repo\repository -DcreateChecksum=true
	mvn install:install-file -DgroupId=com.simbest -DartifactId=PortalEncrypt -Dversion=1.0 -Dfile=E:\PortalEncrypt-1.0.jar -Dpackaging=jar -DgeneratePom=true -DlocalRepositoryPath=E:\01_Work\01_DevSpace\worksapce_github\simbest-maven-repo\repository -DcreateChecksum=true
	mvn install:install-file -DgroupId=jacob -DartifactId=jacob -Dversion=1 -Dfile=E:\jacob-1.jar -Dpackaging=jar -DgeneratePom=true -DlocalRepositoryPath=E:\01_Work\01_DevSpace\worksapce_github\simbest-maven-repo\repository -DcreateChecksum=true
	mvn install:install-file -DgroupId=com.lowagie -DartifactId=iTextAsian -Dversion=1.0 -Dfile=E:\iTextAsian-1.0.jar -Dpackaging=jar -DgeneratePom=true -DlocalRepositoryPath=E:\01_Work\01_DevSpace\worksapce_github\simbest-maven-repo\repository -DcreateChecksum=true
	mvn install:install-file -DgroupId=com.simbest -DartifactId=onelogmodel -Dversion=0.2 -Dfile=E:\onelogmodel-0.2.jar -Dpackaging=jar -DgeneratePom=true -DlocalRepositoryPath=E:\01_Work\01_DevSpace\worksapce_github\simbest-maven-repo\repository -DcreateChecksum=true
	mvn install:install-file -DgroupId=com.oracle -DartifactId=ojdbc -Dversion=14 -Dfile=E:\ojdbc-14.jar -Dpackaging=jar -DgeneratePom=true -DlocalRepositoryPath=E:\01_Work\01_DevSpace\worksapce_github\simbest-maven-repo\repository -DcreateChecksum=true
	mvn install:install-file -DgroupId=com.artofsolving -DartifactId=jodconverter -Dversion=2.2.1 -Dfile=E:\jodconverter-2.2.1.jar -Dpackaging=jar -DgeneratePom=true -DlocalRepositoryPath=E:\01_Work\01_DevSpace\worksapce_github\simbest-maven-repo\repository -DcreateChecksum=true
	mvn install:install-file -DgroupId=com.artofsolving -DartifactId=jodconverter-core -Dversion=3.0-beta-4 -Dfile=E:\jodconverter-core-3.0-beta-4.jar -Dpackaging=jar -DgeneratePom=true -DlocalRepositoryPath=E:\01_Work\01_DevSpace\worksapce_github\simbest-maven-repo\repository -DcreateChecksum=true
	mvn install:install-file -DgroupId=com.apache.phoenix -DartifactId=phoenix-4.3.0-clabs-phoenix-1.0.0-client -Dversion=4.3.0 -Dfile=E:\phoenix-4.3.0-clabs-phoenix-1.0.0-client-4.3.0.jar -Dpackaging=jar -DgeneratePom=true -DlocalRepositoryPath=E:\01_Work\01_DevSpace\worksapce_github\simbest-maven-repo\repository -DcreateChecksum=true	
	mvn install:install-file -DgroupId=io.longyuan -DartifactId=shiro-redis-session -Dversion=1.0.0 -Dfile=E:\shiro-redis-session-1.0.0.jar -Dpackaging=jar -DgeneratePom=true -DlocalRepositoryPath=E:\01_Work\01_DevSpace\worksapce_github\simbest-maven-repo\repository -DcreateChecksum=true   
	mvn install:install-file -DgroupId=dance -DartifactId=Distributed-Kit -Dversion=0.0.1 -Dfile=E:\Distributed-Kit-0.0.1.jar -Dpackaging=jar -DgeneratePom=true -DlocalRepositoryPath=E:\01_Work\01_DevSpace\worksapce_github\simbest-maven-repo\repository -DcreateChecksum=true 
	mvn install:install-file -DgroupId=com.oracle -DartifactId=ojdbc14 -Dversion=10.2.0.2.0 -Dfile=E:\ojdbc14-10.2.0.2.0.jar -Dpackaging=jar -DgeneratePom=true -DlocalRepositoryPath=E:\01_Work\01_DevSpace\worksapce_github\simbest-maven-repo\repository -DcreateChecksum=true 
	
  4）将maven生成的文件提交并推送至Github
  
  5）结束


其他项目需要使用该第三方依赖包时，在pom文件添加如下片段	：			
		
        <repositories>
			<repository>
            <id>simbest-maven-repo1</id>
            <url>https://raw.github.com/simbest/simbest-maven-repo/master/repository/</url>
            <snapshots>
                <enabled>true</enabled>
                <updatePolicy>always</updatePolicy>
            </snapshots>
			</repository>
			<repository>
				<id>simbest-maven-repo2</id>
				<url>https://github.com/simbest/simbest-maven-repo/tree/master/repository/</url>
				<snapshots>
					<enabled>true</enabled>
					<updatePolicy>always</updatePolicy>
				</snapshots>
			</repository>
		</repositories>	