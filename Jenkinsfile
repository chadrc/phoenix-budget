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
                sh 'cd scripts && npm install && npm run gen-prod'
                sh 'mix deps.get --only prod'
            }
        }

        stage('Build') {
            steps {
                sh 'MIX_ENV=prod mix compile'
                sh 'cd assets && npm install && npm run deploy'
                sh 'mix phx.digest'
            }
        }
    }
}
