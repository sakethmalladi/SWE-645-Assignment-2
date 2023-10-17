FROM openjdk:latest
FROM tomcat:latest

# Remove the default Tomcat applications
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file into the Tomcat webapps directory
COPY StudentSurvey.war /usr/local/tomcat/webapps/StudentSurvey.war

# Expose the Tomcat HTTP port (default is 8080)
EXPOSE 8080

# Stop and then tart Tomcat
CMD ["catalina.sh", "stop"]
CMD ["catalina.sh", "run"]