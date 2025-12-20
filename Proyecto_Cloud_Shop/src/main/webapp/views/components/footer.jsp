<footer>
	<!-- VALIDACION FORMULARIO -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
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
	<script>
	document.addEventListener("DOMContentLoaded", function() {
    const table = document.getElementById("tblBuscador");
    const inputTotal = document.getElementById("txtTotal");

    table.addEventListener("change", function(e) {
        if (e.target.classList.contains("seleccionar-checkbox") || e.target.classList.contains("cantidad-input")) {
            const row = e.target.closest("tr");
            const checkbox = row.querySelector(".seleccionar-checkbox");
            const inputCantidad = row.querySelector(".cantidad-input");
            
            if (e.target === checkbox) {
                if (checkbox.checked) {
                    inputCantidad.value = 1;
                    inputCantidad.min = 1;
                } else {
                    inputCantidad.value = 0;
                    inputCantidad.min = 0;
                }
            }

            if (checkbox.checked && inputCantidad.value < 1) {
                inputCantidad.value = 1;
            }

            calcularTotal();
        }
    });

    function calcularTotal() {
        let totalGeneral = 0;
        const filas = table.querySelectorAll("tbody tr");

        filas.forEach(fila => {
            const checkbox = fila.querySelector(".seleccionar-checkbox");
            if (checkbox && checkbox.checked) {
                const precio = parseFloat(fila.cells[4].innerText) || 0;
                const cantidad = parseInt(fila.querySelector(".cantidad-input").value) || 0;
                totalGeneral += (precio * cantidad);
            }
        });

        inputTotal.value = totalGeneral.toFixed(2);
    }
});

</script>

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

	<%
	session.removeAttribute("msj");
	%>

</footer>