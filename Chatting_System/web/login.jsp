<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    <link rel="icon" href="images/chat.png" type="image/x-icon">
    <link rel="stylesheet" href="css/header_footer.css">
    <link rel="stylesheet" href="css/login_home_updatepassword.css">
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
                    <li><a href="login.jsp" class="active">Login</a></li>
                    <li><a href="register.jsp">Register</a></li>
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
        <div class="container">
            <header>Login Form</header>
            <form method="post" action="login_con.jsp">
                <div class="input-field">
                    <input type="text" name="phoneno" maxlength="10" onKeyPress="return numbersonly(event)" required>
                    <label>Phone no.</label>
                </div>
                <div class="input-field">
                    <input class="pswrd" type="password" name="password" maxlength="15" required>
                    <span class="show">SHOW</span>
                    <label>Password</label>
                </div>
                <div class="recovery">
                    <a href="recovery.jsp">Forgot Password ?</a>
                </div>
                <div class="button">
                    <div class="inner"></div>
                    <button type="submit">LOGIN</button>
                </div>
            </form>
            <div class="signup">
                Not a member ? <a href="register.jsp">Signup now</a>
            </div>
            <%
                String message = (String) request.getAttribute("msg");
                if(message == "success"){
                    out.println("<SCRIPT LANGUAGE='JavaScript'>alert('You are Sucessfully registred')</SCRIPT>");
                }
                else if(message == "fail"){
                    out.println("<SCRIPT LANGUAGE='JavaScript'>alert('Invalid User Id or Password')</SCRIPT>");
                }
                else if(message == "logout"){
                    out.println("<SCRIPT LANGUAGE='JavaScript'>alert('You are Sucessfully logged out...')</SCRIPT>");
                }
            %>
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
    <script>
        function numbersonly(e){
            var unicode=e.charCode? e.charCode : e.keyCode;
            if (unicode !== 8){
                if (unicode<48||unicode>57)
                    return false;
            }
        };
    </script>
    <script src="js/header.js"></script>
    <script src="js/passwordshow.js"></script>
</body>
</html>