<%@ page import="java.sql.*" %>
<%
    Connection con=null;
    Statement st=null;
    ResultSet rs=null;
    
    String firstname = request.getParameter("firstname");
    String lastname = request.getParameter("lastname");
    String phoneno = request.getParameter("phoneno");
    String emailid = request.getParameter("emailid");
    String messages = request.getParameter("messages");
    
    try{
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/chat_system","root","root");
        
        st = con.createStatement();
        String query="insert into contactus values('"+firstname+"','"+lastname+"','"+phoneno+"','"+emailid+"','"+messages+"')";
        st.execute(query);
        
        RequestDispatcher rd = request.getRequestDispatcher("contactus.jsp");
        request.setAttribute("msg","inserted");
        rd.forward(request, response);
        
        st.close();
        con.close();
    }
    catch(Exception exp){
        out.print("error in dsn :  "+exp.getMessage());
    }
%>