<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp"></jsp:include>
<body class="container">
	
		<jsp:include page="header.jsp"></jsp:include>
		
		<main class= "d-flex align-item-center justify-content-center">
				
			<section class="container">
			
				
					
					<div class="col-lg-4 col-md-6 col-sm-12 mt-2">
						
						<form class="needs-validation" action="VentasController" method="POST" novalidate > 
						<div class="col-12">
							<h1 class="text-center text-secondary mb-4">Registrar Venta</h1>
			<div class="row">
					<div class="col">						
							<div class="form-floating mb-3">
							  <input type="text" name="txtNombre" class="form-control" placeholder="" required>
							  <label>Nombre y Apellido</label>
							  <div class="invalid-feedback"> Ingrese su nombre</div>
							</div>	
					</div>
					
					<div class="col">
							<div class="form-floating mb-3">
							  <input type="number" name="txtDNI" class="form-control" placeholder="" required>
							  <label>DNI</label>
							  <div class="invalid-feedback"> Ingrese su dni</div>
							</div>
					</div>
							
			</div>
			
			<div class="row">
						<div class="col">
			
							<div class="form-floating mb-3"name="cboCategoria">
								<select class="form-select">
									<option value="" selected>Selecione una opción</option>
									<option value="1">Laptop</option>
									<option value="2">Desktop</option>
									<option value="3">GPU</option>
								</select>
								</div>
							</div>
							
						<div class="col">
							<div class="form-floating mb-3">
								<select class="form-select" name="cboProducto">
									<option value="" selected>Selecione una opción</option>
									<option value="1">HP</option>
									<option value="2">Asus</option>
									<option value="3">Msi</option>
								</select>		
							</div>			
							
						</div>	
				</div>				
								
						<div class="row">
						
							<div class="col">
						
							<div class="form-floating mb-3">
							  <input type="number" name="txtCantidad" class="form-control" placeholder="" required>
							  <label>Cantidad</label>
							  <div class="invalid-feedback"> Ingrese la cantidad</div>
							</div>
						</div>
						
						<div class="col">
										
							<div class="form-floating mb-3">
							  <input type="number" name="txtPrecio" min="0" step="0.01" class="form-control" placeholder="" required>
							  <label>Precio</label>
							  <div class="invalid-feedback"> Ingrese el precio</div>
							</div>
						</div>
					</div>
							
								</div>																									
							<input class="btn btn-success w-100" type="submit" value="Agregar">
													
						</form>	
				</div>
	<div class="col-12">
					<div class="col-lg-12 col-md-4 col-sm-2 mt-2">
					
					  <div class="table-responsive">
						<table class="table table-bordered">
						  <thead>
						    <tr class="text-center">
						      <th scope="col">Código</th>
						      <th scope="col">Nombre y Apellido</th>
						      <th scope="col">DNI</th>
						      <th scope="col">Categoría</th>
						      <th scope="col">Producto</th>
						      <th scope="col">Cantidad</th>
						      <th scope="col">Precio</th>
						      <th scope="col">Eliminar</th>
						      <th scope="col">Modificar</th>
						    </tr>
						  </thead>
						  <tbody>
						  
						    <tr class="text-center">
						      <th scope="row">1</th>
						      <td>${objVentas.getNombre()}</td>
						      <td>${objVentas.getDNI()}</td>
						      <td>${objVentas.getCategoria()}</td>
						      <td>${objVentas.getProducto()}</td>
						      <td>${objVentas.getCantidad()}</td>
						      <td>${objVentas.getPrecio()}</td>
						      <td> <i class="bi bi-trash-fill text-danger"></i> </td>
						      <td> <i class="bi bi-pencil-square text-warning"></i> </td>
						    </tr>
						
						  </tbody>
						</table>
					  </div>
					
					</div>			
									
				</div>	
			</div>						
				
			</section>
			
				
		</main>
	
		<jsp:include page="footer.jsp"></jsp:include>
				
	</body>
</html>
				