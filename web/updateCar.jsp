<%-- 
    Document   : updateCar
    Created on : 6 dic. 2022, 17:59:26
    Author     : delga
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Vehicle</title>
    </head>
    <body>
        <%
            int txtIdCar = Integer.parseInt(request.getParameter("txtIdCar"));
            String txtMarca = request.getParameter("txtMarca");
            String txtModelo = request.getParameter("txtModelo");
            String txtYear_of_Manufacture = request.getParameter("txtYear_of_Manufacture");
            String txtEstilo = request.getParameter("txtEstilo");
            int txtPrecio = Integer.parseInt(request.getParameter("txtPrecio"));
        %>

        <%
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/webProducts", "root", "Ddares-2003");
            Statement statement = connection.createStatement();

            String sql = "update cars set Marca = '" + txtMarca + 
                         "', Modelo = '" + txtModelo + 
                         "', Year_of_Manufacture = " + txtYear_of_Manufacture + 
                         ", Estilo = '" + txtEstilo + 
                         "', Precio = '" + txtPrecio + "'" +
                         " where IdCar = " + txtIdCar;

            statement.executeUpdate(sql);

            out.println("<script type='text/javascript'>alert('Vehicle updated');</script>");

            RequestDispatcher rd = request.getRequestDispatcher("/cars.jsp");
            rd.include(request, response);
        %>
    </body>
</html>
