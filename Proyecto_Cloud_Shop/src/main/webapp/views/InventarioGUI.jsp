<%@page import="java.util.List"%>
<%@page import="model.Inventario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="connection.ConexionMySQL"%>
<!DOCTYPE html>

<html>
<jsp:include page="./components/head.jsp"></jsp:include>
<body style="background-color: rgba(243, 244, 246, 1)">
	<jsp:include page="./components/header.jsp"></jsp:include>
	<main class="container d-flex justify-content-center">
		<section class="card p-4 my-5 rounded-4 shadow-lg border-0"
			style="max-width: 1000px; width: 100%;">
			<h3 class="text-start mb-4">
				<i class="bi bi-box-seam-fill me-2"></i>Inventario
			</h3>
			<form class="needs-validation"
				action="${pageContext.request.contextPath}/InventarioController"
				method="POST" novalidate>
				<div class="row g-4 mb-3">
					<div class="col-6">
						<label class="form-label fw-semibold">Código de producto</label><input
							type="text" name="txtCodigo" class="form-control" required>
						<div class="invalid-feedback">Ingrese el código del producto</div>
					</div>
					<div class="col-6">
						<label class="form-label fw-semibold">Categoría</label> <select
							class="form-select form-select-lg" name="cboCategoria" required>
							<option value=""></option>
							<option value="Laptop">Laptop</option>
							<option value="Desktop">Desktop</option>
							<option value="GPU">GPU</option>
							<option value="Monitor">Monitor</option>
							<option value="Impresora">Impresora</option>
							<option value="Teclado">Teclado</option>
							<option value="Mouse">Mouse</option>
							<option value="Accesorios">Accesorios</option>
							<option value="Redes">Redes</option>
							<option value="Servidores">Servidores</option>
							<option value="Almacenamiento">Almacenamiento</option>
							<option value="Software">Software</option>
						</select>
						<div class="invalid-feedback">Seleccione una categoría.</div>
					</div>
				</div>
				<div class="row g-4 mb-3">
					<div class="col-6">
						<label class="form-label fw-semibold">Producto</label><input
							type="text" name="txtProducto" class="form-control" required>
						<div class="invalid-feedback">Ingrese el producto.</div>
					</div>
					<div class="col-6">
						<label class="form-label fw-semibold">Stock</label><input
							type="text" name="txtStock" class="form-control" required>
						<div class="invalid-feedback">Ingrese el stock.</div>
					</div>
				</div>
				<div class="row g-4 mb-4">
					<div class="col-6">
						<label class="form-label fw-semibold">Marca</label><input
							type="text" name="txtMarca" class="form-control" required>
						<div class="invalid-feedback">Ingrese la marca.</div>
					</div>
					<div class="col-6">
						<label class="form-label fw-semibold">Precio</label><input
							type="text" name="txtPrecio" class="form-control" required>
						<div class="invalid-feedback">Ingrese el precio.</div>
					</div>
				</div>
				<input class="btn btn-primary w-100" type="submit"
							value="Ingresar">
				<div class="text-start my-4">
					<button class="btn btn-success btn-lg px-5 py-2">REGISTRAR</button>
				</div>
			</form>

			<div class="table-responsive rounded-4">
				<table id="tblBuscador"
					class="table table-hover rounded-4 overflow-hidden shadow-sm mt-3">
					<thead class="table-dark">
						<tr class="text-center">
							<th class="border-0 p-3">N°</th>
							<th class="border-0 p-3">Código</th>
							<th class="border-0 p-3">Categoría</th>
							<th class="border-0 p-3">Producto</th>
							<th class="border-0 p-3">Marca</th>
							<th class="border-0 p-3">Precio/u</th>
							<th class="border-0 p-3">Stock</th>
							<th class="border-0 p-3"></th>
						</tr>
					</thead>
					<tbody>
						<%
						for (Inventario I : (List<Inventario>) request.getAttribute("listaProductos")) {
						%>
						<tr class="text-center">
							<th scope="row"><%=I.getId_inventario()%></th>
							<td><%=I.getCodigo()%></td>
							<td><%=I.getCategoria()%></td>
							<td><%=I.getProducto()%></td>
							<td><%=I.getMarca()%></td>
							<td><%=I.getPrecio()%></td>
							<td><%=I.getStock()%></td>
							<td>
								<div class="d-flex justify-content-center gap-2">
									<a href="" class="btn btn-warning btn-sm"> <i
										class="bi bi-pencil-square"></i>
									</a> <a href="" class="btn btn-danger btn-sm"
										onclick="return confirm('¿Seguro que desea eliminar este registro?');">
										<i class="bi bi-trash-fill"></i>
									</a>
								</div>
							</td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
		</section>
	</main>
	<jsp:include page="./components/footer.jsp"></jsp:include>
</body>
</html>
