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
            bat "docker run -it cypresimg"
        }

        stage('Remove imagem') {
            bat "winpty docker rmi -f cypresimg"
        }

    }  