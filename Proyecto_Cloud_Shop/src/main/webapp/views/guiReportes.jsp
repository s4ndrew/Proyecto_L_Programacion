<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="./components/head.jsp"></jsp:include>
<body class="">
	<jsp:include page="./components/header.jsp"></jsp:include>
	<main class="container">
		<div
			class="d-flex flex-column justify-content-center align-items-center gap-5 mt-5">
			<div class="card p-4" style="width: 18rem;">
				<div class="d-flex justify-content-center align-items-center">
					<img src="../images/reporte_inventario.png"
						class="card-img-top img-fluid" style="width: 150px;" alt="...">
				</div>
				<div class="card-body"></div>
				<div class="d-flex justify-content-center">
					<a href="${pageContext.request.contextPath}/ReporteControllers?accion=listarReporteStock" class="btn btn-primary p-2 w-100" role="button">REPORTE
						STOCK</a>
				</div>
			</div>

			<div class="card p-4 d-flex justify-content-center"
				style="width: 18rem;">
				<div class="d-flex justify-content-center align-items-center">
					<img src="../images/reporte_ventas.png" class="card-img-top"
					style="width: 150px;" alt="...">
				</div>
				<div class="card-body"></div>
				<div class="d-flex justify-content-center">
					<a href="guiReporteVentas.jsp" class="btn btn-primary p-2 w-100"
						role="button">REPORTE DE VENTAS</a>
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="./components/footer.jsp"></jsp:include>
</body>
</html>