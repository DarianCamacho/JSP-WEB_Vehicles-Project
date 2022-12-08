<%-- 
    Document   : deleteCar
    Created on : 6 dic. 2022, 20:18:50
    Author     : delga
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int txtIdCar = Integer.parseInt(request.getParameter("IdCar"));
        %>

        <%
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/webProducts", "root", "Ddares-2003");
            Statement statement = connection.createStatement();

            String sql = "delete from cars where IdCar = " + txtIdCar;

            statement.executeUpdate(sql);

            out.println("<script type='text/javascript'>alert('Vehicle deleted');</script>");

            RequestDispatcher rd = request.getRequestDispatcher("/cars.jsp");
            rd.include(request, response);
        %>
    </body>
</html>

