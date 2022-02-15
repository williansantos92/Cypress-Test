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

        stage('img docker') {
           bat "docker -v"
        }
    }  