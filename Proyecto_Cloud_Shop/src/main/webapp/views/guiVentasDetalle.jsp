
<%@page import="model.Ventas"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Inventario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<jsp:include page="./components/head.jsp"></jsp:include>

<body style="background-color: rgba(243, 244, 246, 1)">

	<jsp:include page="./components/header.jsp"></jsp:include>

	<%

	%>

	<main class="container d-flex justify-content-center">

		<section class="card p-4 my-5 rounded-4 shadow-lg border-0"
			style="max-width: 900px; width: 100%;">

			<%
			Ventas v = (Ventas) request.getAttribute("venta");
			if (v != null) {
			%>

			<div class="d-flex justify-content-between align-items-center mb-4">
				<div>
					<h4 class="fw-bold mb-0">CLOUD SHOP</h4>
					<small class="text-muted">Proforma / Boleta de Venta</small>
				</div>
				<div class="text-end">
					<span class="badge bg-primary fs-6">N° <%=v.getId_venta()%></span>
				</div>
			</div>

			<hr>

			<div class="row mb-4">
				<div class="col-md-6">
					<p class="mb-1">
						<strong>DNI:</strong>
						<%=v.getDni()%></p>
					<p class="mb-1">
						<strong>Cliente:</strong>
						<%=v.getNombres()%>
						<%=v.getApellidos()%></p>
					<p class="mb-1">
						<strong>Teléfono:</strong>
						<%=v.getTelefono()%></p>
				</div>
				<div class="col-md-6">
					<p class="mb-1">
						<strong>Dirección:</strong>
						<%=v.getDireccion()%></p>
					<p class="mb-1">
						<strong>Correo:</strong>
						<%=v.getCorreo()%></p>
				</div>
			</div>

			<div class="table-responsive">
				<table class="table table-bordered align-middle">
					<thead class="table-light">
						<tr class="text-center">
							<th>Categoría</th>
							<th>Producto</th>
							<th>Precio Unitario (+IGV)</th>
							<th>Cantidad</th>
						</tr>
					</thead>
					<tbody>
						<tr class="text-center">
							<td><%=v.getCategoria()%></td>
							<td><%=v.getProducto()%></td>
							<td>S/ <%=String.format("%.2f", v.getPrecio_unitario())%></td>							
							<td><%=v.getCantidad()%></td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="d-flex justify-content-end mt-4">
				<div class="border rounded-3 p-3 text-end" style="min-width: 250px;">
					<h6 class="mb-1">TOTAL A PAGAR</h6>
					<h4 class="fw-bold text-success">
						S/
						<%=String.format("%.2f", v.getTotal())%>
					</h4>
				</div>
			</div>

			<hr>

			<div class="text-center text-muted small">Gracias por su
				preferencia • Documento sin valor tributario</div>

			<%
			}
			%>
		</section>

	</main>

	<jsp:include page="./components/footer.jsp" />

</body>
</html>
