node {
        stage('Preparation') {
            checkout scm
        }

        stage('Build and create docker image') {
           sh "node --version"
        }

        stage('Build and create docker image') {
            def buildedImage = docker.build("${RELEASE}:${VERSION}")
        }

        stage('Test') {
            sh "ls -lha"
        }   
}