pipeline {
    agent none

    stages {
        stage('Deps') {
            agent {
                dockerfile {
                    filename 'Dockerfile'
                    dir 'ci-container'
                }
            }

            steps {
                sh 'mix deps.get --only prod'
                sh 'mix compile'
            }
        }

        stage('Assets') {
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
