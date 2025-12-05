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

	<main class="container py-4">

		<h1 class="text-center fw-bold mb-4">Registrar Productos Nuevos</h1>

		<div class="box-outline mb-5">

			<form action="ProductoController" method="POST">

				<div class="row mb-3">
					<div class="col-md-6">
						<label class="form-label fw-semibold">CATEGORIA</label> <input
							type="text" class="form-control" name="categoria" required>
					</div>
					<div class="col-md-6">
						<label class="form-label fw-semibold">CODIGO</label> <input
							type="text" class="form-control" name="codigo" required>
					</div>
				</div>

				<div class="row mb-3">
					<div class="col-md-6">
						<label class="form-label fw-semibold">PRODUCTO</label> <input
							type="text" class="form-control" name="producto" required>
					</div>
					<div class="col-md-6">
						<label class="form-label fw-semibold">STOCK</label> <input
							type="number" class="form-control" name="stock" required>
					</div>
				</div>

				<div class="row mb-4">
					<div class="col-md-6">
						<label class="form-label fw-semibold">MARCA</label> <input
							type="text" class="form-control" name="marca" required>
					</div>
					<div class="col-md-6">
						<label class="form-label fw-semibold">PRECIO</label> <input
							type="number" step="0.01" class="form-control" name="precio"
							required>
					</div>
				</div>

				<div class="text-center">
					<button class="btn btn-wireframe px-5">REGISTRAR</button>
				</div>
			</form>

		</div>

		<div class="search-box">
			<i class="bi bi-search"></i> <input type="text"
				placeholder="Buscar Productos">
		</div>

		<div class="table-responsive">
			<table class="table text-center align-middle">
				<thead>
					<tr>
						<th>Categoría</th>
						<th>Producto</th>
						<th>Código</th>
						<th>Stock</th>
						<th>Precio</th>
						<th>Eliminar</th>
						<th>Modificar</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>Componentes</td>
						<td>Procesador Intel i5 12400F</td>
						<td>001</td>
						<td>18</td>
						<td>$180</td>
						<td><i class="bi bi-trash-fill text-danger fs-5"></i></td>
						<td><i class="bi bi-pencil-square text-primary fs-5"></i></td>
					</tr>
				</tbody>
			</table>
		</div>

	</main>

</body>

</html>