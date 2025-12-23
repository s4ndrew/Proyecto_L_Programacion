<%@page import="model.Ventas"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<jsp:include page="./components/head.jsp"></jsp:include>

<body style="background-color: rgba(243, 244, 246, 1)">

	<jsp:include page="./components/header.jsp"></jsp:include>

	<%
	//List<String> categorias = //(List<String>) request.getAttribute("categorias");
	//List<Inventario> listaProductos = //(List<Inventario>) request.getAttribute("listaProductos");
	%>

	<main class="container d-flex justify-content-center">

		<section class="card p-4 my-5 rounded-4 shadow-lg border-0"
			style="max-width: 1000px; width: 100%;">

			<h3 class="text-start mb-4">
				<i class="bi bi-cart-fill me-2"></i>Detalle de Venta
			</h3>
				<%
				ArrayList<Ventas> listaVen = (ArrayList<Ventas>) request.getAttribute("listaVentas");
				
				if (listaVen != null) {
					for (Ventas v : listaVen) {
				%>
				
				<h4>DNI</h4>
				<h5><%= v.getDni() %></h5>
				
				<h4>Nombres</h4>
				<h5><%= v.getNombres() %></h5>
				
				<h4>Apellidos</h4>
				<h5><%= v.getApellidos() %></h5>
				
				<h4>Teléfono</h4>
				<h5><%= v.getTelefono() %></h5>
				
				<h4>Dirección</h4>
				<h5><%= v.getDireccion() %></h5>
				
				<h4>Correo</h4>
				<h5><%= v.getCorreo() %></h5>
				
				<h4>Total</h4>
				<h5><%= v.getTotal() %></h5>
				
				<hr>
				
				<%
					}
				}
				%>
				
				<hr>
				
				<div class="row">
					<div class="col-12">
						<h4>Producto</h4>
						<h5></h5>
						
						<h4>Precio</h4>
						<h5></h5>
						
						<h4>Cantidad</h4>
						<h5></h5>
						
						<h4>Subtotal</h4>
						<h5></h5>
						
					</div>
				</div>
		</section>
	</main>

	<jsp:include page="./components/footer.jsp">

</body>
</html>
