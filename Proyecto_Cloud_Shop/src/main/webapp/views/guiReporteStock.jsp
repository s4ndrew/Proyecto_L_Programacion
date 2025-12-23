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
            
			<!-- <div class="input-group mb-4 shadow-sm">
                <span class="input-group-text bg-white"><i class="bi bi-search"></i></span>
                <input type="text" class="form-control form-control-lg" placeholder="Buscar productos">
            </div> --> 

            <!-- TABLA -->
            <div class="table-responsive">
            	<table id="tblBuscador" class="table table-hover rounded-4 overflow-hidden shadow-sm mt-2">
	                <thead class="table-secondary text-white">
	                    <tr class="text-center">
	                    	<th class="border-0 p-3">Id</th>
	                        <th class="border-0 p-3">Producto</th>
	                        <th class="border-0 p-3">Marca</th>
	                        <th class="border-0 p-3">Precio</th>
	                        <th class="border-0 p-3">Stock</th>
	                    </tr>
	                </thead>
	
	                <tbody>
	                <%
	                	List<Inventario> lista = (List<Inventario>) request.getAttribute("listadeReporteStock");
	                	
	                	if(lista != null && !lista.isEmpty()){
	                	for(Inventario stock : lista){
	                
	                %>
	                
	                
	                    <tr class="text-center">
	                    	<td class="border-end p-3"><%= stock.getId_inventario()%></td>
	                        <td class="border-end p-3"><%= stock.getProducto()%></td>
	                        <td class="border-end p-3"><%= stock.getMarca()%></td>
	                        <td class="border-end p-3"><%= stock.getPrecio()%></td>
	                        <td class="border-end p-3"><%= stock.getStock()%></td>
	                    </tr>
	                </tbody>
	                
	                <%
	                	}
	                	} else{
	                		%>
	                		<p>Lista vacia</p>
	                		<%
	                	}
	                %>
            	</table>
            </div>
		</section>
	</main>
	
	<jsp:include page="./components/footer.jsp"></jsp:include>
</body>
</html>