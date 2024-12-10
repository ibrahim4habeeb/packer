pipeline {
    agent any
    parameters {
        string(name: 'jenkins_name', defaultValue: '', description: 'Enter the Jenkins name')
    }
    stages {
        stage('Print Jenkins Name') {
            steps {
                script {
                    if (params.jenkins_name) {
                        echo "Running for Jenkins name: ${params.jenkins_name}"
                    } else {
                        error("Parameter 'jenkins_name' is not defined!")
                    }
                }
            }
        }
    }
}
