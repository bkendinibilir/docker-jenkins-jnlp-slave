properties([
    pipelineTriggers([
        cron('H H(3-6) * * *'), 
        pollSCM('* * * * *')
    ])
])

node('docker') {
        stage('Build') {
            checkout scm
            sh 'REGISTRY=docker.io/bkendinibilir make build'
        }
        stage('Push') {
            sh 'REGISTRY=docker.io/bkendinibilir make push'
        }
}