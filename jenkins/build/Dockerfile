# Creates a JDK docker container that runs the JAR file obtained with the build/mvn.sh 
FROM  arm64v8/amazoncorretto:11

RUN mkdir /app

COPY *.jar /app/app.jar

CMD java -jar /app/app.jar