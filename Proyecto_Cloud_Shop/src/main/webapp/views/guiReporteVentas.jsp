<%@page import="java.util.List"%>
<%@page import="model.Ventas"%>
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
                <i class="bi bi-file-bar-graph-fill me-2"></i>Reporte Ventas</h3>
            
	            <div>
	            	<a href="${pageContext.request.contextPath}/views/guiReportes.jsp" class="btn btn-outline-secondary" role="button">
	            	<i class="bi bi-arrow-left-circle-fill "></i>Regresar</a>
	            </div>
			</div>
			
            <!-- TABLA -->

             <div class="table-responsive">
            	<table id="tblBuscador" class="table table-hover rounded-4 overflow-hidden shadow-sm mt-4">
	                <thead class="table-secondary text-white">
	                    <tr class="text-center">
	                        <th class="border-0 p-3">DNI</th>
	                        <th class="border-0 p-3">Nombre</th>
	                        <th class="border-0 p-3">Apellidos</th>
	                        <th class="border-0 p-3">Producto</th>
	                        <th class="border-0 p-3">Precio</th>
	                        <th class="border-0 p-3">Cantidad</th>
	                        <th class="border-0 p-3">Total</th>
	                    </tr>
	                </thead>
	
	                <tbody>
	                    <%
				            List<Ventas> lista = (List<Ventas>) request.getAttribute("listaReporteVentas");
				            
				            if(lista != null) {
				            	for(Ventas v : lista) {
			            %>
	                    <tr class="text-center">
	                        <td class="border-end p-3"><%= v.getDni() %></td>
	                        <td class="border-end p-3"><%= v.getNombres() %></td>
	                        <td class="border-end p-3"><%= v.getApellidos() %></td>
	                        <td class="border-end p-3"><%= v.getProducto() %></td>
	                        <td class="border-end p-3"><%= v. getPrecio_unitario() %></td>
	                        <td class="border-end p-3"><%= v.getCantidad() %></td>
	                        <td class="border-end p-3"><%= v. getTotal()%></td>
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