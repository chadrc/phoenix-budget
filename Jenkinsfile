pipeline {
    agent none

    stages {
        stage('Build') {
            agent {
                dockerfile {
                    filename 'Dockerfile'
                    dir 'ci-container'
                }
            }

            steps {
                sh 'cd scripts && npm install && npm run gen-prod'
                sh 'mix deps.get --only prod'
                sh 'mix compile'
                sh 'cd assets && npm install && npm run deploy'
                sh 'mix phx.digest'
            }
        }

        stage('Bundle') {
            agent {
                docker {
                    image 'docker'
                }
            }

            steps {
                buildImage name: 'budget-app'
            }
        }
    }
}
