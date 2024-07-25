<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chats</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    <link rel="icon" href="images/chat.png" type="image/x-icon">
    <link rel="stylesheet" href="css/header_footer.css">
    <link rel="stylesheet" href="css/users_chatroom.css">
</head>
<body>
    <nav>
        <div class="nav-bar">
            <i class="fas fa-bars sidebarOpen"></i>
            <span class="logo navLogo"><a href="user_lists.jsp">My Charts</a></span>
            <div class="menu">
                <div class="logo-toggle">
                    <span class="logo"><a href="user_lists.jsp">My Charts</a></span>
                    <i class="fas fa-xmark siderbarClose"></i>
                </div>
    
                <ul class="nav-links">
                    <li><a href="user_lists.jsp">Users</a></li>
                    <li class="chathostory"><a href="history.jsp">History</a></li>
                    <li><a href="updatepassword.jsp">Change Password</a></li>
                    <li><a href="changepic.jsp">Change Picture</a></li>
                    <li><a href="logout.jsp">Logout</a></li>
                    <li>
                        <div class="dark-light">
                            <i class="fas fa-sun sun"></i>
                            <i class="fas fa-moon moon"></i>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="darkLight">
                <div class="dark-light">
                    <i class="fas fa-sun sun"></i>
                    <i class="fas fa-moon moon"></i>
                </div>
            </div>
        </div>
    </nav>
    <!--  Header End -->

    <!-- Main Content Start -->
    <div class="about">
        <div class="container3 main-chatroom">
            <section class="chat-area">
                <header>
                    <%
                        String FROMUSER=(String)session.getAttribute("phoneno");
                        String TOUSER=(String)session.getAttribute("touser");

                        Connection con=null;
                        Statement st=null;
                        ResultSet rs=null;

                        Connection con2=null;
                        Statement st2=null;
                        ResultSet rs2=null;

                        String UFIRSTNAME="" ;
                        String ULASTNAME="" ;
                        String USTATUS="" ;
                        String U_PIC="";

                        String MYFIRSTNAME="" ;
                        String MYLASTNAME="" ;
                        String MYSTATUS="" ;
                        String MY_PIC="";

                        try{
                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/chat_system","root","root");
                            con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/chat_system","root","root");

                            st=con.createStatement();
                            String query="select * from userreg WHERE phoneno='"+TOUSER+"'";
                            rs=st.executeQuery(query);
                            if(rs.next()){
                                UFIRSTNAME=rs.getString("firstname");
                                ULASTNAME=rs.getString("lastname");
                                USTATUS= rs.getString("status");
                                U_PIC=rs.getString("images");
                            }
                            st.close();
                            con.close();
                            rs.close();
                        }
                        catch(Exception exp){
                            out.print("error in dsn :  "+exp.getMessage());
                        }



                        try{
                            st2=con2.createStatement();
                            String query2="select * from userreg WHERE phoneno='"+FROMUSER+"'";
                            rs2=st2.executeQuery(query2);
                            if(rs2.next()){
                                MYFIRSTNAME=rs2.getString("firstname");
                                MYLASTNAME=rs2.getString("lastname");
                                MYSTATUS= rs2.getString("status");
                                MY_PIC=rs2.getString("images");
                            }
                            st2.close();
                            con2.close();
                            rs2.close();
                        }
                        catch(Exception exp){
                            out.print("error in dsn :  "+exp.getMessage());
                        }

                    %>
                    
                    <div class="main-details">
                        <a href="user_lists.jsp" class="back-icon"><i class="fa-solid fa-arrow-left"></i></a>
                        <img src="profile_picture/<%=U_PIC%>" alt="">
                        <div class="details">
                            <span><%=UFIRSTNAME%> <%=ULASTNAME%></span>
                            <p><%=USTATUS%></p>
                        </div>
                    </div>
                        <form method="post" action="clear_chat.jsp">
                        <div class="clear-chat">
                            <div class="more-options"><i class="fa-solid fa-ellipsis-vertical"></i></div>
                            <div class="clearchat-btn">
                                <button type="submit">Clear Chats</button>
                            </div>
                        </div>
                    </form>
                </header>
                <div class="chat-box">

                    <sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/chat_system" user="root" password="root" var="fetch"></sql:setDataSource>
                    <sql:query dataSource="${fetch}" var="rs">select * from ocs${MYPHONENO} where fromuser=${MYPHONENO} and touser=${UPH_NO} or fromuser=${UPH_NO} and touser=${MYPHONENO} order by chatid;</sql:query>

                    <c:forEach var="MESSAGE" items="${rs.rows}">
                        <c:set scope="session" var="CHATS" value="${MESSAGE.message}"></c:set>
                        <c:set scope="session" var="SENDER" value="${MESSAGE.fromuser}"></c:set>
                        <c:set scope="session" var="RECEIVER" value="${MESSAGE.touser}"></c:set>

                        <c:if test="${SENDER eq MYPHONENO}">
                            <div class="chat outgoing">
                                <div class="details">
                                    <p>${CHATS}</p>
                                </div>
                                <img src="profile_picture/<%=MY_PIC%>" alt="">
                            </div>
                        </c:if>
                        <c:if test="${RECEIVER eq MYPHONENO}">
                            <div class="chat incoming">
                                <img src="profile_picture/<%=U_PIC%>" alt="">
                                <div class="details">
                                    <p>${CHATS}</p>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>

                </div>
                <form action="chatroom_con.jsp" class="typing-area">
<!--                    <input type="text" placeholder="Type a message here..." name="sendmessage" required>-->

                    <div class="sendmessage">
                        <textarea name="sendmessage" id="messageInput" placeholder="Type a message here..." required></textarea>
                    </div>
                    <input type="hidden" value="<%=FROMUSER%>" name="fromuser">
                    <input type="hidden" value="<%=TOUSER%>" name="touser">
                    <input type="hidden" value="<%= (new java.util.Date()).toLocaleString()%>" name="chat_date">
                    <button><img src="images/send.png" alt=""></button>
                </form>
            </section>
        </div>
    </div>
    <!-- Footer Part start -->
    <footer>
        <div class="main-content">
            <div class="left box">
                <h2>About us</h2>
                <div class="content">
                    <p>For providing a chat facility in this application used in a particular organization: Online chat is a form of communication that allows for two-way conversations.</p>
                    <div class="social">
                        <a href="https://www.facebook.com/satyabrata.panda.3956690?mibextid=ZbWKwL" target="_blank" style="--social-clr: #1877f2;"><i class="fab fa-facebook-f"></i></a>
                        <a href="https://x.com/__satyabrata__" target="_blank" style="--social-clr: #000000;"><i class="fab fa-x-twitter"></i></a>
                        <a href="https://www.instagram.com/satya.brata_panda?igsh=MTNuNHBuMXg4MTUyOQ==" target="_blank" style="--social-clr: #c32aa3;"><i class="fab fa-instagram"></i></a>
                        <a href="https://www.youtube.com/channel/UCRwqXSEz4xspk1B1z592-fA" target="_blank" style="--social-clr: #ff0000;"><i class="fab fa-youtube"></i></a>
                    </div>
                </div>
            </div>
    
            <div class="center box">
                <h2>Address</h2>
                <div class="content">
                    <div class="place">
                        <span class="fas fa-location-dot icon" style="--all-clr: #1c68b5;"></span>
                        <span class="text">India</span>
                    </div>
                    <div class="phone">
                        <span class="fas fa-phone icon" style="--all-clr: #000080;"></span>
                        <span class="text">+91 6371223344</span>
                    </div>
                    <div class="email">
                        <span class="fas fa-envelope icon" style="--all-clr: #ff0000;"></span>
                        <span class="text">satyabrata&#64;gmail.com</span>
                    </div>
                </div>
            </div>
    
            <div class="right box">
                <h2>Contact us</h2>
                <div class="content">
                    <form action="#">
                        <div class="email">
                            <div class="text">Email <span style="color: red;">*</span></div>
                            <input type="email" required>
                        </div>
                        <div class="msg">
                            <div class="text">Message <span style="color: red;">*</span></div>
                            <textarea cols="25" rows="2" required></textarea>
                        </div>
                        <div class="contact-us-btn">
                            <button type="submit">Send</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="bottom">
            <div class="center">
                <span class="credit">Created By <a href="#">Satya</a> | &copy; 2024 All rights reserved.</span>
            </div>
        </div>
    </footer>
    <script>
        // Scroll to the bottom of the chat-box
        var chat_box = document.querySelector(".chat-box");
        chat_box.scrollTop = chat_box.scrollHeight;
        
        const options = document.querySelector(".more-options");
        options.addEventListener("click", () => {
            options.classList.toggle("active");
        });
        
        document.addEventListener("DOMContentLoaded", function() {
            const textarea = document.getElementById("messageInput");
            const sendmessage = document.getElementById("sendmessage");

            textarea.addEventListener("input", function() {
                // Check if the text has line breaks or if it overflows
                if (this.value.includes('\n') || this.scrollHeight > this.clientHeight) {
                    this.style.height = "auto";
                    this.style.height = Math.min(this.scrollHeight, 110) + "px";
                } else if (this.value.trim() === "") {
                    this.style.height = "47px";
                } else {
                    this.style.height = "47px";
                }
            });
        });
    </script>
    <script src="js/header.js"></script>
</body>
</html>