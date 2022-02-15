node {
        stage('Preparation') {
            checkout scm
        }

        stage('Build and create docker image') {
           sh "node --version"
        }

        stage('Build and create docker image') {
            docker.build("myimage:last")
        }

        stage('Test') {
            sh "ls -lha"
        }   
}