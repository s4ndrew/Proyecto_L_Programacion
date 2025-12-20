<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<jsp:include page="./components/head.jsp"></jsp:include>

<body style="background-color: rgba(243, 244, 246, 1)">

	<jsp:include page="./components/header.jsp"></jsp:include>

	<main class="container d-flex justify-content-center">

		<section class="card p-4 my-5 rounded-4 shadow-lg border-0"
			style="max-width: 1000px; width: 100%;">

			<h3 class="text-start mb-4">
				<i class="bi bi-cart-fill me-2"></i>Ventas
			</h3>

			<!-- FORMULARIO -->
			<form action="${pageContext.request.contextPath}/VentasControllers"
				method="POST" novalidate>
				<input type="hidden" name="accionarVenta" value="registrar">
				<!-- FILA 1 -->
				<div class="row g-4 mb-3">
					<div class="col-6">
						<input type="text" name="txtDNI"
							class="form-control form-control-lg" placeholder="DNI" required>
						<div class="invalid-feedback">Ingrese DNI.</div>
					</div>

					<div class="col-6">
						<input type="text" name="txtNombre"
							class="form-control form-control-lg" placeholder="Nombre"
							required>
						<div class="invalid-feedback">Ingrese Nombre.</div>
					</div>
				</div>

				<!-- FILA 2 -->
				<div class="row g-4 mb-3">
					<div class="col-6">
						<input type="text" name="txtApellidos"
							class="form-control form-control-lg" placeholder="Apellidos"
							required>
						<div class="invalid-feedback">Ingrese Apellidos.</div>
					</div>

					<div class="col-6">
						<select class="form-select form-select-lg" name="cboCategoria"
							required>
							<option value="">Categoría</option>
							<%
							
							List<String> categorias = (List<String>) request.getAttribute("categorias");

							
							if (categorias != null && !categorias.isEmpty()) {
								for (String categoria : categorias) {
							%>
							<option value="<%=categoria%>"><%=categoria%></option>
							<%
							}
							} else {
							%>
							<option value="">No hay categorías disponiblessss</option>
							<%
							}
							%>
						</select>
						<div class="invalid-feedback">Seleccione una categoría.</div>
					</div>
				</div>

				<!-- FILA 3 -->
				<div class="row g-4 mb-4">
					<div class="col-6">
						<select class="form-select form-select-lg" name="cboProducto"
							required>
							<option value="">Producto</option>
							<option value="1">HP</option>
							<option value="2">Asus</option>
							<option value="3">Msi</option>
						</select>
						<div class="invalid-feedback">Seleccione un producto.</div>
					</div>

					<div class="col-6">
						<input type="number" name="txtCantidad"
							class="form-control form-control-lg" placeholder="Cantidad"
							required>
						<div class="invalid-feedback">Ingrese la cantidad.</div>
					</div>
				</div>

				<!-- FILA 4 -->
				<div class="row g-4 mb-3">
					<div class="col-6">
						<input type="text" name="txtPrecio"
							class="form-control form-control-lg" placeholder="Precio"
							required>
						<div class="invalid-feedback">Falta Precio.</div>
					</div>

					<div class="col-6">
						<input type="text" name="txtTotal"
							class="form-control form-control-lg" placeholder="Total" required>
						<div class="invalid-feedback">Falta Total.</div>
					</div>
				</div>



				<!-- BOTÓN REGISTRAR -->
				<div class="text-start my-4">
					<button class="btn btn-success btn-lg px-5 py-2" type="submit">AGREGAR</button>
				</div>
			</form>

			<div class="input-group mb-3 shadow-sm">
				<span class="input-group-text bg-white"><i
					class="bi bi-search"></i></span> <input type="text"
					class="form-control form-control-lg" placeholder="Buscar Venta">
			</div>

			<!-- TABLA -->
			<div class="table-responsive">
				<table id="tblBuscador"
					class="table table-hover rounded-4 overflow-hidden shadow-sm mt-4">
					<thead class="table-secondary text-white">
						<tr class="text-center">
							<th class="border-0 p-3">DNI</th>
							<th class="border-0 p-3">Nombre</th>
							<th class="border-0 p-3">Apellidos</th>
							<th class="border-0 p-3">Categoría</th>
							<th class="border-0 p-3">Producto</th>
							<th class="border-0 p-3">Cantidad</th>
							<th class="border-0 p-3">Precio</th>
							<th class="border-0 p-3">Total</th>
							<th class="border-0 p-3">Acciones</th>
						</tr>
					</thead>

					<tbody>
						<tr class="text-center">
							<td class="border-end p-3"></td>
							<td class="border-end p-3"></td>
							<td class="border-end p-3"></td>
							<td class="border-end p-3"></td>
							<td class="border-end p-3"></td>
							<td class="border-end p-3"></td>
							<td class="border-end p-3"></td>
							<td class="border-end p-3"></td>
							<td class="border-end me-3"><input type="hidden"
								name="accion" value="editar">
								<button class="border-0 btn btn-warning">
									<i class="bi bi-pencil-square fs-5"></i>
								</button> <input type="hidden" name="accion" value="eliminar">
								<button class="border-0 btn btn-danger">
									<i class="bi bi-trash-fill fs-5"></i>
								</button></td>
						</tr>
					</tbody>
				</table>
			</div>

		</section>
	</main>

	<jsp:include page="./components/footer.jsp"></jsp:include>

</body>
</html>
