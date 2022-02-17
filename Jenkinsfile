webhookURLDicord = "https://discord.com/api/webhooks/943562620596797481/UT9RlnvV5r2JS1pKheevxN8ge1Prjukm4MJUA39zNr1VF0FnKczeBkYX5PMJQc7h9I17"
imgStartDiscord = "https://cdn.xxl.thumbs.canstockphoto.com.br/ok-desenhos_csp15025439.jpg"
imgErroDiscord = "https://cdn.pixabay.com/photo/2017/02/12/21/29/false-2061132_960_720.png"
testsOk = true

node {    

    stage('Start notificacao no discord'){
        discordSend description: "Iniciando regressao", title:"regressao", webhookURL: webhookURLDicord, result: "SUCCESS", link: BUILD_URL
    }
      stage('clonar repositorio') {
            checkout scm    
      }      

    stage('buildar imagem') {
            bat "docker build -t cypresimg ."
        }   
    try {
        stage('regressao') {
            bat "docker run -v ${WORKSPACE}/allure-results:/e2e/allure-results cypresimg --spec ./cypress/integration/1-getting-started/todo.spec.js --env allure=true"
        }
    } catch (e){
        echo e.toString()
        testsOk = false
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

        stage('Dispara finalizacao no discord') 
            if ("${currentBuild.currentResult}" == 'SUCCESS' && testsOk == true) {
                discordSend description: "Testes finalizados com sucesso", title:"regressao", webhookURL: webhookURLDicord, thumbnail: imgStartDiscord, result: "SUCCESS", link: BUILD_URL
            } else  {
                discordSend description: "Testes finalizados com erro", title:"regressao", webhookURL: webhookURLDicord, link: BUILD_URL
             }
         
            bat  "RD/s/q allure-results"
        
    }

   





 