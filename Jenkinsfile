node {         
      stage('clonar repositorio') {
            checkout scm    
      }      

    stage('buildar imagem') {
            bat "docker build -t cypresimg ."
        }

    stage('test') {
        bat "dir *. * /s"
    }

    stage('regressao') {
        bat "docker run cypresimg --spec ./cypress/integration/1-getting-started/todo.spec.js"
    }

    stage('Remove imagem') {
        bat "docker rmi -f cypresimg"
    }

    stage('test') {
            bat "dir *. * /s"
        }

    }  