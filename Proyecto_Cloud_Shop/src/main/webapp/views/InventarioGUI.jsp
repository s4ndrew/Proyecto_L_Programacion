<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp"></jsp:include>
<head>
<jsp:include page="header.jsp"></jsp:include>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:include page="footer.jsp"></jsp:include>
<body>
	<main>
		<section class="container">

			<div class="row">

				<div class="col-lg-3 col-md-6 col-sm-12 mt-2">
					<!-- INICIO DEL FORMULARIO -->
					<form class="needs-validation" action="ProductoController"
						method="POST" novalidate>

						<h1 class="text-center text-primary mb-4">Producto</h1>

						<div class="form-floating mb-3">
							<input type="text" name="txtNombre" class="form-control"
								placeholder="" required> <label>Nombre</label>
							<div class="invalid-feedback">Ingrese el nombre</div>
						</div>

						<div class="form-floating mb-3">
							<input type="number" name="txtPrecio" min="0" step="0.01"
								class="form-control" placeholder="" required> <label>Precio</label>
							<div class="invalid-feedback">Ingrese el precio</div>
						</div>

						<div class="form-floating mb-3">
							<input type="number" name="txtStock" min="0" step="1"
								class="form-control" placeholder="" required> <label>Stock</label>
							<div class="invalid-feedback">Ingrese el stock</div>
						</div>

						<input class="btn btn-primary w-100" type="submit"
							value="Ingresar">

					</form>
					<!-- FIN DEL FORMULARIO -->
				</div>

				<div class="col-lg-8 col-md-6 col-sm-12 mt-2">
					<!-- INICIO DE LA TABLA -->
					<div class="table-responsive">
						<table class="table table-bordered">
							<thead>
								<tr class="text-center">
									<th scope="col">ID</th>
									<th scope="col">Nombre</th>
									<th scope="col">Precio</th>
									<th scope="col">Stock</th>
									<th scope="col">Editar</th>
									<th scope="col">Eliminar</th>
								</tr>
							</thead>
							<tbody>

								<tr class="text-center">
									<th scope="row">1</th>
									<td>${objProducto.getNombre()}</td>
									<td>${objProducto.getPrecio()}</td>
									<td>${objProducto.getStock()}</td>
									<td><i class="bi bi-pencil-square text-warning"></i></td>
									<td><i class="bi bi-trash-fill text-danger"></i></td>
								</tr>

							</tbody>
						</table>
					</div>
					<!-- FIN DE LA TABLA -->
				</div>

			</div>

		</section>
	</main>
</body>
</html>