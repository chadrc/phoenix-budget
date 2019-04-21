pipeline {
    agent none

    stages {
        stage('Setup') {
            agent {
                docker { image 'elixir' }
            }

            steps {
                sh 'mix deps.get --only prod'
            }
        }

        stage('Build') {
            parallel {
                stage('Server') {
                    agent {
                        docker { image 'elixir' }
                    }

                    steps {
                        sh 'MIX_ENV=prod mix compile'
                    }
                }

                stage('Assets') {
                    agent {
                        docker { image 'node' }
                    }

                    steps {
                        sh 'cd assets && npm run deploy'
                    }
                }
            }
        }

        stage('Digest') {
            agent {
                docker { image 'elixir' }
            }

            steps {
                sh 'mix phx.digest'
            }
        }
    }
}
