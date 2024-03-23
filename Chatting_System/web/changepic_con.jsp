<%@page import="java.io.*,java.util.*,javax.servlet.*" %>
<%@page import="java.util.Enumeration" %>
<%@page import="java.sql.*" %>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="org.apache.commons.fileupload.disk.*" %>
<%@page import="org.apache.commons.fileupload.servlet.*" %>
<%@page import="org.apache.commons.io.output.*" %>
<%
    String PHONENO=(String)session.getAttribute("phoneno");
    String filename = "";
    String absolutePath = getServletContext().getRealPath("/profile_picture");
    MultipartRequest m = new MultipartRequest(request,absolutePath, 8*1024*1024);
    Enumeration files = m.getFileNames();
    
    while(files.hasMoreElements()){
        String name = (String)files.nextElement();
        filename = m.getFilesystemName(name);
    
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/chat_system","root","root");

        Statement st = con.createStatement();
        int sql = st.executeUpdate("update userreg set images='"+filename+"' where phoneno='"+PHONENO+"' ");
        if(sql>0){
            RequestDispatcher rd = request.getRequestDispatcher("changepic.jsp");
            request.setAttribute("msg","pic_changed");
            rd.forward(request, response);
            //response.sendRedirect("changepic.jsp");
        }
        else{
            RequestDispatcher rd = request.getRequestDispatcher("changepic.jsp");
            request.setAttribute("msg","pic_notchanged");
            rd.forward(request, response);
            
            //response.sendRedirect("changepic.jsp");
        }
    }
%>