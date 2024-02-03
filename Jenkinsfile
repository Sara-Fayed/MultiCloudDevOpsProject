pipeline {
    agent any

    environment {
        //DOCKER_HUB_CREDENTIALS = 'sarafayed'
        DOCKER_IMAGE_NAME = 'new_image'
        MAIN_BRANCH = 'dev'
        DOCKER_REGISTRY = 'sarafayed'
        OPENSHIFT_PROJECT = 'sara'
        OPENSHIFT_SERVER = 'https://api.ocpuat.devopsconsulting.org:6443'
        APP_SERVICE_NAME = 'task6_openshift-app'
        APP_PORT = '8080'
        APP_HOST_NAME = 'task6_openshift-app.apps.ocpuat.devopsconsulting.org'
        SONARQUBE_URL = 'http://localhost:9000' // Replace with your SonarQube URL
        imageTagApp = "build-${BUILD_NUMBER}-app"
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    git branch: 'dev', url: 'https://github.com/Sara-Fayed/MultiCloudDevOpsProject/'
                }
            }
        }

        stage('Unit Test') {
            steps {
                script {
                    // Run unit tests (if applicable)
                    sh 'chmod +x ./gradlew'
                    sh './gradlew test'
                }
            }
        }

        stage('SonarQube Test') {
            steps {
                // Execute SonarQube analysis
                withSonarQubeEnv('SonarQube Server') {
                    sh "./gradlew sonar"
                }
            }
        }

        stage('Build and Dockerize') {
            steps {
                // Build your application (adjust this based on your build tool, e.g., Maven, Gradle)

                // Build a Docker image
                sh 'chmod +x gradlew'
                sh 'docker build -t ${DOCKER_REGISTRY}:${imageTagApp} .'
                sh "docker tag ${DOCKER_REGISTRY}:${imageTagApp} docker.io/${DOCKER_REGISTRY}/${DOCKER_IMAGE_NAME}:${imageTagApp}"
            }
        }

        stage('Push Docker Image') {
            steps {
                sh "echo \${DOCKER_REGISTRY_PASSWORD} | docker login -u \${DOCKER_REGISTRY_USERNAME} --password-stdin"
                sh "docker push docker.io/${DOCKER_REGISTRY}/${DOCKER_IMAGE_NAME}:${imageTagApp}"
            }
        }

        stage('Deploy on OpenShift') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'openshift', variable: 'OPENSHIFT_SECRET')]) {
                        sh "oc login --token=\${OPENSHIFT_SECRET} --server=\${OPENSHIFT_SERVER} --insecure-skip-tls-verify"
                    }
                    sh "oc project \${OPENSHIFT_PROJECT}"
                    sh "oc new-app \${DOCKER_REGISTRY}/${DOCKER_IMAGE_NAME}:${BUILD_NUMBER}"
                    sh "oc create route edge --service \${APP_SERVICE_NAME} --port \${APP_PORT} --hostname \${APP_HOST_NAME} --insecure-policy Redirect"
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline executed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
