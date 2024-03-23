<%@ page import="java.sql.*" %>
<%
    Connection con=null;
    Statement st=null;
    ResultSet rs=null;
    
    try{
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/chat_system","root","root");
    }
    catch(Exception exp){
        out.print("error in dsn :  "+exp.getMessage());
    }
    
    try{
        String sendmessage = request.getParameter("sendmessage");  //message
        String fromuser = request.getParameter("fromuser");  //userid
        String touser = request.getParameter("touser");     //chatroomid  
        String chat_date = request.getParameter("chat_date");  //chat_date
        
        st = con.createStatement();
        String query="insert into ocs"+fromuser+"(fromuser, touser, message, chat_date) values('"+fromuser+"','"+touser+"','"+sendmessage+"','"+chat_date+"')";
        st.execute(query);
        String query2="insert into ocs"+touser+"(fromuser, touser, message, chat_date) values('"+fromuser+"','"+touser+"','"+sendmessage+"','"+chat_date+"')";
        st.execute(query2);
        String query3="insert into systemchat(fromuser, touser, message, chat_date) values('"+fromuser+"','"+touser+"','"+sendmessage+"','"+chat_date+"')";
        st.execute(query3);
        response.sendRedirect("chatroom.jsp");
    }
    catch(Exception obj){
        out.print("Error in Data Storeage"+obj.getMessage());
    }
%>