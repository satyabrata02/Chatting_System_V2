<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chat Histories</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    <link rel="icon" href="images/chat.png" type="image/x-icon">
    <link rel="stylesheet" href="css/header_footer.css">
    <link rel="stylesheet" href="css/history_profilePic.css">
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
                    <li class="chathostory"><a href="history.jsp" class="active">History</a></li>
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
        <div class="container">
            <header>Chat history</header>
            <form method="post" action="history_con.jsp">
                <div class="contents">
                    <table>
                        <tr>
                            <th>SENDER</th>
                            <th>RECEIVER</th>
                            <th>MESSAGES</th>
                            <th>DATE & TIME</th>
                        </tr>
                        <%
                            String PHONENO=(String)session.getAttribute("phoneno");

                            Connection con=null;
                            Statement st=null;
                            ResultSet rs=null;

                            String s1="",s2="",s3="",s4="";

                            try{
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/chat_system","root","root");
                                st=con.createStatement();
                                String query="select * from ocs"+PHONENO+" order by chatid ";
                                rs=st.executeQuery(query);
                                while(rs.next()){
                                    s1=rs.getString("fromuser");
                                    s2=rs.getString("touser");  
                                    s3=rs.getString("message");
                                    s4=rs.getString("chat_date");
                        %>
                        <tr>
                            <td><%=s1%></td>
                            <td><%=s2%></td>
                            <td><%=s3%></td>
                            <td><%=s4%></td>
                        </tr>
                        <%
                                }
                                st.close();
                                con.close();
                            }catch(Exception exp){
                             out.print("error in reading"+exp.getMessage());
                            } 
                        %>
                    </table>
                </div>
                <div class="submit-btn">
                    <div class="inner"></div>
                    <input type="submit" value="CLEAR ALL">
                </div>
            </form>
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
                        <a href="https://x.com/__satyabrata__" target="_blank" style="--social-clr: #1da1f2;"><i class="fab fa-twitter"></i></a>
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
    <script src="js/header.js"></script>
</body>
</html>