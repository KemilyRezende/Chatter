<%-- 
    Document   : chat
    Created on : Jan 28, 2025, 11:53:11 AM
    Author     : kemily
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@page import="java.io.File"%>
        <%@page import="pacote.rmiWebInterface"%>
        <%@page import="java.rmi.Naming"%>
        <%@page import="java.io.FileReader"%>
        <%@page import="java.io.BufferedReader"%>
        <link rel="stylesheet" href="./styles/chat-LightPurple.css">
        <meta http-equiv="refresh" content="3; chat.jsp">
        <title>Chat</title>
    </head>
    <body>
        <div class="display">
          <%
            try{
                rmiWebInterface objRmi = (rmiWebInterface) Naming.lookup("rmi://127.0.0.1:7777/ServidorChatterWeb"); // Ao conectar servidor e cliente em diferentes dispositivos é necessario mudar para o IP do servidor
                out.print(objRmi.showMessagesWeb());
            } catch(Exception e){
                out.print("Erro no servidor ao recuperar pontuacoes: " + e.getMessage());
                e.printStackTrace();
            }
            
          %>
          </div>
    </body>
</html>
