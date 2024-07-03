<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Password</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    <link rel="icon" href="images/chat.png" type="image/x-icon">
    <link rel="stylesheet" href="css/header_footer.css">
    <link rel="stylesheet" href="css/login_home_updatepassword.css">
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
                    <li><a href="updatepassword.jsp" class="active">Change Password</a></li>
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
        <div class="container updatepassword">
            <header>Update Password</header>
            <form method="post" action="updatepassword_con.jsp" onsubmit="return validation()">
                <%
                    String PHONENO=(String)session.getAttribute("phoneno");
                %>
                <div class="input-field">
                    <h2><%=PHONENO%></h2>
                </div>
                <div class="input-field">
                    <input class="pswrd" type="password" id="password" name="password" maxlength="12" required>
                    <span class="show">SHOW</span>
                    <label>Password</label>
                </div>
                <div class="input-field">
                    <input type="text" id="cpassword" name="cpassword" maxlength="12" required>
                    <label>Conform Password</label>
                    <span id="error" class="error"></span>
                </div>
                <div class="button">
                    <div class="inner"></div>
                    <button>UPDATE</button>
                </div>
            </form>
            <h2>
                <%
                    String message = (String) request.getAttribute("msg");
                    if(message == "changed"){
                        out.println("<SCRIPT LANGUAGE='JavaScript'>alert('Sucessfully changed your password')</SCRIPT>");
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
    <script>
        function validation(){
            var password = document.getElementById('password').value.trim();
            var cpassword = document.getElementById('cpassword').value.trim();

            if(password != cpassword){
                document.getElementById('error').innerHTML = "Password and Conform password not matched";
                document.getElementById('cpassword').focus();
                return false;
            }
            else{
                return true;
            }
        }
    </script>
    <script src="js/header.js"></script>
    <script src="js/passwordshow.js"></script>
</body>
</html>