<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="model.Inventario"%>

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

			<form action="${pageContext.request.contextPath}/VentasControllers"
				method="POST" novalidate>

				<input type="hidden" name="accion" value="registrar"> 
				<input type="hidden" name="txtIdInventario" id="txtIdInventario">

				<div class="row g-4 mb-3">
					<div class="col-6">
						<input type="text" name="txtDNI"
							class="form-control form-control-lg" placeholder="DNI" required>
					</div>

					<div class="col-6">
						<input type="text" name="txtNombres"
							class="form-control form-control-lg" placeholder="Nombres"
							required>
					</div>
				</div>
				<div class="row g-4 mb-3">
					<div class="col-6">
						<input type="text" name="txtApellidos"
							class="form-control form-control-lg" placeholder="Apellidos"
							required>
					</div>

					<div class="col-6">
						<input type="text" name="txtTelefono"
							class="form-control form-control-lg"
							placeholder="Teléfono (opcional)">
					</div>
				</div>
				<div class="row g-4 mb-4">
					<div class="col-6">
						<input type="text" name="txtDireccion"
							class="form-control form-control-lg"
							placeholder="Dirección (opcional)">
					</div>

					<div class="col-6">
						<input type="email" name="txtCorreo"
							class="form-control form-control-lg"
							placeholder="Correo (opcional)">
					</div>
				</div>
				<div class="row g-4 mb-4">
					<div class="col-6">
						<input type="number" id="txtTotal" name="txtTotal"
							class="form-control form-control-lg" placeholder="Total" readonly>
					</div>
				</div>
				
				<div class="text-start my-4">
					<button class="btn btn-success btn-lg px-5 py-2" type="submit">
						AGREGAR</button>
				</div>
			</form>
			
			
			<!-- TABLA DE PRODUCTOS  -->
			<div class="table-responsive">
				<table id="tblBuscador"
					class="table table-hover rounded-4 overflow-hidden shadow-sm mt-3">
					<thead class="table-secondary">
						<tr class="text-center">
							<th>ID</th>
							<th>Categoría</th>
							<th>Producto</th>
							<th>Marca</th>
							<th>Precio</th>
							<th>Stock</th>
							<th>Cantidad</th>
							<th>Seleccionar</th>
						</tr>
					</thead>
					<tbody>
						<%
						List<Inventario> lista = (List<Inventario>) request.getAttribute("listaProductos");
						if (lista != null) {
							for (Inventario inv : lista) {
						%>
						<tr class="text-center">
							<td><%=inv.getId_inventario()%></td>
							<td><%=inv.getCategoria()%></td>
							<td><%=inv.getProducto()%></td>
							<td><%=inv.getMarca()%></td>
							<td><%=inv.getPrecio()%></td>
							<td><%=inv.getStock()%></td>
							<td><input type="number" min="0" value="0"
								class="form-control form-control-sm cantidad-input"
								style="width: 80px; margin: auto"></td>
							<td><input type="checkbox"
								class="form-check-input seleccionar-checkbox"
								data-id="<%=inv.getId_inventario()%>"
								data-producto="<%=inv.getProducto()%>"
								data-precio="<%=inv.getPrecio()%>"></td>
						</tr>
						<%
							}
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
