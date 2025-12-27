<header>

	<nav class="navbar navbar-expand-lg navbar-custom">
		<div class="container-fluid">

			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
				aria-controls="navbarNavDropdown" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<a class="navbar-brand" href="#"> <img
				src="${pageContext.request.contextPath}/images/logo.jpg"
				alt="Cloud Shop" style="height: 45px;">
			</a>


			<div class="collapse navbar-collapse" id="navbarNavDropdown">
					

				<ul class="navbar-nav ms-auto gap-4">
					<li class="nav-item"><a class="nav-link active"
						href="${pageContext.request.contextPath}/UsuariosControllers?accion=listar">
							USUARIOS </a></li>

					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/InventarioController?accion=listar">
							INVENTARIO </a></li>

					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/VentasControllers">VENTAS</a>
					</li>

					<li class="nav-item"><a class="nav-link" 
						href="${pageContext.request.contextPath}/views/guiReportes.jsp" id="prueba">
							REPORTE </a></li>


				</ul>
				 
				 
			</div>
			


		<a href="${pageContext.request.contextPath}/views/guiLogin.jsp" class="btn btn-danger logout-btn ms-4">
		    <i class="bi bi-box-arrow-right"></i> 
		</a>

		</div>
	</nav>
</header>
