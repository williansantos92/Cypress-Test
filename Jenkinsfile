webhookURLDicord = "https://discord.com/api/webhooks/831892627271843840/VCR8-bVIAHCc5j8u9hXugUfIFNxzoMBZ18-zUrwxM3wYUlGWCqe0DGTOee4bxXXdhPRF"
imgStartDiscord = "https://cdn.xxl.thumbs.canstockphoto.com.br/ok-desenhos_csp15025439.jpg"
imgErroDiscord = "https://cdn.pixabay.com/photo/2017/02/12/21/29/false-2061132_960_720.png"

node {     
    stage('Enviar notificacao para o discord') {
        discordSend description: "Iniciando regressao", title:"regressao", webhookURL: webhookURLDicord, result: "SUCCESS", link: BUILD_URL
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

        
        }

    if ("${currentBuild.currentResult}" == 'SUCCESS') {
        discordSend description: "Testes finalizados com sucesso", title:"regressao", webhookURL: webhookURLDicord, thumbnail: imgStartDiscord, result: "SUCCESS", link: BUILD_URL
    }

    else if ("${currentBuild.currentResult}" == 'FAILURE') {
        discordSend description: "Testes finalizados com erro", title:"regressao", webhookURL: webhookURLDicord, thumbnail: imgErroDiscord, result: "FAILURE", link: BUILD_URL
    }

    else if ("${currentBuild.currentResult}" == 'ABORTED') {
        discordSend description: "Testes finalizados manualmente", title:"regressao", webhookURL: webhookURLDicord, thumbnail: imgErroDiscord, result: "FAILURE", link: BUILD_URL
    }

 