                           
    Author     : sebas
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
            String txtName = request.getParameter("txtName");
            String txtEmail = request.getParameter("txtEmail");
            int txtTelefono = Integer.parseInt(request.getParameter("txtTelefono"));
            
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/webProducts", "root", "Ddares-2003");
                Statement statement = connection.createStatement();
                Statement statement2 = connection.createStatement();
                ResultSet resultSet = statement.executeQuery("select * from Users where Name = '" + txtName + "'");
                if (resultSet.next()){
                    out.println("<script type='text/javascript'>alert('Nombre permitido');</script>");
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection connection1 = DriverManager.getConnection("jdbc:mysql://localhost/webProducts", "root", "Ddares-2003");
                    Statement statement1 = connection.createStatement();
                    Statement statement22 = connection.createStatement();
                    ResultSet resultSet22 = statement.executeQuery("select * from Users where Email = '" + txtEmail + "'");
                    if (resultSet22.next()){
                        out.println("<script type='text/javascript'>alert('Email permitido');</script>");
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection connection11 = DriverManager.getConnection("jdbc:mysql://localhost/webProducts", "root", "Ddares-2003");
                        Statement statement11 = connection.createStatement();
                        Statement statement222 = connection.createStatement();
                        ResultSet resultSet33 = statement.executeQuery("select * from Users where Telefono = '" + txtTelefono + "'");
                        if (resultSet33.next()){
                            out.println("<script type='text/javascript'>alert('Telefono permitido');</script>");
                            Class.forName("com.mysql.cj.jdbc.Driver");
                        }else
                            {
                                out.println("<script type='text/javascript'>alert('Telefono no Registrado');</script>");
                                RequestDispatcher rd = request.getRequestDispatcher("/cars.jsp");
                                rd.include(request, response);
                        }
                    }else{
                        out.println("<script type='text/javascript'>alert('Email no Registrado');</script>");
                    }
                }else{
                out.println("<script type='text/javascript'>alert('Nombre no Registrado');</script>");
                
                }
            }catch (ClassNotFoundException | NumberFormatException | SQLException e){
                    out.println(e.getMessage());
            }
        %>
    </body>
</html>
