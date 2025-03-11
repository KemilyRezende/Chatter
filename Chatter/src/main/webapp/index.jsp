<%-- 
    Document   : index
    Created on : Jan 27, 2025, 7:28:37 PM
    Author     : kemily
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./styles/index-LightPurple.css">
        <title>Chatter - Home</title>
    </head>
    <body>
        <div class="box">
            <div class="cover">
                <img src="./images/logos/logoWhite.svg">
            </div>
            <div class="login">
                <h1 class="name">Chatter</h1>
                <form class="form" name="frmLogin" action="chatter.jsp" method="POST">
                    <label class="label" htmlFor="nick">Nickname:</label>
                    <input type="text" class="inputText" id="nick" name="nick"> 
                    <label htmlFor="profile" class="label">Avatar:</label>
                    <div className="boxProfiles">
                        <label>
                            <input type="radio" name="profile" class="radio" value="man"/>
                            <img src="./images/profiles/manPurple.svg" alt="Man Avatar" class="radioImage"/>
                        </label>
                        <label>
                            <input type="radio" name="profile" class="radio" value="woman"/>
                            <img src="./images/profiles/womanPurple.svg" alt="Woman Avatar" class="radioImage"/>
                        </label>
                    </div>
                    <label htmlFor="color" class="label">Color:</label>
                    <div class="boxColors">
                        <label>
                            <input type="radio" name="color" id="blue" value="blue"/>
                            <span>Blue</span>
                        </label>
                        <label>
                            <input type="radio" name="color" id="purple" value="purple"/>
                            <span>Purple</span>
                        </label>
                        <label>
                            <input type="radio" name="color" id="green" value="green"/>
                            <span>Green</span>
                        </label>
                    </div>
                    <input type="submit" class="button" value="Login" />
                </form>
            </div>
        </div>
    </body>
</html>
