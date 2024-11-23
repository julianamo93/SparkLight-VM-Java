# Etapa 1: Build da aplicação
FROM gradle:7.6-jdk17 AS builder
WORKDIR /app
COPY . .
RUN gradle clean build --no-daemon

# Etapa 2: Imagem final para execução
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=builder /app/build/libs/sparklight-api-0.0.1-SNAPSHOT.war
CMD ["java", "-war", "app.war"]
EXPOSE 8080
