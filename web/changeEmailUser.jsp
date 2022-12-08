

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
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/webProducts", "root" , "Ddares-2003");
                Statement statement = connection.createStatement();
                Statement statement2 = connection.createStatement();
                ResultSet resultSet2 = statement.executeQuery("select * from Users where Name = '" + txtName + "'");
                String CorreoExistente = "Correo Existe";
                String NombreExistente = "Nombre Existe";
                
                
                if (resultSet2.next()){
                    out.println("<script type='text/javascript'>alert('Nombre Coincide');</script>");
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection connection1 = DriverManager.getConnection("jdbc:mysql://localhost/webProducts", "root" , "Ddares-2003");
                    Statement statement1 = connection.createStatement();
                    Statement statement02 = connection.createStatement();
                    ResultSet resultSet00 = statement.executeQuery("select * from Users where Email = '" + txtEmail + "'");
                    if (resultSet00.next()){
                        out.println("<script type='text/javascript'>alert('nombre coincide y correo tambien entonces no se puede cambiar');</script>");
                    }else{
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection connection2 = DriverManager.getConnection("jdbc:mysql://localhost/webProducts", "root" , "Ddares-2003");
                        Statement statement3 = connection.createStatement();
                        String sql = "update Users set Email = '" + txtEmail +
                            "', Telefono = " + txtTelefono +
                            " where Name = '" + txtName +"'" ;
                            statement.executeUpdate(sql);
                            out.println("<script type='text/javascript'>alert('User updated');</script>");
                            RequestDispatcher rd = request.getRequestDispatcher("/login.html");
                            rd.include(request, response);
                    }
                    
                }else{
                    out.println("<script type='text/javascript'>alert('Nombre no Coincide');</script>");
                }
            
            }catch (ClassNotFoundException | NumberFormatException | SQLException e){
                    out.println(e.getMessage());
            }
        %>
    </body>
</html>