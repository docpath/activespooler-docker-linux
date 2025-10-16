FROM openjdk:8

RUN mkdir -p /required_files
COPY activespoolerpack-2.xx.y.z-java.jar /required_files/as-installer.jar
WORKDIR /required_files
RUN java -jar as-installer.jar -console -silentmode -install -solution"/usr/local/docpath/activespoolerpack/activespooler" -solname"DocPath ActiveSpooler Pack" -adminusername"admin" -adminpassword"admin" -licserverpath"/usr/local/docpath/licenseserver" -licserverport"1765" -databaseserver"MySQL" -databasename"activespooler" -databasehost"localhost" -databaseport"3306" -databaseuser"root" -databasepassword"root" -databasecheckconnection"false"
WORKDIR /
RUN rm -rf /required_files
COPY DocPath_License_File.olc /usr/local/docpath/Licenses/
COPY run.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/run.sh
EXPOSE 8085

ENTRYPOINT ["/usr/local/bin/run.sh"]
