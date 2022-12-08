<%-- 
    Document   : insertCar
    Created on : 6 dic. 2022, 17:37:44
    Author     : delga
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register a Car</title>
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
            Statement statement2 = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from cars where Modelo = '" + txtModelo + "'");

            if (resultSet.next()) {
                out.println("<script type='text/javascript'>alert('The vehicle is already registered');</script>");
            } else {
                String sql = "insert into cars (IdCar, Marca, Modelo, Year_of_Manufacture, Estilo, Precio) "
                        + "values (" + txtIdCar + ", '" + txtMarca + "', '" + txtModelo + "', " + txtYear_of_Manufacture + ", '" + txtEstilo + "', '" + txtPrecio + "')";

                statement2.executeUpdate(sql);

                out.println("<script type='text/javascript'>alert('Car registered');</script>");
            }

            RequestDispatcher rd = request.getRequestDispatcher("/cars.jsp");
            rd.include(request, response);
        %>
    </body>
</html>

