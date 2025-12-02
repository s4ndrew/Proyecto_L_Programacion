<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp"></jsp:include>
<body>
	<main class="d-flex flex-column align-items-center" style="height: 100vh;">
		<div  class=" card login-card bordered p-5 ">
			<form class="row needs-validation" novalidate action="guiUsuarios.jsp">
			
	        <div class="d-flex justify-content-center align-items-center mb-2">
	            <i class="bi bi-person-fill fs-1 me-2"></i>
	            <h4 class="mb-0">INICIAR SESIÓN</h4>
	        </div>
	        
        	<hr class="mt-0 mb-4">
        	
			<div class="col-12 mb-3">
			    <label for="validationCustomUsername" class="form-label">USUARIO</label>
			    <div class="input-group has-validation">
			      <input type="text" class="form-control" id="validationCustomUsername" aria-describedby="inputGroupPrepend" required>
			      <div class="invalid-feedback">
			        Ingrese usuario correspondiente.
			      </div>
			    </div>
			    <div class="valid-feedback">Usuario correctamente ingresado.</div>
			</div>
		  
		  	<div class="col-12 mb-3">
			    <label for="validationCustomUsername" class="form-label">CONTRASEÑA</label>
			    <div class="input-group has-validation">
			      <input type="password" class="form-control" id="validationCustomUsername" aria-describedby="inputGroupPrepend" required>
			      <div class="invalid-feedback">
			        Ingrese contraseña correspondiente.
			      </div>
			    </div>
			    <div class="valid-feedback">Contraseña correcta.</div>
			</div>
		  
			<h6 class="mb-4 mt-2">¿Olvidaste tu contraseña?</h6>
			
		  	<div class="col-12 text-center">
		    	<button class="btn btn-primary" type="submit">INGRESAR</button>
		  	</div>
		</form>
		</div>
	</main>
	

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>