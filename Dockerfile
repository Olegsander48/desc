FROM maven:3.9-amazoncorretto-21-debian

RUN mkdir desc

WORKDIR desc

COPY . .

RUN mvn install

CMD ["java", "-jar", "target/desc.jar"]