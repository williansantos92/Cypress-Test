webhookURLDicord = "https://discord.com/api/webhooks/831892627271843840/VCR8-bVIAHCc5j8u9hXugUfIFNxzoMBZ18-zUrwxM3wYUlGWCqe0DGTOee4bxXXdhPRF"
imgStartDiscord = "https://cdn.xxl.thumbs.canstockphoto.com.br/ok-desenhos_csp15025439.jpg"

node {     
    stage('Enviar notificacao para o discord') {
        discordSend description: "Iniciando regressao", title:"regressao", webhookURL: webhookURLDicord, thumbnail: imgStartDiscord, result: currentBuild.currentResult
    }
      stage('clonar repositorio') {
            checkout scm    
      }      

    stage('buildar imagem') {
            bat "docker build -t cypresimg ."
        }   

    stage('regressao') {
        bat "docker run -v ${WORKSPACE}/allure-results:/e2e/allure-results cypresimg --spec ./cypress/integration/1-getting-started/todo.spec.js --env allure=true"
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

        post('teste pos build'){
            ALWAYS{
            echo "teste pos build"
            }
        }

    }  