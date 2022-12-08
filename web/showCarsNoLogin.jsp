<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
        <title>Search users</title>
    </head>
    <body>
        <div class="container" style="margin-top:2%">             
            <div class="card">
                <div class="card-header">
                    Search for a Car
                </div>
                <div class="card-body">
                    <form action="search.jsp">            
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" name="txtMarca" placeholder="Marca">
                            <label>Marca</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" name="txtModelo" placeholder="Modelo">
                            <label>Modelo</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" name="txtYear_of_Manufacture" placeholder="Año de Fabricación">
                            <label>Año de Fabricación</label>
                        </div>
                        <div class="form-floating mb-3">
                            <button type="submit" class="btn btn-primary">Search</button>                            
                        </div>                          
                    </form>                    
                </div>
            </div>   
            <hr />  
            <%
                String txtMarca = request.getParameter("txtMarca");
                String txtModelo = request.getParameter("txtModelo");
                String txtYear_of_Manufacture = request.getParameter("txtYear_of_Manufacture");
                Connection con = null;
                ResultSet resultset = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost/webProducts", "root", "Ddares-2003");
                    Statement statement = con.createStatement();
                    resultset = statement.executeQuery("select * from cars where Marca like '%" + txtMarca + "%' OR Modelo like '%" + txtModelo + "%' OR Year_of_Manufacture like '%" + txtYear_of_Manufacture + "%'");                    
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            %>   
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Marca</th>
                        <th scope="col">Modelo</th>
                        <th scope="col">Año de Fabricación</th>
                        <th scope="col">Estilo</th>
                        <th scope="col">Precio</th>
                    </tr>
                </thead>
                <tbody>
                    <% while (resultset.next()) {%>
                    <tr onclick="window.location.href = 'loadCar.jsp?Id=<%=resultset.getInt("IdCar")%>'">
                        <th scope="row"> <%=resultset.getInt("IdCar")%>readonly</th>
                        <td><%=resultset.getString("Marca")%>readonly</td>
                        <td><%=resultset.getString("Modelo")%>readonly</td>
                        <td><%=resultset.getString("Year_of_Manufacture")%>readonly</td>                        
                        <td><%=resultset.getString("Estilo")%>readonly</td>                        
                        <td><%=resultset.getInt("Precio")%>readonly</td>                                            
                    </tr>                    
                    <%}%>
                </tbody>
            </table>   
        </div>   
    </body>
</html>

