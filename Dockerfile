# pulling from the base image
FROM lolhens/baseimage-openjre
# Copy the file
ADD target/springbootApp.jar springbootApp.jar

# expose port 8085 which is the container port
EXPOSE 8085
#run this command every container is started
ENTRYPOINT ["java", "-jar", "springbootApp.jar"]
