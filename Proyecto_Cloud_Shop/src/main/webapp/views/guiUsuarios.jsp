<%@page import="model.Usuarios"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.UsuariosDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	UsuariosDAO dao = new UsuariosDAO();
	ArrayList<Usuarios> lista = dao.listarUsuarios();
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
						<input type="text" name="txtUsuario" class="form-control form-control-lg" placeholder="Usuario" required>
						<div class="invalid-feedback">Ingrese Usuario.</div>
					</div>
					
					<div class="col-3">
						<input type="text" name="txtDNI" class="form-control form-control-lg" placeholder="DNI" required>
						<div class="invalid-feedback">Ingrese DNI.</div>
					</div>
					
					<div class="col-6">
						<input type="text" name="txtNombre" class="form-control form-control-lg" placeholder="Nombre" required>
						<div class="invalid-feedback">Ingrese Nombre.</div>
					</div>
				</div>
				
				<div class="row g-4 mb-4">
					<div class="col-6">
						<input type="text" name="txtApellidos" class="form-control form-control-lg" placeholder="Apellidos" required>
						<div class="invalid-feedback">Ingrese Apellidos.</div>
					</div>
					
					
					<div class="col-6">
						<select class="form-select form-select-lg" name="cboRol" aria-label="Default select example" required>
							<option value = "" selected>Seleccione un rol</option>
							<option value="Vendedor">Vendedor</option>
							<option value="Administrador">Administrador</option>
							<option value="Gerente">Gerente</option>
						</select>
						<div class="invalid-feedback">Ingrese Rol.</div>
					</div>
				</div>
				
				<div class="row g-4 mb-4">
					<div class="col-6">
						<input type="text" name="txtCorreo" class="form-control form-control-lg" placeholder="Correo" required>
						<div class="invalid-feedback">Ingrese Correo.</div>
					</div>
					
					<div class="col-6">
						<input type="password" name="txtContraseña" class="form-control form-control-lg" placeholder="Contraseña" required>
						<div class="invalid-feedback">Ingrese Contraseña.</div>
					</div>
				</div>
				
				<div class="text-start my-4">
					<input type="hidden" name="accion" value="registrar">
					<button class="btn btn-success btn-lg px-5 py-2" type="submit">REGISTRAR</button>
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
				            <th class="border-0 p-3">Contraseña</th>
				            <th class="border-0 p-3">Acciones</th>
				        </tr>
				    </thead>
				
				    <tbody>
				    	<% for ( Usuarios u : lista) { %>
				        <tr class="text-center">
				            <td class="border-end p-3"><%= u.getUsuario() %></td>
				            <td class="border-end p-3"><%= u.getDni()  %></td>
				            <td class="border-end p-3"><%= u.getNombre() %></td>
				            <td class="border-end p-3"><%= u.getApellidos() %></td>
				            <td class="border-end p-3"><%= u.getRol() %></td>
				            <td class="border-end p-3"><%= u.getCorreo() %></td>
				            <td class="border-end p-3"><%= u.getContraseña() %></td>
	                        <td class="border-end me-3">
	                        	<input type="hidden" name="accion" value="editar">
	                        	<button class="border-0 btn btn-warning">
	                        		<i class="bi bi-pencil-square fs-5"></i>
	                        	</button>
	                        	
	                        	<input type="hidden" name="accion" value="eliminar">
	                            <button class="border-0 btn btn-danger">
	                            	<i class="bi bi-trash-fill fs-5"></i>
	                            </button>
	                        </td>
	                    </tr>
	                    <% } %>
				    </tbody>
				</table>
			</div>
			
		</section>	
	</main>

<jsp:include page="./components/footer.jsp"></jsp:include>
</body>
</html>
