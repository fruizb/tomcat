id=$(id -u)
sudo chown 1001:1001 -R database/
sudo chown $id:$id -R tomcat9/ tomcat8/ Dockerfiles/ docker-compose.yml
