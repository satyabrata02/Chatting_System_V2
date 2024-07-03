<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Users</title>
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
                    <li><a href="user_lists.jsp" class="active">Users</a></li>
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
        <div class="container3">
            <section class="users">
                <header>
                    <!--Database Connection-->

                    <div class="content">
                        <%
                            String PHONENO=(String)session.getAttribute("phoneno");

                            Connection con=null;
                            Statement st=null;
                            ResultSet rs=null;

                            String FIRSTNAME="" ;
                            String LASTNAME="" ;
                            String STATUS="" ;
                            String MY_PIC="";

                            try{
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/chat_system","root","root");

                                st=con.createStatement();
                                String query=" select * from userreg WHERE phoneno='"+PHONENO+"' ";
                                rs=st.executeQuery(query);
                                if(rs.next()){
                                    FIRSTNAME=rs.getString("firstname");
                                    LASTNAME=rs.getString("lastname");
                                    STATUS= rs.getString("status");
                                    MY_PIC=rs.getString("images");
                                }
                                st.close();
                                con.close();
                            }
                            catch(Exception exp){
                                out.print("error in dsn :  "+exp.getMessage());
                            }

                        %>
                        <img src="profile_picture/<%=MY_PIC%>" alt="">
                        <div class="details">                         
                            <span><%=FIRSTNAME%> <%=LASTNAME%></span>
                            <p><%=STATUS%></p>
                        </div>
                    </div>
                </header>
                <div class="search">
                    <span class="text">Select an user to start chat</span>
                    <input type="text" id="myInput" placeholder="Enter name to search..." onkeyup="searchbar()">
                    <button>
                        <i class="fa-solid fa-magnifying-glass img1"></i>
                        <i class="fa-solid fa-xmark img2"></i>
                    </button>
                </div>
                <table id="myTable">
                    <%
                        Connection con1=null;
                        Statement st1=null;
                        ResultSet rs1=null;

                        String UFIRSTNAME="" ;
                        String ULASTNAME="" ;
                        String UPH_NO="";
                        String USTATUS="" ;
                        String U_PIC="";

                        try{
                            Class.forName("com.mysql.jdbc.Driver");
                            con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/chat_system","root","root");

                            st1=con1.createStatement();
                            String query1="select * from userreg WHERE not phoneno='"+PHONENO+"' order by firstname asc";
                            rs1=st1.executeQuery(query1);
                            while(rs1.next()){
                                UFIRSTNAME=rs1.getString("firstname");
                                ULASTNAME=rs1.getString("lastname");
                                UPH_NO=rs1.getString("phoneno");
                                USTATUS=rs1.getString("status");
                                U_PIC=rs1.getString("images");

                    %>
                        <tr>
                            <td>
                                <a href="user_lists_con.jsp?phoneno=<%=UPH_NO%>"><img src="profile_picture/<%=U_PIC%>" alt="" width="50px" height="50px"></a>
                                <a href="user_lists_con.jsp?phoneno=<%=UPH_NO%>"><%=UFIRSTNAME%> <%=ULASTNAME%><br><%=UPH_NO%></a>
                            </td>
                            
                            <td><a href="user_lists_con.jsp?phoneno=<%=UPH_NO%>"><div class="status-dot <%=USTATUS%>"></div></a></td>
                        </tr>
                    <%
                            }
                            st1.close();
                            con1.close();
                        }
                        catch(Exception exp){
                            out.print("error in dsn :  "+exp.getMessage());
                        }
                    %>
                </table>
            </section>
            <h2 id="notfound">User not found</h2>
            <%
                String message = (String)request.getAttribute("msg");
                if(message == "success"){
                    out.println("<SCRIPT LANGUAGE='JavaScript'>alert('You are Sucessfully logedin')</SCRIPT>");
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
        const searchBar = document.querySelector(".users .search input"),
                searchBtn = document.querySelector(".users .search button");

        searchBtn.onclick = ()=>{
            searchBar.classList.toggle("active");
            searchBar.focus();
            searchBtn.classList.toggle("active");
        };

        const searchbar = () =>{
            let filter = document.getElementById('myInput');
            let myTable = document.getElementById('myTable');
            let trow = myTable.querySelectorAll('tr');
            var notfound = document.getElementById("notfound");

            const searchterm = filter.value.toLowerCase();
            let nomatch = true;

            trow.forEach(function(row) {
                if(row.textContent.toLowerCase().includes(searchterm)){
                    row.style.display = '';
                    nomatch = false;
                }else{
                    row.style.display = 'none';
                }
            });

            if(nomatch){
                notfound.style.display = 'flex';
            }else{
                notfound.style.display = 'none';
            }
        };
    </script>
    <script src="js/header.js"></script>
</body>
</html>