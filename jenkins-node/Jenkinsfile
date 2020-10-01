pipeline {
    agent {label 'master'}

    options {
        skipDefaultCheckout true
    }

    stages {
        stage('Code Checkout') {
            steps {
                sh 'rm -rf *'

                checkout([
                    $class: 'GitSCM',
                    branches: [
                        [name: "*/master"]
                    ],
                    doGenerateSubmoduleConfigurations: false,
                    extensions: [],
                    submoduleCfg: [],
                    userRemoteConfigs: [
                        [
                            url: "https://github.com/leonardomoraesmendes/jenkins-aws.git",
                        ]
                    ]
                ])
            }
        }
        

        stage('terraform validate') {
            steps {
                withCredentials([sshUserPrivateKey(credentialsId: 'jenkins', keyFileVariable: 'KEY')]) {
                    sh """
                    cd  jenkins-node
                    [ -d ~/.ssh ] || mkdir ~/.ssh
                    cp \$(echo ${KEY}) ~/.ssh/id_rsa
                    tfenv install
                    terraform init -no-color
                    terraform validate -no-color
                    terraform plan -no-color
                    """
                }
            }
        }

        stage('terraform apply') {
            input {
                message "Criar o novo template do nodes do Jenkins?"
                ok "Sim"
            }
            steps {
                sh """
                    cd  jenkins-node
                    terraform destroy -auto-approve -no-color
                    terraform apply -auto-approve -no-color
                """
            }
        }
        
        stage('CleanWorkspace') {
            steps {
                cleanWs()
            }
        }
    }
}