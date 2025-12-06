<header>
	<nav class="navbar navbar-expand-lg navbar-custom">
	  <div class="container-fluid">
		
		<button class="navbar-toggler" type="button" 
	            data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" 
	            aria-controls="navbarNavDropdown" aria-expanded="false" 
	            aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    
	    <a class="navbar-brand" href="#">
	    	<img src="${pageContext.request.contextPath}/images/logo.jpg" 
	             alt="Cloud Shop" style="height: 45px;">
	    </a>

	    <div class="collapse navbar-collapse" id="navbarNavDropdown">
	      <ul class="navbar-nav ms-auto gap-4">
	        <li class="nav-item">
	          <a class="nav-link active" href="guiUsuarios.jsp">USUARIOS</a>
	        </li>

	        <li class="nav-item">
	          <a class="nav-link" href="InventarioGUI.jsp">INVENTARIO</a>
	        </li>

	        <li class="nav-item">
	          <a class="nav-link" href="guiVentas.jsp">VENTAS</a>
	        </li>

	        <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" href="#" role="button" 
	             data-bs-toggle="dropdown" aria-expanded="false" onclick="event.preventDefault()">
	            REPORTES
	          </a>

	          <ul class="dropdown-menu">
	            <li><a class="dropdown-item" href="guiReporteStock.jsp">STOCK</a></li>
	            <li><a class="dropdown-item" href="guiReporteVentas.jsp">VENTAS</a></li>
	          </ul>
	        </li>
	      </ul>
	    </div>

	    <button class="btn btn-danger logout-btn ms-4" onclick="window.location.href='guiLogin.jsp'">
	    	<i class="bi bi-box-arrow-right"></i>
	    </button>

	  </div>
	</nav>
</header>
