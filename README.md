# Chatter

Este projeto, desenvolvido na disciplina de Sistemas Distribuídos, implementa um chat em tempo real que conecta um **cliente Web** a um **cliente Desktop** utilizando **middleware em Java com RMI (Remote Method Invocation)**.

Este repositório contém exclusivamente o código do **cliente Web**.

  - **Cliente Desktop**: [link para o repositório](https://github.com/KemilyRezende/Chatter-Cliente-Desktop)
  - **Middleware**: [link para o repositório]

## Sobre o Projeto

O Chatter permite a troca de mensagens em tempo real entre os usuários, utilizando RMI para comunicação entre os clientes Web e Desktop.
  - **Frontend**: Desenvolvido com **JSP** e **CSS**.
  - **Backend**: Baseado em **Jakarta EE**, utilizando **servlets** para interação com o **middleware**.
  - **Middleware**: Responsável pela comunicação entre os clientes via **Java RMI**.

### Funcionalidades

- Troca de mensagens em tempo real.
- Personalização - escolher o avatar e cor das mensagens na tela de login.

## Estrutura de Arquivos

### Frontend

O frontend é estruturado em três arquivos **JSP**: 

  - **`index.jsp`** - Tela de login.
  - **`chatter.jsp`** - Tela principal do chat, onde é possível ler e enviar mensagens.
  - **`chat.jsp`** - `iframe` dentro do arquivo `chatter.jsp` que carrega as mensagens dinamicamente.

### Integração com o Middleware (RMI)

A comunicação com o middleware é feita através do arquivo `rmiWebInterface.java`, que permite enviar e recuperar mensagens utilizando **RMI**.

## Visualização Frontend

<p align="center">
  <img src="https://github.com/KemilyRezende/Chatter/blob/main/telas/login.png" alt="Tela de login">
</p>
<p align="center"><em>Tela de login</em></p>

<p align="center">
  <img src="https://github.com/KemilyRezende/Chatter/blob/main/telas/chat.png" alt="Tela do chat">
</p>
<p align="center"><em>Tela do chat</em></p>


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

Para que o chat funcione corretamente, o middleware RMI precisa estar rodando. Caso contrário, não será possível enviar ou visualizar mensagens.
