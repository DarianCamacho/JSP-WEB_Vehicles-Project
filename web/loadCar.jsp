<%-- 
    Document   : loadCar
    Created on : 6 dic. 2022, 17:54:45
    Author     : delga
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
        <title>Update car data</title>
    </head>
    <body>
        <%
            int IdCar = Integer.parseInt(request.getParameter("IdCar"));
            Connection con = null;
            ResultSet resultset = null;
             
             try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/webProducts", "root", "Ddares-2003");
                Statement statement = con.createStatement();
                resultset = statement.executeQuery("select * from cars where IdCar=" + IdCar);
                resultset.next();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        %> 
        <div class="container" style="margin-top:2%">
            <div class="card">
                <div class="card-header">
                    Update car data
                </div>
                <div class="card-body">
                    <form action="updateCar.jsp">            
                        <div class="form-floating mb-3">
                            <input value='<%=resultset.getInt("IdCar")%>' type="text" class="form-control" name="txtIdCar" placeholder="Id" readonly>
                            <label>Id</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input value='<%=resultset.getString("Marca")%>' type="text" class="form-control" name="txtMarca" placeholder="Marca">
                            <label>Marca</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input value='<%=resultset.getString("Modelo")%>' type="text" class="form-control" name="txtModelo" placeholder="Modelo">
                            <label>Modelo</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input value='<%=resultset.getString("Year_of_Manufacture")%>' type="text" class="form-control" name="txtYear_of_Manufacture" placeholder="Año de Fabricación">
                            <label>Phone</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input value='<%=resultset.getString("Estilo")%>' type="text" class="form-control" name="txtEstilo" placeholder="Estilo">
                            <label>Estilo del Vehículo</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input value='<%=resultset.getInt("Precio")%>' type="number" class="form-control" name="txtPrecio" placeholder="Precio">
                            <label>Precio</label>
                        </div>
                        <div class="form-floating mb-3">
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#confirmUpdateModal">Update</button>
                            <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#confirmDeleteModal">Delete</button>
                        </div>                          

                        <!-- Modal 1 -->
                        <div class="modal fade" id="confirmDeleteModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="staticBackdropLabel">Delete Vehicle</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        ¿Do you really want to delete <%=resultset.getString("Modelo")%>?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                                        <a class="btn btn-danger" href='deleteCar.jsp?Id=<%=resultset.getInt("IdCar")%>'>Yes, Delete!</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Modal 2 -->
                        <div class="modal fade" id="confirmUpdateModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="staticBackdropLabel">Update Car</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        ¿Do you really want to update <%=resultset.getString("Modelo")%>?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                                        <button type="submit" class="btn btn-primary">Update</button> 
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>     
        </div> 
    </body>
</html>

