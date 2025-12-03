<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp"></jsp:include>
<body class="container">
	<jsp:include page="header.jsp"></jsp:include>

	<div class="row">
		<div class="col">
			<h2 class="text-center">Reporte de Ventas</h2>
		</div>
	</div>
	<div class="mt-4">
		<div class="col-lg-5 col-12 ">
			<form class="d-flex" role="search">
				<input class="form-control me-2" type="search" placeholder="Search"
					aria-label="Search" />
				<button class="btn btn-success" type="submit">Search</button>
			</form>
		</div>

		<table class="table table-bordered mt-4">
			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Categoria</th>
					<th scope="col">Producto</th>
					<th scope="col">Cantidad</th>
					<th scope="col">Precio</th>
					<th scope="col">Total</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<th scope="row">2</th>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<th scope="row">3</th>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>