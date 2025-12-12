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

			<!-- FORMULARIO -->
			<form
				action="${pageContext.request.contextPath}/InventarioContollers"
				method="POST" class="needs-validation" novalidate>

				<!-- FILA 1 -->
				<div class="row g-4 mb-3">
					<div class="col-6">
						<input type="text" class="form-control form-control-lg"
							name="txtCodigo" placeholder="Código" required>
						<div class="invalid-feedback">Ingrese el código.</div>
					</div>

					<div class="col-6">
						<select class="form-select form-select-lg" name="cboCategoria"
							required>
							<option value="">Categoría</option>
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

				<!-- FILA 2 -->
				<div class="row g-4 mb-3">
					<div class="col-6">
						<input type="text" class="form-control form-control-lg"
							name="txtProducto" placeholder="Producto" required>
						<div class="invalid-feedback">Ingrese el producto.</div>
					</div>

					<div class="col-6">
						<input type="number" step="1" class="form-control form-control-lg"
							name="txtStock" placeholder="Stock" required>
						<div class="invalid-feedback">Ingrese el stock.</div>
					</div>
				</div>

				<!-- FILA 3 -->
				<div class="row g-4 mb-4">
					<div class="col-6">
						<input type="text" class="form-control form-control-lg"
							name="txtMarca" placeholder="Marca" required>
						<div class="invalid-feedback">Ingrese la marca.</div>
					</div>

					<div class="col-6">
						<input type="number" step="0.01"
							class="form-control form-control-lg" name="txtPrecio"
							placeholder="Precio" required>
						<div class="invalid-feedback">Ingrese el precio.</div>
					</div>
				</div>

				<!-- BOTÓN -->
				<div class="text-start my-4">
					<button class="btn btn-success btn-lg px-5 py-2">REGISTRAR</button>
				</div>

			</form>

			<div class="input-group mb-4 shadow-sm">
				<span class="input-group-text bg-white"><i
					class="bi bi-search"></i></span> <input type="text"
					class="form-control form-control-lg" placeholder="Buscar productos">
			</div>

			<!-- TABLA -->
			<%
			Connection con = null;
			Statement stmt = null;
			ResultSet rs = null;

			try {
				con = ConexionMySQL.obtenerConexion();

				if (con != null) {
					stmt = con.createStatement();
					String sql = "SELECT * FROM inventario";
					rs = stmt.executeQuery(sql);
			%>

			<div class="table-responsive">
				<table
					class="table table-hover rounded-4 overflow-hidden shadow-sm mt-2">
					<thead class="table-secondary text-white">
						<tr class="text-center">
							<th class="border-0 p-3">ID</th>
							<th class="border-0 p-3">Código</th>
							<th class="border-0 p-3">Categoría</th>
							<th class="border-0 p-3">Producto</th>
							<th class="border-0 p-3">Marca</th>
							<th class="border-0 p-3">Precio u</th>
							<th class="border-0 p-3">Stock</th>
							<th class="border-0 p-3">Modificar</th>
							<th class="border-0 p-3">Eliminar</th>
						</tr>
					</thead>

					<tbody>
						<%
						while (rs.next()) {
						%>
						<tr class="text-center">
							<th scope="row"><%=rs.getInt("id_inventario")%></th>
							<td><%=rs.getInt("codigo")%></td>
							<td><%=rs.getString("categoria")%></td>
							<td><%=rs.getString("producto")%></td>
							<td><%=rs.getString("marca")%></td>
							<td><%=rs.getDouble("precio_unitario")%></td>
							<td><%=rs.getInt("stock")%></td>
							<td class="border-end p-3"><i
								class="bi bi-pencil-square text-warning fs-5"></i></td>
							<td class="p-3"><i class="bi bi-trash-fill text-danger fs-5"></i></td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>

			<%
			} else {
			%>
			<div class="alert alert-danger text-center mt-4">❌ No se pudo
				conectar a la base de datos.</div>
			<%
			}
			} catch (Exception e) {
			%>
			<div class="alert alert-danger text-center mt-4">
				Error al consultar la base de datos:
				<%=e.getMessage()%>
			</div>
			<%
			} finally {
			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
			}
			try {
				if (stmt != null)
					stmt.close();
			} catch (Exception e) {
			}
			try {
				if (con != null)
					con.close();
			} catch (Exception e) {
			}
			}
			%>

		</section>

	</main>

	<jsp:include page="./components/footer.jsp"></jsp:include>

</body>
</html>
