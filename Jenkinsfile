node {         
      stage('clonar repositorio') {
            checkout scm    
      }      

    stage('buildar imagem') {
            bat "docker build -t cypresimg ."
        }   

    stage('regressao') {
        bat "docker run -v %cd%/allure-results:/e2e/allure-results cypresimg --spec ./cypress/integration/1-getting-started/todo.spec.js"
    }

    stage('Remove imagem') {
        bat "docker rmi -f cypresimg"
    } 

    stage('Report') {
            script {
                allure([
                includeProperties: false,
                jdk: '',
                properties: [],
                reportBuildPolicy: 'ALWAYS',
                results: [[path: '/allure-results']]
                ])
            }
        }   

    }  