<%-- 
    Document   : index
    Created on : 2 oct. 2022, 19:32:12
    Author     : IVAN
--%>
<%@page import="modelo.Sangre"%>
<%@page import="modelo.Estudiante"%>
<%@page import="java.util.HashMap"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Estudiantes</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
        <h1>Formulario Estudiantes</h1>
        </div>
        
        <%--Boton nuevo de limpiar--%>
        <%--<div class="container">
            <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modal_estudiante" onclick="limpiar()">Nuevo</button>
        </div>--%>
        
        <%--Menu--%>
         <div class="container">
        <div class="dropdown">
            <button class="btn btn-dark" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        Menu
            </button>
        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
          <button type="button" class="btn btn-info" data-toggle="modal" data-target="#modal_estudiante" onclick="limpiar()">Nuevo</button><br>
          <button type="button" class="btn btn-warning" data-dismiss="menu">Cerrar</button><br>
          <%--<a class="dropdown-item" href="#">Another action</a>
          <a class="dropdown-item" href="#">Something else here</a>--%>
          
        </div>
      </div>
             
        <%--Modal--%>
    <div class="container">
            <div class="modal fade" id="modal_estudiante" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
          <div class="modal-body">
          <form action="sr_estudiante" method="post" action="/send.php" class="form-group">
                
               <label for="lbl_id"><b>ID:</b></label>
               <input type="text" name="txt_id" id="txt_id" class="form-control" value ="0" readonly>
                                
               <label for="lbl_carnet"><b>Carnet:</b></label>
               <input type="text" name="txt_carnet" id="txt_carnet" class="form-control" placeholder="Formato Solicitado: E0001" minlength="5" maxlength="5" required pattern="[E]{1}[0-9]{4}">
                              
               <label for="lbl_nombres"><b>Nombres:</b></label> 
               <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" placeholder="Eejemplo: Nombre1 Nombre2" required>
               
               <label for="lbl_apellidos"><b>Apellidos:</b></label> 
               <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" placeholder="Eejemplo: Apellido1 Apellido2" required>
                
               <label for="lbl_direccion"><b>Direccion:</b></label> 
               <input type="text" name="txt_direccion" id="txt_direccion" class="form-control" placeholder="Eejemplo: # Casa Calle zona Ciudad" required>
               
               <label for="lbl_telefono"><b>Telefono:</b></label> 
               <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="Eejemplo: 99999999" required>
               
               <label for="lbl_email"><b>Correo Electronico:</b></label> 
               <input type="text" name="txt_email" id="txt_email" class="form-control" placeholder="Eejemplo: usuario@gmail.com" required>
               
               <label for="lbl_fn"><b>Fecha Nacimiento:</b></label> 
               <input type="date" name="txt_fn" id="txt_fn" class="form-control" required>
                              
               <label for="lbl_puesto"><b>Tipo_Sangre:</b></label>
               <select name="drop_sangre" id="drop_sangre" class="form-control">
                   <%
                     Sangre sangre = new Sangre();
                        HashMap<String,String> drop = sangre.drop_sangre();
                         for (String i:drop.keySet()){
                             out.println("<option value='" + i + "'>" + drop.get(i) + "</option>");
                       } 

                   %> 
               </select>
               <br>
               <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-primary btn-lg">Agregar</button>
               <button name="btn_modificar" id="btn_modificar"  value="modificar" class="btn btn-success btn-lg">Modificar</button> 
               <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-danger btn-lg" onclick="javascript:if(!confirm('¿Desea Eliminar'))return false">Eliminar</button>  
               <button type="button" class="btn btn-warning btn-lg" data-dismiss="modal">Cerrar</button>
            </form>                 
        </div>
      </div>      
    </div>
  </div>
        
            
            
        <table class="table table-striped">
        <thead>
          <tr>
            <th>Carnet</th>
            <th>Nombres</th>
            <th>Apellidos</th>
            <th>Direccion</th>
            <th>Telefono</th>
            <th>Email</th>
            <th>Nacimiento</th>
            <th>Tipo_Sangre</th>
          </tr>
        </thead>
        <tbody id="tbl_estudiantes">
            <%
            Estudiante estudiante = new Estudiante ();
            DefaultTableModel tabla = new DefaultTableModel();
            tabla = estudiante.leer();
            for (int t=0;t<tabla.getRowCount();t++){                
                out.println("<tr data-id=" + tabla.getValueAt(t,0)  + " data-id_c=" + tabla.getValueAt(t,9) + ">");
                out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
                out.println("<td>" + tabla.getValueAt(t, 2) + "</td>");
                out.println("<td>" + tabla.getValueAt(t, 3) + "</td>");
                out.println("<td>" + tabla.getValueAt(t, 4) + "</td>");
                out.println("<td>" + tabla.getValueAt(t, 5) + "</td>");
                out.println("<td>" + tabla.getValueAt(t, 6) + "</td>");
                out.println("<td>" + tabla.getValueAt(t, 7) + "</td>");
                out.println("<td>" + tabla.getValueAt(t, 8) + "</td>");
                out.println("</tr>");
            }
            %>
      
        </tbody>
      </table>        
     </div> 
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
        <script type="text/javascript">
            function limpiar(){
            $("#txt_id").val(0);
            $("#txt_carnet").val('');
            $("#txt_nombres").val('');
            $("#txt_apellidos").val('');
            $("#txt_direccion").val('');
            $("#txt_telefono").val('');
            $("#txt_email").val('');
            $("#txt_fn").val('');
            $("#drop_sangre").val(1);
            }
            
        $('#tbl_estudiantes').on('click','tr td',function(evt){
            var target,id,id_c,carnet,nombres,apellidos,direccion,telefono,email,nacimiento;
            target = $(event.target);
            id = target.parent().data('id');
            id_c = target.parent().data('id_c');
            carnet = target.parent("tr").find("td").eq(0).html();
            nombres = target.parent("tr").find("td").eq(1).html();
            apellidos = target.parent("tr").find("td").eq(2).html();
            direccion = target.parent("tr").find("td").eq(3).html();
            telefono = target.parent("tr").find("td").eq(4).html();
            email = target.parent("tr").find("td").eq(5).html();
            nacimiento = target.parent("tr").find("td").eq(6).html();
            $("#txt_id").val(id);
            $("#txt_carnet").val(carnet);
            $("#txt_nombres").val(nombres);
            $("#txt_apellidos").val(apellidos);
            $("#txt_direccion").val(direccion);
            $("#txt_telefono").val(telefono);
            $("#txt_email").val(email);
            $("#txt_fn").val(nacimiento);
            $("#drop_sangre").val(id_c);
            $("#modal_estudiante").modal('show');
        });

     </script>  
        
    </body>
</html>
