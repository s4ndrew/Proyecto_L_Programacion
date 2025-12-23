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
	
	</script>
	
	<script>
		var mensaje = "${sessionScope.msj}";
		
		if(mensaje === "create"){
		    Swal.fire({
		        title: "Se registró correctamente",
		        icon: "success"
		    });
		} else if(mensaje === "delete"){
		    Swal.fire({
		        title: "Eliminado",
		        text: "El usuario seleccionado ha sido eliminado",
		        icon: "success"
		    });
		} else if(mensaje === "edit"){
		    Swal.fire({
		        title: "Actualizado",
		        text: "El usuario seleccionado ha sido actualizado",
		        icon: "success"
		    });
		}
		</script>
		
		<%
		session.removeAttribute("msj");
		%>
	
	<script>
		function confirmarEliminacion(id) {
		    const swalWithBootstrapButtons = Swal.mixin({
		        customClass: {
		            confirmButton: "btn btn-success mx-2",
		            cancelButton: "btn btn-danger mx-2"
		        },
		        buttonsStyling: false
		    });
		
		    swalWithBootstrapButtons.fire({
		        title: "¿Estás seguro?",
		        text: "No podrás revertir esto!",
		        icon: "warning",
		        showCancelButton: true,
		        confirmButtonText: "Sí, eliminar!",
		        cancelButtonText: "No, cancelar!",
		        reverseButtons: true
		    }).then((result) => {
		        if (result.isConfirmed) {
		            document.getElementById("formEliminar" + id).submit();
		        } else if (result.dismiss === Swal.DismissReason.cancel) {
		            swalWithBootstrapButtons.fire(
		                'Cancelado',
		                'El usuario no se ha eliminado',
		                'error'
		            );
		        }
		    });
		}
	Z</script>
</footer>
