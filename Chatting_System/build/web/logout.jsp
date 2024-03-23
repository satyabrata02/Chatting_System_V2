<%@ page import="java.sql.*" %>
<%
    String PHONENO=(String)session.getAttribute("phoneno");
    
    Connection con=null;
    Statement st=null;
    ResultSet rs=null;
    
    try{
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/chat_system","root","root");
        
        st = con.createStatement();
        String query="update userreg set status='offline' where phoneno='"+PHONENO+"' ";
        st.execute(query);
    }
    catch(Exception exp){
        out.print("error in dsn :  "+exp.getMessage());
    }
       
    session.invalidate();

    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
    request.setAttribute("msg","logout");
    rd.forward(request, response);
%>