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
                    def customImage = docker.build('smalladi44/ssurvey645:${BUILD_TIMESTAMP}')
                }
            }
        }
        stage('Pushing Image to Dockerhub') {
            steps {
                script {
                    sh 'docker push smalladi44/ssurvey645:${BUILD_TIMESTAMP}'
                }
            }
        }
        stage('Deploying to Rancher as single pod') {
            steps {
                sh 'kubectl set image deployment/stusrveypipeline stusrveypipeline=smalladi44/ssurvey645:${BUILD_TIMESTAMP} -n jenkins-pipeline'
            }
        }
        stage('Deploying to Rancher as with load balancer') {
            steps {
                sh 'kubectl set image deployment/studentsturvey645-lb studentsturvey645-lb=smalladi44/ssurvey645:${BUILD_TIMESTAMP} -n jenkins-pipeline'
            }
        }
    }
}
