<%@page import="model.Inventario"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="./components/head.jsp"></jsp:include>
<body>
	<jsp:include page="./components/header.jsp"></jsp:include>

	<main class="container d-flex justify-content-center">
		<section class="card p-4 my-5 rounded-4 shadow-lg border-0" style="max-width: 1000px; width: 100%;">
			<div class="d-flex justify-content-between">
				<h3 class="text-start mb-4">
                <i class="bi bi-file-bar-graph-fill me-2"></i>Reporte Stock
            	</h3>
            	
            	<div>
            		<a href="guiReportes.jsp" class="btn btn-outline-secondary" role="button">
            	<i class="bi bi-arrow-left-circle-fill "></i>
            	Regresar
						</a>
            	</div>
			</div>

            <!-- TABLA -->
            	<div class="table-responsive mt-4">
				<table id="tblBuscador" class="table table-hover rounded-4 overflow-hidden shadow-sm mt-3">
					<thead class="table-secondary">
						<tr class="text-center">
							<th>N°</th>
							<th>Código</th>
							<th>Categoría</th>
							<th>Producto</th>
							<th>Marca</th>
							<th>Precio</th>
							<th>Stock</th>
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
	<jsp:include page="./components/tabla-script.jsp"></jsp:include>
</body>
</html>