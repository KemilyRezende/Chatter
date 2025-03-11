# Chatter

Este projeto, desenvolvido na disciplina de Sistemas Distribuídos, implementa um chat em tempo real que conecta um cliente Web a um cliente Desktop utilizando middleware em Java. Este repositório aborda especificamente o cliente Web.
  - **Cliente Desktop**: (link)
  - **Middleware**: (link)

O sistema utiliza **Jakarta EE** para a aplicação Web e **Java** para viabilizar a comunicação em tempo real entre os clientes. O frontend foi desenvolvido com **JSP** e **CSS**, enquanto a interação com o middleware foi implementada em **Java**.

## Como executar

Antes de iniciar, certifique-se de ter instalado:
  - **Java 21**
  - **Maven**
  - **Jakarta EE 10.0.0**
  - **Java EE API (versão 8.0)**
  - **Servlet API (versão 4.0.1)**
  - **Tomcat (versão 7)**

### Passos para rodar o projeto

1. Clone esse repositório e acesse a pasta:
  ```bash
    git clone https://github.com/KemilyRezende/Chatter.git
    cd Chatter/Chatter
  ```
2. Compile e empacote o projeto:
  ```bash
    mvn clean package
  ```
3. Execute o projeto
  ```bash
    mvn tomcat7:run
  ```
4. Acesse a aplicação
  ```bash
    http://localhost:8080/Chatter
  ```

#### Observações

Caso o middleware não esteja rodando com o servidor web ativado não será possivel enviar ou visualizar mensagens.
