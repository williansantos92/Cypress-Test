node {         
      stage('Clone repository') {
            checkout scm    
      } 

      stage('node v') {
            bat "node -v"
      }

      stage('checkout') {
            checkout scm
        }

    stage('buildar imagem') {
            bat "docker build -t cypresimg ."
        }

        stage('regressao') {
            bat "docker run cypresimg --spec ./cypress/integration/1-getting-started/todo.spec.js"
        }

        stage('Remove imagem') {
            bat "docker rmi -f cypresimg"
        }

    }  