# filebeat-compose
docker compose with custom image of filebeat, kibana and elasticsearch 7.0.0



You need to build your custom image of filebeat .... this  image copy a file for  listen while 
elasticsearch and kibana are ready , in another way filebeat fails when it starts .


docker-compose file have a config in elesticsearh services to run in cluster mode, only supported in version 7.

in previous tested version 6.6.0 not allow cluster configs.

Build filebeat_custom: 
go in filebet folder and ececute

Ensure docker daemon is running.

# docker build .

tag the last sha returned afte build. 

# docker images  

search the last created few seconds ago. the image number is the sha for the image

# docker tag <sha-image> docker.io/your_user_dockerhub/filebeat_custom:latest

# docker push docker.io/your_user_dockerhub/filebeat_custom:latest

one time you created you custom filebeat image, go to root folder of the project and  modify docker-compose.yml file

and change the filebeat.image value for examample:

#  filebeat:
#    image: docker.io/your_user_dockerhub/filebeat_custom:latest


save changes and run:

# docker-compopse up


