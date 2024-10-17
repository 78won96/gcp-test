FROM openjdk:17-alpine
ARG JAR_FILE=JAR_FILE_MUST_BE_SPECIFIED_AS_BUILD_ARG
COPY ${JAR_FILE} docker-cicd-test-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java", "-jar", "/docker-cicd-test-0.0.1-SNAPSHOT.jar"]