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
=====
    pipeline {
    agent any
    stages {
        stage('Create Timestamp') {
            steps {
                script {
                    def timestamp = new Date().format("yyyyMMddHHmmss", TimeZone.getTimeZone('UTC'))
                    println "Timestamp: ${timestamp}"
                    
                    // Use the timestamp in your AzCopy command
                    def destinationUrl = "https://destinationazuresaaccount-url/${timestamp}/"
                    sh """
                        azcopy cp "https://sourceazuresaaccount-url" "${destinationUrl}" --recursive
                    """
                }
            }
        }
    }
}pipeline {
    agent any
    stages {
        stage('Create Timestamp') {
            steps {
                script {
                    def timestamp = new Date().format("yyyyMMddHHmmss", TimeZone.getTimeZone('UTC'))
                    println "Timestamp: ${timestamp}"
                    
                    // Use the timestamp in your AzCopy command
                    def destinationUrl = "https://destinationazuresaaccount-url/${timestamp}/"
                    sh """
                        azcopy cp "https://sourceazuresaaccount-url" "${destinationUrl}" --recursive
                    """
                }
            }
        }
    }
}
