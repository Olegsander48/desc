# Этап 1 - сборка проекта в jar
FROM maven:3.9-amazoncorretto-21-debian AS maven
WORKDIR /desc
COPY . /desc
RUN mvn install

# Этап 2 - указание как запустить проект
FROM amazoncorretto:21
WORKDIR /desc
COPY --from=maven /desc/target/desc.jar desc.jar
CMD ["java", "-jar", "desc.jar"]