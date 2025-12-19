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
						href="${pageContext.request.contextPath}/UsuariosControllers">
							USUARIOS </a></li>

					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/InventarioController?accion=listar">
							INVENTARIO </a></li>

					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/guiVentas.jsp">
							VENTAS </a></li>

					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/guiReportes.jsp">
							REPORTE </a></li>

				</ul>

			</div>

			<button class="btn btn-danger logout-btn ms-4"
				onclick="window.location.href='guiLogin.jsp'">
				<i class="bi bi-box-arrow-right"></i>
			</button>

		</div>
	</nav>
</header>
