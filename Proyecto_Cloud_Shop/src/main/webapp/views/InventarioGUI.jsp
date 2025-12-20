<%@page import="java.util.List"%>
<%@page import="model.Inventario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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

			<%
			Inventario I = (Inventario) request.getAttribute("producto");

			int id = 0;
			int codigo = 0;
			String categoria = "";
			String producto = "";
			String marca = "";
			double precio = 0.0;
			int stock = 0;

			String accionFormulario = "guardar";
			String boton = "REGISTRAR";

			if (I != null) {
				id = I.getId_inventario();
				codigo = I.getCodigo();
				categoria = I.getCategoria();
				producto = I.getProducto();
				marca = I.getMarca();
				precio = I.getPrecio();
				stock = I.getStock();

				accionFormulario = "actualizar";
				boton = "ACTUALIZAR";
			}
			%>

			<form
				action="${pageContext.request.contextPath}/InventarioController"
				method="POST">

				<input type="hidden" name="accion" value="<%=accionFormulario%>">
				<input type="hidden" name="idProducto" value="<%=id%>">

				<div class="row g-4 mb-3">
					<div class="col-6">
						<label class="form-label">Código</label> <input type="number"
							name="txtCodigo" value="<%=codigo%>" class="form-control"
							required>
					</div>
					<div class="col-6">
						<label class="form-label">Categoría</label> <select
							class="form-select" name="cboCategoria" required>
							<option value="">Seleccione</option>
							<option value="Laptop"
								<%="Laptop".equals(categoria) ? "selected" : ""%>>Laptop</option>
							<option value="Desktop"
								<%="Desktop".equals(categoria) ? "selected" : ""%>>Desktop</option>
							<option value="Monitor"
								<%="Monitor".equals(categoria) ? "selected" : ""%>>Monitor</option>
						</select>
					</div>
				</div>

				<div class="row g-4 mb-3">
					<div class="col-6">
						<label class="form-label">Producto</label> <input type="text"
							name="txtProducto" value="<%=producto%>" class="form-control"
							required>
					</div>
					<div class="col-6">
						<label class="form-label">Stock</label> <input type="text"
							name="txtStock" value="<%=stock%>" class="form-control" required>
					</div>
				</div>

				<div class="row g-4 mb-4">
					<div class="col-6">
						<label class="form-label">Marca</label> <input type="text"
							name="txtMarca" value="<%=marca%>" class="form-control" required>
					</div>
					<div class="col-6">
						<label class="form-label">Precio</label> <input type="text"
							name="txtPrecio" value="<%=precio%>" class="form-control"
							required>
					</div>
				</div>

				<button class="btn btn-success btn-lg px-5"><%=boton%></button>
			</form>

			<div class="table-responsive mt-4">
				<table class="table table-hover">
					<thead class="table-dark">
						<tr class="text-center">
							<th>ID</th>
							<th>Código</th>
							<th>Categoría</th>
							<th>Producto</th>
							<th>Marca</th>
							<th>Precio</th>
							<th>Stock</th>
							<th>Acciones</th>
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
							<td><%=inv.getCodigo()%></td>
							<td><%=inv.getCategoria()%></td>
							<td><%=inv.getProducto()%></td>
							<td><%=inv.getMarca()%></td>
							<td><%=inv.getPrecio()%></td>
							<td><%=inv.getStock()%></td>
							<td><a class="btn btn-warning btn-sm"
								href="InventarioController?accion=editar&id=<%=inv.getId_inventario()%>">
									<i class="bi bi-pencil-square"></i>
							</a> <a class="btn btn-danger btn-sm"
								href="InventarioController?accion=eliminar&id=<%=inv.getId_inventario()%>"
								onclick="return confirm('¿Eliminar?');"> <i
									class="bi bi-trash-fill"></i>
							</a></td>
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
