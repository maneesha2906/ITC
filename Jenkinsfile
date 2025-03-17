pipeline {
    agent any
    environment {
        SCRIPT_PATH = "unitest.py"
    }
    stages {
        stage('unit test for fetch api tfl') {
            steps {
                script {
                    sh "python3 ${SCRIPT_PATH}"
                }
            }
        }
    }
    triggers {
        cron('H/30 * * * *')  // Runs every 30 minutes
    }
}
