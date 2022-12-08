<%-- 
    Document   : listCars
    Created on : 6 dic. 2022, 20:24:40
    Author     : delga
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
        <title>Products</title>
    </head>
    <body>
        <%
           Connection con = null;
           ResultSet resultset = null;
           try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/webProducts", "root", "Ddares-2003");
                Statement statement = con.createStatement();
                resultset = statement.executeQuery("select * from cars");                                                           
            }catch (Exception ex) {
                ex.printStackTrace();
            }
        %>
 <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Navbar</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="index.html">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="listCars.jsp">Vehicles</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>                       
        <div class="container" style="margin-top:2%"> 
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col">Matricula</th>
                        <th scope="col">Marca</th>
                        <th scope="col">Modelo</th>
                        <th scope="col">Año de Fabricación</th>
                        <th scope="col">Estilo</th>
                        <th scope="col">Precio</th>
                    </tr>
                </thead>
                <tbody>
                    <% while (resultset.next())  {%>
                         <tr onclick="window.location.href = 'loadCar.jsp?IdCar=<%=resultset.getInt("IdCar")%>'">
                             <th scope="row"> <%=resultset.getInt("IdCar")%> </th>
                             <td><%=resultset.getString("Marca")%></td>
                             <td><%=resultset.getString("Modelo")%></td>                       
                             <td><%=resultset.getString("Year_of_Manufacture")%></td>                        
                             <td><%=resultset.getString("Estilo")%></td>  
                             <td><%=resultset.getInt("Precio")%></td>      
                        </tr>                    
                    <%}%>
                </tbody>
            </table>   
        </div>
    </body>
</html>
