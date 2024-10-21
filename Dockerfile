FROM maven:3-openjdk-17 as build
WORKDIR /app
COPY src /app/src/
COPY pom.xml petclinic-ermodel.png /app/
RUN mvn clean install -DskipTests && \
    mvn -B help:evaluate -Dexpression=project.artifactId | grep -E -v '(^\[|Download\w+:)' > artifactId.txt && \
    mvn -B help:evaluate -Dexpression=project.version | grep -E -v '(^\[|Download\w+:)' > version.txt

FROM openjdk:17-jdk-alpine as final
WORKDIR /app
COPY run.sh /app/
COPY --from=build /app/pom.xml /app/artifactId.txt /app/version.txt /app/target/*.jar /app/

#CMD ["java", "-jar", "/app/*.jar"]
CMD ["/app/run.sh"]
