<footer>
	<!-- VALIDACION FORMULARIO -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
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
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script>
		var mensaje = "${sessionScope.msj}";
		if (mensaje === "create") {
			Swal.fire({
				title: "Se insertó correctamente",
				icon: "success"
			});
		}else if (mensaje === "delete"){
			const swalWithBootstrapButtons = Swal.mixin({
				  customClass: {
				    confirmButton: "btn btn-success mx-2",
				    cancelButton: "btn btn-danger mx-2"
				  },
				  buttonsStyling: false
				});
				swalWithBootstrapButtons.fire({
				  title: "Estas seguro?",
				  text: "No podrás revertir esto!",
				  icon: "warning",
				  showCancelButton: true,
				  confirmButtonText: "Si, eliminar!",
				  cancelButtonText: "No, cancelar!",
				  reverseButtons: true
				}).then((result) => {
				  if (result.isConfirmed) {
				    swalWithBootstrapButtons.fire({
				      title: "Eliminar!",
				      text: "El usuario seleccionado ha sido eliminado.",
				      icon: "success"
				    });
				  } else if (
				    /* Read more about handling dismissals below */
				    result.dismiss === Swal.DismissReason.cancel
				  ) {
				    swalWithBootstrapButtons.fire({
				      title: "Cancelado",
				      text: "El usuario no se ha eliminado",
				      icon: "error"
				    });
				  }
				});
		}
	</script>
	
	<%
		session.removeAttribute("msj");
	%>

</footer>