<%@ page import="java.sql.*" %>
<%
    String PHONENO=(String)session.getAttribute("phoneno");
    
    Connection con=null;
    Statement st=null;
    ResultSet rs;
    
    try{
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/chat_system","root","root");
        st=con.createStatement();
        String query="delete from ocs"+PHONENO+" ";
        st.execute(query);
        
        response.sendRedirect("history.jsp");                    
        st.close();
        con.close();
    }
    catch(Exception exp){
        out.print("error in reading"+exp.getMessage());
    }
%>