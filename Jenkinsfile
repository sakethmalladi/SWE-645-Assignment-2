pipeline {
    environment {
        registry = "smalladi44/studentsurvey"
        registryCredential = 'dockerhub'
        def dateTag = new Date().format("yyyyMMdd-HHmmss")
    }

    agent any

    stages {
        stage('Building war') {
            steps {
                script {
                    sh 'rm -rf *.war'
                    sh 'jar -cvf 645.war index.html survey.html image.jpg dept.html'
                    docker.withRegistry('', 'registryCredential') {
                        def img = docker.build("smalladi44/studentsurvey:${dateTag}")
                    }
                }
            }
        }

        stage('Pushing latest code to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('', 'registryCredential') {
                        def image = docker.build("smalladi44/studentsurvey:0.1:${dateTag}","--no-cache")
                    }
                }
            }
        }
    }
}

stage('Deploying to single node in Rancher') {
    steps {
        script {
            sh 'kubectl set image deployment/deploy1 container=smalladi44/studentsurvey:' + dateTag
            sh 'kubectl set image deployment/loadbal container=smalladi44/studentsurvey:' + dateTag
        }
    }
}

post {
    always {
        sh 'docker logout'
    }
}

