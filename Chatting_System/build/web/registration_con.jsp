<%@page import="java.sql.*" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registration Connection</title>
    </head>
    <body>
        <!--value call from login page-->
        <c:set scope="page" var="PHONENO" value="${param.phoneno}"></c:set>
        <c:set var="i" value="1"></c:set>
        
        <!--Database Connection-->
        <sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/chat_system" user="root" password="root" var="check"></sql:setDataSource>
        <sql:query dataSource="${check}" var="rs">select * from userreg where phoneno=? <sql:param value="${PHONENO}"></sql:param></sql:query>
        
        <!--Show details inside the DB-->
        <c:forEach items="${rs.rows}" var="row">
            <c:set var="CPHONENO" value="${row.phoneno}"></c:set>
            
            <c:if test="${PHONENO == CPHONENO}">
                <c:set var="i" value="0"></c:set>
            </c:if>

        </c:forEach>
        
        <c:if test="${i==0}">
            <%
                RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
                request.setAttribute("msg","error");
                rd.forward(request, response);
            %>
        </c:if>
        
        <c:if test="${i==1}">
            <sql:update dataSource="${check}" var="insert">insert into userreg(firstname, lastname, gender, phoneno, emailid, password, secure_question, answer, status, images) values(?, ?, ?, ?, ?, ?, ?, ?,'offline','user.png');
                <sql:param value="${param.firstname}" />
                <sql:param value="${param.lastname}" />
                <sql:param value="${param.gender}" />
                <sql:param value="${PHONENO}" />
                <sql:param value="${param.emailid}" />
                <sql:param value="${param.password}" />
                <sql:param value="${param.secure_question}" />
                <sql:param value="${param.answer}" />
            </sql:update>
            
            <sql:update dataSource="${check}" var="create">
                create table IF NOT EXISTS ocs${PHONENO} (chatid int NOT NULL AUTO_INCREMENT,fromuser varchar(15) NOT NULL,touser varchar(15) NOT NULL,message varchar(500) NOT NULL,chat_date varchar(50) NOT NULL,PRIMARY KEY (chatid));
            </sql:update>
                
            <%
                RequestDispatcher rd1 = request.getRequestDispatcher("login.jsp");
                request.setAttribute("msg","success");
                rd1.forward(request, response);
            %>
        </c:if>
        
    </body>
</html>