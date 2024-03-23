<%@ page import="java.sql.*" %>
<%
    String FROMUSER=(String)session.getAttribute("phoneno");
    String TOUSER=(String)session.getAttribute("touser");
    
    Connection con=null;
    Statement st=null;
    ResultSet rs;
    
    try{
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/chat_system","root","root");
        st=con.createStatement();
        String query="delete from ocs"+FROMUSER+" where fromuser='"+FROMUSER+"' and touser='"+TOUSER+"' ";
        st.execute(query);
        
        response.sendRedirect("chatroom.jsp");                    
        st.close();
        con.close();
    }
    catch(Exception exp){
        out.print("error in reading"+exp.getMessage());
    }
%>
