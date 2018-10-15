# SQL Server 2017
docker pull mcr.microsoft.com/mssql/server
docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=yourStrong(!)Password" -p 1433:1433 -d msint.azurecr.io/mssql/server:2017-CU8

# SQL Server 2019
docker pull mcr.microsoft.com/mssql/server:vNext-CTP2.0-ubuntu
sudo docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=<YourStrong!Passw0rd>' \
   -p 1433:1433 --name sql2019 \
   -d mcr.microsoft.com/mssql/server:vNext-CTP2.0-ubuntu

# Change the SA password
docker exec -it sql2019 /opt/mssql-tools/bin/sqlcmd \
   -S localhost -U SA -P '<YourStrong!Passw0rd>' \
   -Q 'ALTER LOGIN SA WITH PASSWORD="<YourNewStrong!Passw0rd>"'

# Connect to SQL Server
docker exec -it sql2019 "bash"
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P '<YourNewStrong!Passw0rd>'
# If successful, you should get to a sqlcmd command prompt: `1>`
# To end your sqlcmd session, type `QUIT`

# map container's port 1433 to host port to access SQL Server from outside
# 192.168.50.6 is the host's IP address
/opt/mssql-tools/bin/sqlcmd -S 192.168.50.6,1433 -U SA -P '<YourNewStrong!Passw0rd>'

# remove container
# **Warning!** it remoes data as well. Use container data persistence technique to
# keep it: https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-configure-docker?view=sql-server-linux-ver15#persist
docker stop sql2019
docker rm sql2019