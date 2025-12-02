<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp"></jsp:include>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<main class="mt-4">
		<h1 class="text-center mb-5">Registrar Usuarios</h1>

		<div class="container">
			<div class="row">
				<div class="col-6">
					<div  class= "user-card card bordered p-5">
						<form class="row needs-validation" novalidate>
						
						<div class="row g-0 align-items-center mb-4">
						  <div class="col-3">
						    <label for="validationCustomUsername" class="col-form-label input-group has-validation">USUARIO</label>
						  </div>
						  <div class="col-9">
						    <input type="text"  class="form-control" required>
						    <div class="invalid-feedback">Ingrese usuario.</div>
						  </div>
						</div>
					  
					  	<div class="row g-0 align-items-center mb-4">
						  <div class="col-3">
						    <label for="validationCustomUsername" class="col-form-label input-group has-validation">NOMBRE</label>
						  </div>
						  <div class="col-9">
						    <input type="text"  class="form-control" required>
						    <div class="invalid-feedback">Ingrese nombre.</div>
						  </div>
						</div>
						
						<div class="row g-0 align-items-center mb-4">
						  <div class="col-3">
						    <label for="validationCustomUsername" class="col-form-label input-group has-validation">APELLIDOS</label>
						  </div>
						  <div class="col-9">
						    <input type="text"  class="form-control" required>
						    <div class="invalid-feedback">Ingrese apellidos.</div>
						  </div>
						</div>
						
						<div class="row g-0 align-items-center mb-4">
						  <div class="col-3">
						    <label for="validationCustomUsername" class="col-form-label input-group has-validation">ROL</label>
						  </div>
						  <div class="col-9">
						    <select class="form-select" aria-label="Default select example" required>
							  <option selected>Seleccione una opcion</option>
							  <option value="1">Vendedor</option>
							  <option value="2">Administrador</option>
							  <option value="3">Gerente</option>
							</select>
						    <div class="invalid-feedback">Ingrese rol.</div>
						  </div>
						</div>
						
					  	<div class="text-center mt-2">
					    	<button class="btn btn-primary" type="submit">REGISTRAR</button>
					  	</div>
					</form>
				</div>
			</div>
				
			<div class="col-6">
					<table class="table table-bordered table-hover">
					  <thead>
					    <tr>
					      <th scope="col">Usuario</th>
					      <th scope="col">Nombre</th>
					      <th scope="col">Apellidos</th>
					      <th scope="col">Rol</th>
					      <th scope="col">Modificar</th>
					      <th scope="col">Eliminar</th>
					    </tr>
					  </thead>
					  <tbody>
					    <tr class="text-center">
					      <td>Mark</td>
					      <td>Jacob</td>
					      <td>Jacob</td>
					      <td>Jacob</td>
					   	  <td><i class="bi bi-pencil-square text-warning"></i></td>
					      <td><i class="bi bi-trash text-danger"></i></td>
					    </tr>
					</table>
				</div>
			</div>
		</div>
	
	</main>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>