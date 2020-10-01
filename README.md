# jenkins-aws
## Descrição

Projeto DEMO para live sobre Acelerando os Builds utilizando Jenkins e AWS

### Pre requisitos
- Ter uma conta na AWS
- Credenciais da AWS configurada
  ```
  export AWS_ACCESS_KEY_ID=""
  export AWS_SECRET_ACCESS_KEY=""
  export AWS_DEFAULT_REGION=""
  ```
- Criar um bucket para armazenar o state de todos os terraforms e atualizar nos arquivos providers:
  baseline/provider.tf
  jenkins-master/provider.tf
  jenkins-node/provider.tf
  ```
  terraform {
    backend "s3" {
      bucket = "jenkins-state-demo" # Inserir o novo nome aqui
  ```

- [tfenv](https://github.com/tfutils/tfenv) instalado

- Chave ssh geradas
  ```
  ssh-keygen
  ls ~/.ssh/
  id_rsa id_rsa.pub
  ```

