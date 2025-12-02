<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp"></jsp:include>
<body>
	<main class="">
	<h2 class="text-center my-5">BIENVENIDO A CLOUD SHOP UPDATE</h2>
		<div  class=" container login-card card bordered p-5">
			<form class="row needs-validation" novalidate>
			<i class="bi bi-person-circle text-center fs-1"></i>
			<div class="col-12 mb-3">
			    <label for="validationCustomUsername" class="form-label">Usuario</label>
			    <div class="input-group has-validation">
			      <input type="text" class="form-control" id="validationCustomUsername" aria-describedby="inputGroupPrepend" required>
			      <div class="invalid-feedback">
			        Ingrese usuario correspondiente.
			      </div>
			    </div>
			    <div class="valid-feedback">Usuario correctamente ingresado.</div>
			</div>
		  
		  	<div class="col-12 mb-3">
			    <label for="validationCustomUsername" class="form-label">Contraseña</label>
			    <div class="input-group has-validation">
			      <input type="password" class="form-control" id="validationCustomUsername" aria-describedby="inputGroupPrepend" required>
			      <div class="invalid-feedback">
			        Ingrese contraseña correspondiente.
			      </div>
			    </div>
			    <div class="valid-feedback">Contraseña correcta.</div>
			</div>
		  

		  	<div class="col-12 text-center">
		    	<button class="btn btn-primary" type="submit">INGRESAR</button>
		  	</div>
		</form>
		</div>
	</main>
	

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>