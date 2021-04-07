<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="entities.LineaPrestamo"%> 
<%@page import="entities.Prestamo"%> 
<%@page import="entities.MyResult"%>  
<%@page import="entities.Ejemplar"%>  
<%@page import="logic.LibroController"%>
<%@page import="java.util.LinkedList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Modificar Linea Prestamo</title>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href = "css/messages.css" rel="stylesheet">
<link href = "css/listado.css" rel="stylesheet">
<style type="text/css">@import url("css/calendar-blue.css");</style>

</head>
<body>
<% LineaPrestamo lineaP = (LineaPrestamo)request.getAttribute("lineaPrestamoAEditar"); 
LibroController ctrlL = new LibroController();
LinkedList<Ejemplar> ejemplares = ctrlL.getAllEjemplaresDisponibles();
%>

<section id="tabs" class="project-tab">
 
<form class="form-horizontal" action="modificarLineaPServlet" method="post">
<section>
<fieldset>
<!-- Este me guarda el atributo id -->
<input type="text" name="idPrestamo" value=<%=lineaP.getIdPrestamo()%> hidden="true">
<div class="form-group">
<label class="col-md-4 control-label" for="id">Id Prestamo: <%=lineaP.getIdPrestamo()%> </label>  
</div> 

<!-- Este me guarda el atributo id -->
<input type="text" name="id" value=<%=lineaP.getIdLineaPrestamo()%> hidden="true">
<div class="form-group">
<label class="col-md-4 control-label" for="id">Id L�nea Pr�stamo: <%=lineaP.getIdLineaPrestamo()%> </label>  
</div> 

<div class="form-group">
  <label class="col-md-4 control-label" for="fechaDevolucion">Fecha Devoluci�n: </label>  
  <div class="col-md-4">
  <input type="text" name="fecha" id="fecha" value=<%=lineaP.getFechaDevolucion() %>  placeholder="Fecha Alta" class="form-control input-md" />
<img src="calendario.png" id="selector" />

<script type="text/javascript">
window.onload = function() {
  Calendar.setup({
    inputField: "fecha",
    ifFormat:   "%Y-%m-%d",
    button:     "selector"
  });
}
</script>
  
  </div>
</div>


<div class="form-group">
  <label class="col-md-4 control-label" for="idEjemplar">Id Ejemplar: </label>  
 
  <div>
				   <% if( ejemplares != null) {%>
				                            <select name="idEjemplar" value=<%=lineaP.getIdEjemplar() %> class="form-control">
				                                <option selected="true" value="<%=lineaP.getIdEjemplar()%>"><%=lineaP.getIdEjemplar()%></option>
				                                <%  for(int i = 0; i < ejemplares.size(); i++) {
				                                   Ejemplar e = (Ejemplar)ejemplares.get(i);
				                                   %>
				                                <option value="<%=e.getIdEjemplar()%>"><%=e.getIdEjemplar()%> - <%=e.getTitulo() %></option>
				                                <% } %>
				                            </select>
				                            <% }else{ %> <td> No hay ejemplares disponibles.  <%} %>
				                        
				  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" for="devuelto">Devuelto: </label>  
<%if(lineaP.isDevuelto()){%>
 <label class="radio-inline"><input type="radio" name="devuelto" value="1" checked>S�</label>
<label class="radio-inline"><input type="radio" name="devuelto" value="0">No</label>
<%}else{ %>
<label class="radio-inline"><input type="radio" name="devuelto" value="1">S�</label>
<label class="radio-inline"><input type="radio" name="devuelto" value="0" checked>No</label>
<%} %>
</div>


</fieldset>
<table>
<td>
<button class="btn btn-lg btn-primary" style = "FONT-SIZE: 10pt; width:250px;margin:0 auto">Modificar</button>
</td>
<td>
<input type="button" onclick="history.back()" class="btn btn-lg btn-primary" name="Volver" value="Volver" style = "FONT-SIZE: 10pt;width:250px; margin:0 auto">
</td>
</table>

 
  </section>
</form>
  </section>
  


 <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2020</p>
    </div>
    <!-- /.container -->
  </footer>
  
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="js/calendar.js" /></script>
<script type="text/javascript" src="js/calendar-es.js" /></script>
<script type="text/javascript" src="js/calendar-setup.js" /></script>
</body>
</html>