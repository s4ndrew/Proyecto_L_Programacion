<footer>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	
	
	<!-- VALIDACION FORMULARIO -->
	
	<script>
	// Example starter JavaScript for disabling form submissions if there are invalid fields
	(() => {
	  'use strict'

	  // Fetch all the forms we want to apply custom Bootstrap validation styles to
	  const forms = document.querySelectorAll('.needs-validation')

	  // Loop over them and prevent submission
	  Array.from(forms).forEach(form => {
	    form.addEventListener('submit', event => {
	      if (!form.checkValidity()) {
	        event.preventDefault()
	        event.stopPropagation()
	      }

	      form.classList.add('was-validated')
	    }, false)
	  })
	})()
	
	
	document.addEventListener("DOMContentLoaded", function() {
    document.querySelectorAll(".dropdown-menu.show")
            .forEach(el => el.classList.remove("show"));
});
	</script>
	
	
	<!-- TABLA BUSCADOR -->
	<script>
	$(document)
			.ready(
					function() {

						if ($('#tblBuscador').length) {
							new DataTable(
									'#tblBuscador',
									{
										language : {
											url : 'https://cdn.datatables.net/plug-ins/2.3.4/i18n/es-ES.json'
										},
										pageLength : 10,
										lengthMenu : [ 5, 10, 25, 50 ],
										ordering : true
									});
						}
					});
</script>

	<!-- SWEET ALERT -->
	<script>
	var mensaje = "${msj}"
	if (mensaje == "create") {
		Swal.fire({
			  title: "Se insertó correctamente!",
			  icon: "success",
			  draggable: true
			});
	}
	
	</script>
	
</footer>