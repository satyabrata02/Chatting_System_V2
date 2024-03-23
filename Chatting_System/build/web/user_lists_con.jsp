<%@ page import="java.sql.*" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
    String FROMUSER=(String)session.getAttribute("phoneno");
    
    String TOUSER =request.getParameter("phoneno");
    session.setAttribute("touser", TOUSER);
    session.setAttribute("phoneno", FROMUSER);
    
    //RequestDispatcher rd = request.getRequestDispatcher("chatroom.jsp");
    //rd.forward(request, response);
    out.println(FROMUSER);
    out.println(TOUSER);
%>
<html>
    <head></head>
    <body>
        <c:set scope="session" var="UPH_NO" value="${param.phoneno}" /><br/>
        <c:out value="${UPH_NO}" /><br/>        <%--    other number    --%>
        <c:out value="${MYPHONENO}" /><br/>     <%--    my number    --%>
        <c:redirect url="chatroom.jsp" />
    </body>
</html>