<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="./components/head.jsp"></jsp:include>

<body style="background-color: #f5f6f8;">

	<main class="d-flex justify-content-center align-items-center"
		style="height: 100vh;">
		<section class="card p-4 rounded-4 shadow-lg border-0"
			style="max-width: 430px; width: 100%;">

			<form class="needs-validation" novalidate method="post"
				action="${pageContext.request.contextPath}/UsuariosControllers" onsubmit="return validarLogin(event)">

				<input type="hidden" name="accion" value="listar"> 

				<div class="d-flex justify-content-center align-items-center mb-3">
					<i class="bi bi-person-fill fs-1 me-2" style="color: #042b54;"></i>
					<h4 class="mb-0" style="color: #042b54;">INICIAR SESIÓN</h4>
				</div>

				<div class="row g-4 mb-3">
					<div class="col-12">
						<input type="text" name="usuario"
							class="form-control form-control-lg" placeholder="Usuario"
							required id="user">
						<div class="invalid-feedback">Ingrese usuario.</div>
					</div>

					<div class="col-12">
						<input type="password" name="contrasena"
							class="form-control form-control-lg" placeholder="Contraseña"
							required id="pass">
						<div class="invalid-feedback">Ingrese contraseña.</div>
					</div>
				</div>

				<div class="col-12">
					<button type="submit" class="btn btn-lg w-100 text-white"
						style="background-color: #042b54;">INGRESAR</button>
				</div>

				<div class="text-center mt-3">
					<a href="#" class="text-decoration-none" style="color: #042b54;">
						¿Olvidaste tu contraseña? </a>
				</div>
			</form>


		</section>
	</main>

	<jsp:include page="./components/footer.jsp"></jsp:include>

</body>
</html>
