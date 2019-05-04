pipeline {
    agent none

    stages {
        stage('Setup') {
            agent {
                docker {
                    image 'node'
                }
            }
            steps {
                sh 'cd scripts && npm install && npm run gen-prod'
                sh 'cd assets && npm install && npm run deploy'
            }
        }

        stage('Build') {
            steps {
                buildImage name: 'budget-app'
            }
        }
    }
}
