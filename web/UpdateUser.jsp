<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style type="text/css">
            .left { text-align: left;}
            .right { text-align: right;}
            .center { text-align: center;}
            .justify { text-align: justify;}
        </style>
        <style>
            body{
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                background-color: #001a33;
            }
            .center0
            {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                background: #white;
                border-radius: 10px;
            }
            .box
            {
                position: relative;
                width: 380px;
                height: 420px;
                justify-content: center;
                align-items: center;
                background: #white;
                border-radius: 8px;
            }
            input
            {
                width: 370px;
                height: 30px;
                border-radius: 5rem;
                outline: none;
                background-color: #001a33;
                font-size: 15px;
                margin: 20px 10px;
            }
            .shadow-input
            {
                border-radius: 24px;
                background: #d6d6d6;
                box-shadow: inset 10px 10px 20px #b4b4b4,inset -10px -10px 20px #f8f8f8;             
            }
        </style>
    </head>
    <body>
        <div class="card" style="width: 18rem; background-color: #000d1a; border-radius: 10px; width: 400px">
            <div class="card-body ">
                <h3 class="card-title center" style="color: white">Login</h3>
                <div class="center">
                    <img src="imagenes/MainLogo.jpg" alt="" width="280" height="100">
                </div>
                <div class="form-floating mb-3">
                    <form action="changeEmailUser.jsp">
                        <pre class="center" style="color: white;font-size: 16px"> <i>Nombre: </i></pre>
                        <div class="">
                            <input name="txtName" type="text" class="form-control center" style="color: white" id="txtName" placeholder="Nombre" required>
                        </div>
                        <pre class="center" style="color: white;font-size: 16px"> <i>Nuevo Correo: </i></pre>
                        <div class="">
                            <input name="txtEmail" type="email" class="form-control center" id="txtEmail" placeholder="Correo" required>
                        </div>
                        <pre class="center" style="color: white;font-size: 16px"> <i>Telefono: </i></pre>
                        <div class="">
                            <input name="txtTelefono" type="number" class="form-control center" id="txtTelefono" style="color: white" placeholder="Telefono" required>
                        </div>
                        <input type="submit" value="Crear" style="background-color: #000099">
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>