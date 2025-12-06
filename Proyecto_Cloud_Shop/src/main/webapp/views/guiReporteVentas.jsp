<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp"></jsp:include>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<main class="container d-flex justify-content-center">
		<section class="card p-4 my-5 rounded-4 shadow-lg border-0" style="max-width: 1000px; width: 100%;">
			<h3 class="text-start mb-4">
                <i class="bi bi-file-bar-graph-fill me-2"></i>Reporte Stock
            </h3>
            
			 <div class="input-group mb-4 shadow-sm">
                <span class="input-group-text bg-white"><i class="bi bi-search"></i></span>
                <input type="text" class="form-control form-control-lg" placeholder="Buscar productos">
            </div>

            <!-- TABLA -->
            <table class="table table-hover table-responsive rounded-4 overflow-hidden shadow-sm mt-2">
                <thead class="table-secondary text-white">
                    <tr class="text-center">
                        <th class="border-0 p-3">ID</th>
                        <th class="border-0 p-3">Categoria</th>
                        <th class="border-0 p-3">Producto</th>
                        <th class="border-0 p-3">Cantidad</th>
                        <th class="border-0 p-3">Precio</th>
                        <th class="border-0 p-3">Total</th>
                    </tr>
                </thead>

                <tbody>
                    <tr class="text-center">
                        <td class="border-end p-3">Componentes</td>
                        <td class="border-end p-3">Procesador Intel i5 12400F</td>
                        <td class="border-end p-3">001</td>
                        <td class="border-end p-3">18</td>
                        <td class="border-end p-3">$180</td>
                        <td class="border-end p-3">$13330</td>
                    </tr>
                </tbody>
            </table>
		</section>
	</main>
</body>
</html>