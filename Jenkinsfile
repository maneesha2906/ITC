pipeline {
    agent any
    environment {
        SCRIPT_PATH = "fetchApiTfl_test.py"
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
}
