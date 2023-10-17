pipeline {
    agent any
    environment {
        DOCKERHUB_PASS = credentials('dockerhub')
    }
    stages {
        stage('Building the Student Survey image') {
            steps {
                script {
                    checkout scm
                    sh 'rm -rf *war'
                    sh 'jar -cvf StudentSurvey.war index.html survey.html image.jpg '
                    sh 'echo ${BUILD_TIMESTAMP}'
                    sh 'docker login -u smalladi44 -p saketh123'
                    def customImage = docker.build('smalladi44/studentsurvey:0.1')
                }
            }
        }
        stage('Pushing Image to Dockerhub') {
            steps {
                script {
                    sh 'docker push smalladi44/studentsurvey:0.1'
                }
            }
        }
    }
}
