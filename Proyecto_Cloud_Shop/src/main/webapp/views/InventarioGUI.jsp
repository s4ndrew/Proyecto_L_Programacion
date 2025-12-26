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

			String id = "";
			String codigo = "";
			String categoria = "";
			String producto = "";
			String marca = "";
			String precio = "";
			String stock = "";

			String accionFormulario = "guardar";
			String boton = "REGISTRAR";
	
			if (I != null) {
				id = (I.getId_inventario() != 0) ? String.valueOf(I.getId_inventario()) : "";
			    codigo = (I.getCodigo() != 0) ? String.valueOf(I.getCodigo()) : "";
				categoria = I.getCategoria();
				producto = I.getProducto();
				marca = I.getMarca();
				precio = (I.getPrecio() != 0.0) ? String.valueOf(I.getPrecio()) : "";
			    stock = (I.getStock() != 0) ? String.valueOf(I.getStock()) : "";

				accionFormulario = "actualizar";
				boton = "ACTUALIZAR";
			}

			boolean editando = (I != null);
			%>

			<form
				action="${pageContext.request.contextPath}/InventarioController"
				method="POST" class="needs-validation" novalidate>

				<input type="hidden" name="accion" value="<%=accionFormulario%>">
				<input type="hidden" name="idProducto" value="<%=id%>">

				<div class="row g-4 mb-3">
					<div class="col-6">
						<input type="number"
							name="txtCodigo" value="<%=codigo%>" class="form-control form-control-lg"
							required placeholder="Código">
						<div class="invalid-feedback">El código es obligatorio.</div>
					</div>

					<div class="col-6">
						 <select
							class="form-select form-select-lg" name="cboCategoria" required>
							<option value="">Seleccione Categoría</option>
							<option value="Laptop"
								<%="Laptop".equals(categoria) ? "selected" : ""%>>Laptops</option>
							<option value="Desktop"
								<%="Desktop".equals(categoria) ? "selected" : ""%>>Celulares</option>
							<option value="All in One"
								<%="All in One".equals(categoria) ? "selected" : ""%>>Tablets</option>
							<option value="Servidor"
								<%="Servidor".equals(categoria) ? "selected" : ""%>>Accesorios</option>
							<option value="Monitor"
								<%="Monitor".equals(categoria) ? "selected" : ""%>>Componentes</option>
							<option value="Impresora"
								<%="Impresora".equals(categoria) ? "selected" : ""%>>Monitores</option>
							<option value="Scanner"
								<%="Scanner".equals(categoria) ? "selected" : ""%>>Impresoras</option>
							<option value="Teclado"
								<%="Teclado".equals(categoria) ? "selected" : ""%>>Consolas</option>
						</select>
						<div class="invalid-feedback">Seleccione una categoría.</div>
					</div>
				</div>

				<div class="row g-4 mb-3">
					<div class="col-6">
						<input type="text"
							name="txtProducto" value="<%=producto%>" class="form-control form-control-lg" placeholder="Producto"
							required>
						<div class="invalid-feedback">El producto es obligatorio.</div>
					</div>

					<div class="col-6">
						 <input type="number"
							name="txtStock" value="<%=stock%>" class="form-control form-control-lg" placeholder="Stock" required>
						<div class="invalid-feedback">Ingrese el stock.</div>
					</div>
				</div>

				<div class="row g-4 mb-4">
					<div class="col-6">
						<input type="text"
							name="txtMarca" value="<%=marca%>" class="form-control form-control-lg" min="0" placeholder="Marca" required>
						<div class="invalid-feedback">La marca es obligatoria.</div>
					</div>

					<div class="col-6">
						<input type="number"
							step="0.01" name="txtPrecio" value="<%=precio%>"
							class="form-control form-control-lg" required min="0" placeholder="Precio">
						<div class="invalid-feedback">Ingrese un precio válido.</div>
					</div>
				</div>

				<div class="d-flex gap-3">
					<button class="btn btn-success btn-lg px-5"><%=boton%></button>

					<%
					if (editando) {
					%>
					<a href="InventarioController?accion=listar"
						class="btn btn-secondary btn-lg px-5"> CANCELAR </a>
					<%
					}
					%>
				</div>
			</form>

			<%
			if (!editando) {
			%>
			<div class="table-responsive mt-4">
				<table id="tblBuscador"
					class="table table-hover rounded-4 overflow-hidden shadow-sm mt-3">
					<thead class="table-secondary">
						<tr class="text-center">
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
							<td><%=inv.getCodigo()%></td>
							<td><%=inv.getCategoria()%></td>
							<td><%=inv.getProducto()%></td>
							<td><%=inv.getMarca()%></td>
							<td><%=inv.getPrecio()%></td>
							<td><%=inv.getStock()%></td>
							<td><a class="btn btn-warning btn-sm"
								href="InventarioController?accion=editar&id=<%=inv.getId_inventario()%>">
									<i class="bi bi-pencil-square fs-5"></i>
							</a>
								<form id="formEliminar<%=inv.getId_inventario()%>"
									action="InventarioController" method="post"
									style="display: inline;">
									<input type="hidden" name="accion" value="eliminar"> <input
										type="hidden" name="id" value="<%=inv.getId_inventario()%>">

									<button type="button" class="btn btn-danger"
										onclick="confirmarEliminacion(<%=inv.getId_inventario()%>)">
										<i class="bi bi-trash-fill fs-5"></i>
									</button>
								</form></td>
						</tr>
						<%
						}
						}
						%>
					</tbody>
				</table>
			</div>
			<%
			}
			%>
		</section>
	</main>

	<jsp:include page="./components/footer.jsp"></jsp:include>
</body>
</html>
