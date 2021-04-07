<%@page import="java.util.LinkedList"%>
<%@page import="entities.*"%>
<%@page import="java.util.Calendar"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Libros</title>
<% 
LinkedList<Libro> ll = (LinkedList<Libro>)request.getAttribute("listaLibros");
Persona user = (Persona)session.getAttribute("usuario");
%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href = "css/listado.css" rel="stylesheet">
<link href = "css/botones.css" rel="stylesheet">
<link href = "css/messages.css" rel="stylesheet">


<body>
<%@ include file="navInicio.jsp"%>
	<section id="tabs" class="project-tab" style = "font-family:arial;size=3">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <nav>
                            <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
                                <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab"
                                	 href="listarLibroServlet" role="tab" aria-controls="nav-home" aria-selected="false">Libros</a>
                                	 <%if (user.isAdmin()) {%>
                                <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" 
                                	href="listarProveedorServlet" role="tab" aria-controls="nav-profile" aria-selected="false">Proveedores</a>
                                <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" 	
                                href="listarPoliticaServlet" role="tab" aria-controls="nav-contact" aria-selected="false">Politicas Prestamo</a>
                               	 <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" 	
                                href="listarPrestamosServlet" role="tab" aria-controls="nav-contact" aria-selected="false">Prestamo</a>
                               	 
                                <%} %>
                            </div>
                        </nav>
                    </div>
                </div>
            </div>
            <% if (request.getAttribute("result")!=null) {
        	   MyResult res = (MyResult)request.getAttribute("result");
        	   if(res.getResult().equals(MyResult.results.OK)){
        		   %>
                   <div class="success"><%=res.getErr_message()%></div>
                  <%
        	   } else {
        	      %>
                   <div class="error"><%=res.getErr_message()%></div>
                   <%}
                   }
                 %>
            <div class="container">
            <div class="container buscar">
                <a href="agregarLibro.jsp" method="post" class="btn btn-success">+ Nuevo</a>
               	<form action="buscarLibroServlet" class="form">
               			<input class="form-control" placeholder="Titulo del Libro" type="text" name="txtbuscar">
               			<input class="btn btn" type="submit" value="Buscar"	>
               			               
               	</form>
               	
                </div>    
               </div>
               
               
                        <div class="tab-content" id="nav-tabContent">
                            <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                                <table class="table" class="text-center">
                                    <thead>
                                        <tr>
                                            <th class="text-center">ID</th>
		                    		    	<th class="text-center">titulo</th>
		                        			<th class="text-center">ISBN</th>
		                        			<th class="text-center">Numero de edicion</th>
		                        			<th class="text-center">Genero</th>
		                        			<th class="text-center">Proveedor</th>
		                        			<th class="text-center">Acciones</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% for (Libro lib : ll) { %>
                    			<tr>
                    				<td class="text-center"><%=lib.getIdLibro()%></td>
                    				<td class="text-center"><%=lib.getTitulo()%></td>
                    				<td class="text-center"><%=lib.getIsbn()%></td>
                    				<%-- <td><%=lib.getFechaEdicion()%></td> --%>
                    				<td class="text-center"><%=lib.getNroEdicion()%></td>
                    				<%-- <td><%=lib.getCantDiasMaxPrestamo()%></td> --%>
                    				<td class="text-center"><%=lib.getGenero()%></td>
                    				<td class="text-center"><%=lib.getCUIT()%> - <%=lib.getRazonSocialProv()%></td>
                    				<%if (user.isAdmin()) {%>
                    				<td class="text-center">
                    				<a class="editbutton"
									href="modificarLibroServlet?id=<%=lib.getIdLibro()%>">
										Editar </a>
									<a class="deletebutton"	href="borrarLibroServlet?id=<%=lib.getIdLibro()%>">
										Eliminar</a> 
									<a class="ejemplaresbutton" href="listarEjemplaresServlet?id=<%=lib.getIdLibro()%>">
										Ejemplares </a></td>
										<%} %>
                    				 </tr>
                    		<% } %>
                                    </tbody>
                                </table>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        <!-- <a type="button" class="editbutton">Inicio</a>
		-->					           
		<a href="listarLibrosProvServlet" method="post" class="addbutton">Lista Libros por Proveedor</a>
        </section>
     

         <!-- Footer -->
<%@ include file = "footer.jsp" %>

</body>
</html>
