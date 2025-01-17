#Stage 1: Checkout source code
FROM alpine/git as checkout
WORKDIR /app
RUN git clone https://github.com/artisantek/java-example.git

# Stage 2: Build the Java application
FROM maven:amazoncorretto as build
WORKDIR /app
COPY  . .
RUN mvn clean install

# Stage 3: Deploy the application to Tomcat
FROM adhig93/tomcat-conf
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/


                                   
