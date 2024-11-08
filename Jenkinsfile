pipeline {
    agent any
    tools { maven 'Maven' }
    stages {
        stage('Build') {
            steps {
                git 'https://github.com/anuragh28/mywebapp.git'
                sh 'mvn clean package'
            }
        }
        stage('Deploy') {
            steps {
                deploy adapters: [tomcat9(credentialsId: 'admin', path: '', url: 'http://localhost:9090')], contextPath: '/', war: '**/*.war'
            }
        }
    }
}
