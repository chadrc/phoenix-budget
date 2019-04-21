pipeline {
    agent {
        dockerfile {
            filename 'Dockerfile'
            dir 'ci-container'
        }
    }

    stages {
        stage('Setup') {
            steps {
                sh 'mix deps.get --only prod'
            }
        }

        stage('Build') {
            steps {
                sh 'MIX_ENV=prod mix compile'
                sh 'cd assets && npm run deploy'
                sh 'mix phx.digest'
            }
        }
    }
}
