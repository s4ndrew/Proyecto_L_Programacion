<header>
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="#">
	    	<img src="${pageContext.request.contextPath}/images/logo.jpg" alt="Cloud Shop" style="height: 45px;">
	    </a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarNavDropdown">
	      <ul class="navbar-nav">
	        <li class="nav-item">
	          <a class="nav-link active" aria-current="page" href="#">USUARIOS</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="InventarioGUI.jsp">INVENTARIO</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="#">VENTAS</a>
	        </li>
	        <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	            REPORTES
	          </a>
	          <ul class="dropdown-menu">
	            <li><a class="dropdown-item" href="#">STOCK</a></li>
	            <li><a class="dropdown-item" href="#">VENTAS</a></li>
	          </ul>
	        </li>
	      </ul>
	    </div>
	    	<button class="btn btn-danger" onclick="window.location.href='guiLogin.jsp'"><i class="bi bi-box-arrow-right"></i></button>
	  </div>
	</nav>
</header>