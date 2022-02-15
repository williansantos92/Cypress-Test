import org.jenkinsci.plugins.workflow.steps.FlowInterruptedException

node {
        stage('Preparation') {
            checkout scm
        }

        stage('Build and create docker image') {
           sh "node --version"
        }

        stage('Test') {
            sh "ls -lha"
        }       
}