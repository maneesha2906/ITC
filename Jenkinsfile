pipeline {
    agent any
    environment {
        SCRIPT_PATH = "fetchApiTfl_test.py"
    }
    stages {
        stage('unit test for fetch api tfl test git') {
            steps {
                script {
                    sh "python3 ${SCRIPT_PATH}"
                }
            }
        }
    }
}
