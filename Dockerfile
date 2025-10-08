# ---------- build stage ----------
FROM maven:3.9-eclipse-temurin-21 AS build
WORKDIR /app
COPY pom.xml ./
COPY src ./src
RUN mvn -q -DskipTests clean package

# ---------- run stage ----------
FROM eclipse-temurin:21-jre
WORKDIR /app
# copia o jar gerado no stage de build
COPY --from=build /app/target/*.jar /app/app.jar

# porta da aplicação
EXPOSE 8080

# profile prod (usa application-prod.properties)
ENV SPRING_PROFILES_ACTIVE=prod

# health / graceful shutdown
ENV JAVA_OPTS="-XX:+ExitOnOutOfMemoryError"

ENTRYPOINT ["sh", "-c", "java  -jar /app/app.jar"]
