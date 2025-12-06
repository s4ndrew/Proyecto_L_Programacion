<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp"></jsp:include>
<body style="background-color: rgba(243, 244, 246, 1)">
	<jsp:include page="header.jsp"></jsp:include>

	<main class="container d-flex justify-content-center">
		<section class="card p-4 my-5 rounded-4 shadow-lg border-0" style="max-width: 1000px; width: 100%;">
		
			<h3 class="text-start mb-4"><i class="bi bi-people-fill me-2"></i>Usuarios</h3>
			
			<form class="needs-validation" novalidate action="guiLogin.jsp">
				<div class="row g-4 mb-4">
					<div class="col-6">
						<input type="text" name="usuario" class="form-control form-control-lg" placeholder="Usuario" required>
						<div class="invalid-feedback">Ingrese usuario.</div>
					</div>
					
					<div class="col-6">
						<input type="text" name="usuario" class="form-control form-control-lg" placeholder="Nombres y Apellidos" required>
						<div class="invalid-feedback">Ingrese Nombres y Apellidos.</div>
					</div>
				</div>
				
				<div class="row g-4 mb-4">
					<div class="col-6">
						<input type="text" name="usuario" class="form-control form-control-lg" placeholder="Contraseña" required>
						<div class="invalid-feedback">Ingrese Contraseña.</div>
					</div>
					
					
					<div class="col-6">
						<select class="form-select form-select-lg" name="rol" aria-label="Default select example" required>
							<option value = "" selected>Seleccione un rol</option>
							<option value="1">Vendedor</option>
							<option value="2">Administrador</option>
							<option value="3">Gerente</option>
						</select>
						<div class="invalid-feedback">Ingrese Rol.</div>
					</div>
				</div>
				
				<div class="text-start my-4">
					<button class="btn btn-success btn-lg px-5 py-2" type="submit">REGISTRAR</button>
				</div>
			</form>
			
			<div class="table-responsive">
				<table class="table table-hover rounded-4 overflow-hidden shadow-sm mt-3">
			    <thead class="table-secondary text-white">
			        <tr class="text-center ">
			            <th class="border-0 p-3">ID</th>
			            <th class="border-0 p-3">Nombre</th>
			            <th class="border-0 p-3">Rol</th>
			            <th class="border-0 p-3">Modificar</th>
					    <th class="border-0 p3l">Eliminar</th>
			        </tr>
			    </thead>
			
			    <tbody>
			        <tr class="text-center">
			            <td class="border-end p-3">001</td>
			            <td class="border-end p-3">Giacomo Guilizzoni</td>
			            <td class="border-end p-3">Administrador</td>
                        <td class="border-end p-3">
                        	<i class="bi bi-pencil-square text-warning fs-5"></i>
                        </td>
                        <td class="p-3">
                            <i class="bi bi-trash-fill text-danger fs-5"></i>
                        </td>
			    </tbody>
			</table>
			</div>

			
			
		</section>	
	</main>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
