<%@ page contentType="text/html;charset=UTF-8" %>

<%
    // destroy session
    session.invalidate();

    // redirect to welcome page
    response.sendRedirect("welcome.jsp");
%>