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
            
			 <div class="input-group mb-4 shadow-sm">
                <span class="input-group-text bg-white"><i class="bi bi-search"></i></span>
                <input type="text" class="form-control form-control-lg" placeholder="Buscar productos">
            </div>

            <!-- TABLA -->
            <div class="table-responsive">
            	<table class="table table-hover rounded-4 overflow-hidden shadow-sm mt-2">
	                <thead class="table-secondary text-white">
	                    <tr class="text-center">
	                        <th class="border-0 p-3">Código</th>
	                        <th class="border-0 p-3">Categoría</th>
	                        <th class="border-0 p-3">Producto</th>
	                        <th class="border-0 p-3">Marca</th>
	                        <th class="border-0 p-3">Precio</th>
	                        <th class="border-0 p-3">Stock</th>
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
	                    </tr>
	                </tbody>
            	</table>
            </div>
		</section>
	</main>
	
	<jsp:include page="./components/footer.jsp"></jsp:include>
</body>
</html>