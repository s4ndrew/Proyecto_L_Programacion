<%@page import="java.util.ArrayList"%>
<%@page import="model.Usuarios"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Usuarios usuarios = (Usuarios) request.getAttribute("user");
	Boolean esEdicion = (Boolean) request.getAttribute("esEdicion");
	if (esEdicion == null) esEdicion = false;
%>

<!DOCTYPE html>
<html>
<jsp:include page="./components/head.jsp"></jsp:include>
<body style="background-color: rgba(243, 244, 246, 1)">
	<jsp:include page="./components/header.jsp"></jsp:include>
	
	<main class="container d-flex justify-content-center">
		<section class="card p-4 my-5 rounded-4 shadow-lg border-0" style="max-width: 1000px; width: 100%;">
		
			<h3 class="text-start mb-4"><i class="bi bi-people-fill me-2"></i>Usuarios</h3>
			
			<form class="needs-validation" novalidate action="${pageContext.request.contextPath}/UsuariosControllers" method="post">
				
				<div class="row g-4 mb-4">
					<div class="col-3">
						<input type="text" name="txtUsuario" class="form-control form-control-lg" placeholder="Usuario" required value = "<%= (usuarios != null) ? usuarios.getUsuario() : "" %>">
						<div class="invalid-feedback">Ingrese Usuario.</div>
					</div>
					
					<div class="col-3">
						<input type="text" name="txtDNI" class="form-control form-control-lg" placeholder="DNI" required value ="<%= (usuarios != null) ? usuarios.getDni() : "" %>">
						<div class="invalid-feedback">Ingrese DNI.</div>
					</div>
					
					<div class="col-6">
						<input type="text" name="txtNombre" class="form-control form-control-lg" placeholder="Nombre" required value = "<%= (usuarios != null) ? usuarios.getNombre() : "" %>">
						<div class="invalid-feedback">Ingrese Nombre.</div>
					</div>
				</div>
				
				<div class="row g-4 mb-4">
					<div class="col-6">
						<input type="text" name="txtApellidos" class="form-control form-control-lg" placeholder="Apellidos" required value = "<%= (usuarios != null) ? usuarios.getApellidos() : "" %>">
						<div class="invalid-feedback">Ingrese Apellidos.</div>
					</div>
					
					
					<div class="col-6">
						<select class="form-select form-select-lg" name="cboRol" aria-label="Default select example" required>
							<option value="">Seleccione un rol</option>
							<option value="Vendedor" <%= (usuarios != null && "Vendedor".equals(usuarios.getRol())) ? "selected" : "" %>>Vendedor</option>
							<option value="Administrador" <%= (usuarios != null && "Administrador".equals(usuarios.getRol())) ? "selected" : "" %>>Administrador</option>
							<option value="Gerente" <%= (usuarios != null && "Gerente".equals(usuarios.getRol())) ? "selected" : "" %>>Gerente</option>
							
						</select>
						<div class="invalid-feedback">Ingrese Rol.</div>
					</div>
				</div>
				
				<div class="row g-4 mb-4">
					<div class="col-6">
						<input type="text" name="txtCorreo" class="form-control form-control-lg" placeholder="Correo" required value = "<%= (usuarios != null) ? usuarios.getCorreo() : "" %>">
						<div class="invalid-feedback">Ingrese Correo.</div>
					</div>
					
					<div class="col-6">
						<input type="text" name="txtContraseña" class="form-control form-control-lg" placeholder="Contraseña" <%= esEdicion ? "readonly" : "required" %>>
						<div class="invalid-feedback">Ingrese Contraseña.</div>
					</div>
				</div>
				
				<div class="text-start my-4">
					<% if(esEdicion && usuarios != null) {%>
					<input type="hidden" name="id" value="<%= usuarios.getId_usuarios() %>">
					<input type="hidden" name="accion" value="editar">
					<% }else { %>
					<input type="hidden" name="accion" value="guardar">
					<% } %>
					<button class="btn btn-success btn-lg px-5 py-2" type="submit"><%= esEdicion ? "ACTUALIZAR" : "REGISTRAR" %></button>
				</div>
			</form>
			
			<div class="table-responsive">
				<table id="tblBuscador" class="table table-hover rounded-4 overflow-hidden shadow-sm mt-3">
				    <thead class="table-secondary text-white">
				        <tr class="text-center ">
				            <th class="border-0 p-3">Usuario</th>
				            <th class="border-0 p-3">DNI</th>
				            <th class="border-0 p-3">Nombre</th>
				            <th class="border-0 p-3">Apellidos</th>
				            <th class="border-0 p-3">Rol</th>
				            <th class="border-0 p-3">Correo</th>
				            <!--<th class="border-0 p-3">Contraseña</th>-->
				            <th class="border-0 p-3">Acciones</th>
				        </tr>
				    </thead>
				
				    <tbody>
				    	<% List<Usuarios> lista = (ArrayList<Usuarios>) request.getAttribute("listaUsuarios"); 
				    	
				    	if (lista != null) {
				    		for (Usuarios u : lista) {
				    	%>
				        <tr class="text-center">
				            <td class="border-end p-3"><%= u.getUsuario() %></td>
				            <td class="border-end p-3"><%= u.getDni()  %></td>
				            <td class="border-end p-3"><%= u.getNombre() %></td>
				            <td class="border-end p-3"><%= u.getApellidos() %></td>
				            <td class="border-end p-3"><%= u.getRol() %></td>
				            <td class="border-end p-3"><%= u.getCorreo() %></td>
				            <!-- <td class="border-end p-3"><%= u.getContraseña() %></td> -->
	                        <td class="border-end me-3">
	                        	<!-- FORMULARIO PARA EDITAR -->
					            <form action="${pageContext.request.contextPath}/UsuariosControllers" method="get" style="display: inline;">
					                <input type="hidden" name="accion" value="mostrar">
					                <input type="hidden" name="id" value="<%= u.getId_usuarios() %>">
					                <button type="submit" class="border-0 btn btn-warning">
					                    <i class="bi bi-pencil-square fs-5"></i>
					                </button>
					            </form>
					            
					            <!-- FORMULARIO PARA ELIMINAR -->
					            <form action="${pageContext.request.contextPath}/UsuariosControllers" method="post" style="display: inline;">
					                <input type="hidden" name="accion" value="eliminar">
					                <input type="hidden" name="id" value="<%= u.getId_usuarios() %>">
					                <button type="submit" class="border-0 btn btn-danger">
					                    <i class="bi bi-trash-fill fs-5"></i>
					                </button>
					            </form>
	                        </td>
	                    </tr>
	                    <% } 
				    	}
	                    %>
				    </tbody>
				</table>
			</div>
			
		</section>	
	</main>

	<jsp:include page="./components/tabla-script.jsp"></jsp:include>
<jsp:include page="./components/footer.jsp"></jsp:include>
</body>
</html>
