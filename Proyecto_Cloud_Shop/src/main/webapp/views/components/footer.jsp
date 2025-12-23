<footer>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="https://cdn.datatables.net/2.3.4/js/dataTables.min.js"></script>


	<!-- VALIDACIÓN DE FORMULARIOS-->
	<script>
(() => {
  'use strict'
  const forms = document.querySelectorAll('.needs-validation')
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
</script>


<!--CERRAR DROPDOWNS ABIERTOS-->
	<script>
document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll(".dropdown-menu.show")
        .forEach(el => el.classList.remove("show"));
});
</script>


	<!-- SWEET ALERT -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script>
		var mensaje = "${sessionScope.msj}";
		if (mensaje === "create") {
			Swal.fire({
				title: "Se registro correctamente",
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
		} else if (mensaje === "edit") {
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
				  confirmButtonText: "Si, actualizar!",
				  cancelButtonText: "No, cancelar!",
				  reverseButtons: true
				}).then((result) => {
				  if (result.isConfirmed) {
				    swalWithBootstrapButtons.fire({
				      title: "Actualizar!",
				      text: "El usuario seleccionado ha sido actualizado.",
				      icon: "success"
				    });
				  } else if (
				    /* Read more about handling dismissals below */
				    result.dismiss === Swal.DismissReason.cancel
				  ) {
				    swalWithBootstrapButtons.fire({
				      title: "Cancelado",
				      text: "El usuario no se ha actualizado",
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
