<%-- 
    Document   : chatter
    Created on : Jan 27, 2025, 8:36:14 PM
    Author     : kemily
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./styles/chatter-LightPurple.css">
        <%@page import="java.io.File"%>
        <%@page import="java.io.FileWriter"%>
        <%@page import="pacote.rmiWebInterface"%>
        <%@page import="java.rmi.Naming"%>
        <title>Chatter</title>
    </head>
    <body>
        <%
            String profile = request.getParameter("profile");
            String nick = request.getParameter("nick");
            String color = request.getParameter("color");

            if (profile != null && !profile.isEmpty()) {
                session.setAttribute("profile", profile);
            }

            if (nick != null && !nick.isEmpty()) {
                session.setAttribute("nick", nick);
            }

            if (color != null && !color.isEmpty()) {
                session.setAttribute("color", color);
            }

            // Define valores default, se necessário
            if (session.getAttribute("profile") == null) {
                session.setAttribute("profile", "man");
            }

            if (session.getAttribute("color") == null) {
                session.setAttribute("color", "purple");
            }
        %>
        
        <header>
            <div class="userData">
                <%
                    if(session.getAttribute("profile").toString().equals("man")){
                    out.println("<img src='./images/profiles/manPurple.svg'/>");
                    } else{
                        out.println("<img src='./images/profiles/womanPurple.svg'/>");
                    }
                %>
                <h1><% out.println(session.getAttribute("nick").toString()); %></h1>
            </div>
            <div class="logo">
                <img src="./images/logos/logoWhite.svg" alt="alt"/>
            </div>
        </header>
            <iframe src="chat.jsp">    
        </iframe>
        <footer>
            <form name="frmMsg">
                <div class="message">
                    <div class="text">
                        <label htmlFor="text">Message:</label>
                        <input type="text" name="text"/>
                    </div>
                    <div class="selectors">
                        <div>
                            <label htmlFor="mode">Action:</label>
                            <select name="mode">
                                <option value="fala">Fala</option>
                                <option value="grita">Grita</option>
                                <option value="sussurra">Sussurra</option>
                            </select>
                        </div>
                        <div>
                            <label htmlFor="emoji">Emogi:</label>
                            <select name="emoji">
                                <option value="000"></option>
                                <option value="1F601">😁</option>
                                <option value="1F602">😂</option>
                                <option value="1F605">😅</option>
                                <option value="1F60A">😊</option>
                                <option value="1F60D">😍</option>
                                <option value="1F618">😘</option>
                                <option value="1F603">😃</option>
                                <option value="1F616">😖</option>
                                <option value="1F610">😐</option>
                                <option value="1F611">😑</option>
                                <option value="1F617">😗</option>
                                <option value="1F619">😙</option>
                            </select>
                        </div>
                        
                    </div>
                </div>
                <div class="submit">
                    <input type="submit" value="Send" name="send"/>
                </div>
            </form>
            <%
                if(request.getParameter("send") != null){
                    String webMsg = "<div class='msg'><img class='profile' src='";
                    String deskMsg = "[" + session.getAttribute("nick").toString() + " (" + request.getParameter("mode").toString() + ")]: " + request.getParameter("text").toString() + ";";
                    
                    // Pega imagem
                    if(session.getAttribute("profile").toString().equals("man")){
                        webMsg += "./images/profiles/manPurple.svg'/>";
                    }
                    else{
                        webMsg += "./images/profiles/womanPurple.svg'/>";
                    }
                    
                    // Cria bloco de texto
                    webMsg += "<div class='card'>";
                    if(session.getAttribute("color").toString().equals("green")){
                        webMsg += "<h1 class='greenTitle'>" + session.getAttribute("nick").toString() + " (" + request.getParameter("mode").toString() + ")</h1>";
                        webMsg += "<p class='greenText'>" + request.getParameter("text").toString();
                        if (!request.getParameter("emoji").toString().equals("000")){
                            webMsg += " &#x" + request.getParameter("emoji").toString() + ";";
                        }
                        webMsg += "</p></div></div>";
                    }
                    if(session.getAttribute("color").toString().equals("purple")){
                        webMsg += "<h1 class='purpleTitle'>" + session.getAttribute("nick").toString() + " (" + request.getParameter("mode").toString() + ")</h1>";
                        webMsg += "<p class='purpleText'>" + request.getParameter("text").toString();
                        if (!request.getParameter("emoji").toString().equals("000")){
                            webMsg += " &#x" + request.getParameter("emoji").toString() + ";";
                        }
                        webMsg += "</p></div></div>";
                    }
                    if(session.getAttribute("color").toString().equals("blue")){
                        webMsg += "<h1 class='blueTitle'>" + session.getAttribute("nick").toString() + " (" + request.getParameter("mode").toString() + ")</h1>";
                        webMsg += "<p class='blueText'>" + request.getParameter("text").toString();
                        if (!request.getParameter("emoji").toString().equals("000")){
                            webMsg += " &#x" + request.getParameter("emoji").toString() + ";";
                        }
                        webMsg += "</p></div></div>";
                    }
                    
                    try{
                        rmiWebInterface objRmi = (rmiWebInterface) Naming.lookup("rmi://127.0.0.1:7777/ServidorChatterWeb"); // Ao conectar servidor e cliente em diferentes dispositivos é necessario mudar para o IP do servidor
                        if(!objRmi.sendMessage(webMsg, deskMsg)){
                            out.print("Error: Couldn't send message.");
                        }
                    } catch(Exception e){
                        out.print("Error: Server error" + e.getMessage());
                        e.printStackTrace();
                    }
                }
            %>
        </footer>
    </body>
</html>
