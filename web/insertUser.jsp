

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
                    ResultSet resultSet = statement.executeQuery("select * from Users where Email = '" + txtEmail + "'");

                    if (resultSet.next()) {
                        out.println("<script type='text/javascript'>alert('hay una persona con el mismo correo');</script>");
                        RequestDispatcher rd = request.getRequestDispatcher("/index.html");
                        rd.include(request, response);
                    }else{
                        String sql = "insert into Users (Name, Email, Telefono)" +
                                 "values ('"+ txtName +"','"+ txtEmail +"',"+ txtTelefono +")";

                        statement2.executeUpdate(sql);
                        statement2.close();

                        out.println("<script type='text/javascript'>alert('User created');</script>");
                        RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
                        rd.include(request, response);
                    }

                    RequestDispatcher rd = request.getRequestDispatcher("/MostrarProductos");
                    rd.include(request, response);
                } catch (ClassNotFoundException | NumberFormatException | SQLException e){
                    out.println(e.getMessage());
                }
        %>            
    </body>
</html>