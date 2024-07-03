<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Password Recovery</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    <link rel="icon" href="images/chat.png" type="image/x-icon">
    <link rel="stylesheet" href="css/header_footer.css">
    <link rel="stylesheet" href="css/register_recovery.css">
</head>
<body>
    <nav>
        <div class="nav-bar">
            <i class="fas fa-bars sidebarOpen"></i>
            <span class="logo navLogo"><a href="index.jsp">My Charts</a></span>
            <div class="menu">
                <div class="logo-toggle">
                    <span class="logo"><a href="index.jsp">My Charts</a></span>
                    <i class="fas fa-xmark siderbarClose"></i>
                </div>
    
                <ul class="nav-links">
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="login.jsp">Login</a></li>
                    <li><a href="recovery.jsp" class="active">Recovery</a></li>
                    <li><a href="about.jsp">About</a></li>
                    <li><a href="contactus.jsp">Contact</a></li>
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
        <div class="container2">
            <div class="title">Recovery Form</div>
            <form method="post" action="recovery_con.jsp">
                <div class="user-details">
                    <div class="input-box2">
                        <input type="text" name="phone_email" autocomplete="off" required>
                        <label>Email or Phone no.</label>
                    </div>
                    <div class="select-menu2">
                        <input type="radio" name="secure_question" id="ops-1" value="what is your nick name ?">
                        <input type="radio" name="secure_question" id="ops-2" value="what is your pet name ?">
                        <input type="radio" name="secure_question" id="ops-3" value="what is your first school name ?">
                        <input type="radio" name="secure_question" id="ops-4" value="Who was your childhood hero ?">
                        <input type="radio" name="secure_question" id="ops-5" value="what is your favorite subject ?">
                        <div class="select">
                            <span>Select your option</span>
                            <i class="fa-solid fa-chevron-down chevron-down"></i>
                            <i class="fa-solid fa-chevron-up chevron-up"></i>
                        </div>
                        <div class="options-list">
                            <label class="option" for="ops-1">what is your nick name ?</label>
                            <label class="option" for="ops-2">what is your pet name ?</label>
                            <label class="option" for="ops-3">what is your first school name ?</label>
                            <label class="option" for="ops-4">Who was your childhood hero ?</label>
                            <label class="option" for="ops-5">what is your favorite subject ?</label>
                        </div>
                    </div>
                    <div class="input-box2">
                        <input class="pswrd2" type="password" name="answer" required>
                        <label>Answer</label>
                        <span class="show2">SHOW</span>                            
                    </div>
                </div>
                <div class="submit-btn">
                    <div class="inner"></div>
                    <input type="submit" value="continue" onclick="validation()">
                </div>
            </form>
            <h2>
                    <%
                        String message = (String) request.getAttribute("msg");
                        if(message == "success"){
                            out.println("<SCRIPT LANGUAGE='JavaScript'>alert('Check below 👇')</SCRIPT>");
                        }
                        else if(message == "fail"){
                            out.println("<SCRIPT LANGUAGE='JavaScript'>alert('Invalid Data try again.')</SCRIPT>");
                        }
                        
                        
                        Connection con=null;
                        Statement st=null;
                        ResultSet rs=null;
                        
                        String PHONENO_EMAILID = (String) request.getAttribute("phone_email");
                        String QUESTION = (String) request.getAttribute("secure_question");
                        String ANSWER = (String) request.getAttribute("answer");
                        
                        try{
                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/chat_system","root","root");
                            st=con.createStatement();
                            String query="select * from userreg where phoneno='"+PHONENO_EMAILID+"' or emailid='"+PHONENO_EMAILID+"' and secure_question='"+QUESTION+"' and answer='"+ANSWER+"' ";
                            rs=st.executeQuery(query);
                            if(rs.next()){
                                String s1=rs.getString("password");                          
                                out.println("Your Password is "+s1+" ");       
                            }
                        }catch(Exception exp){
                            out.print("error in checking"+exp.getMessage());
                        }
                    %>
                </h2><br>
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
    <script src="js/header.js"></script>
    <script src="js/recovery.js"></script>
</body>
</html>