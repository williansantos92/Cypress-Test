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
            bat "winpty docker run -it cypresimg"
        }

        stage('Remove imagem') {
            bat "docker rmi -f cypresimg"
        }

    }  