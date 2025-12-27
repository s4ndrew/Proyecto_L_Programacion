<footer>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="https://cdn.datatables.net/2.3.4/js/dataTables.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

	<script>
	function validarLogin(event) {
		event.preventDefault();
		const usuario = document.getElementById("user").value.trim();
		const contrasenia = document.getElementById("pass").value.trim();


		
		const users = [
			{
				
				user: "GER_102", // Carolina', 'Fernandez', 'Gerente',
				password: "gerente123",
				nombre: "Carolina Fernandez",
				rol: "Gerente"
			},
			
			{
				user: "ADM_607", //'María', 'Lopez', 'Administrador'
				password: "admin123",
				nombre: "María Lopez",
				rol: "Administrador"
			},
			
			{
				user: "VEN_506", //'Jorge', 'Castillo', 'Vendedor'
				password: "pass1234",
				nombre: "Jorge Castillo",
				rol: "Vendedor"
			
			},
			{
				user: "VEN_112", //'Diego', 'Alvarado', 'Vendedor'
				password: "pass1234",
				nombre: "Diego Alvarado",
				rol: "Vendedor"
			},
			{
				user: "VEN_445", //'Paola', 'Cruz', 'Vendedor',
				password: "pass1234",
				nombre: "Paola Cruz",
				rol: "Vendedora"
			}
		]
		
		
		for (let u of users) {
			if (usuario === u.user && contrasenia === u.password) {
			      Swal.fire({
			        title: "Acceso correcto",
			        text: "Bienvenido " + u.rol +" "+ u.nombre,
			        icon: "success",
			        confirmButtonText: "Continuar"
			      }).then(() => {
			        event.target.submit(); 
			      });

			    return true;
			  }			
		}
		
		
		Swal.fire({
			  title: "Error",
			  text: "Datos incorrectos intentelo nuevamente",
			  icon: "error"
			});
		  return false;
	}
	
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

	<script>
        var mensaje = "${sessionScope.msj}";
        
        if (mensaje === "create") {
            Swal.fire({ title: "Se registró correctamente", icon: "success" });
        } else if (mensaje === "delete") {
            Swal.fire({ title: "Eliminado", text: "El usuario seleccionado ha sido eliminado", icon: "success" });
        } else if (mensaje === "edit") {
            Swal.fire({ title: "Actualizado", text: "El usuario seleccionado ha sido actualizado", icon: "success" });
        }
    </script>

	<%
	session.removeAttribute("msj");
	%>

	<script>
        function confirmarEliminacion(id) {
            const swalWithBootstrapButtons = Swal.mixin({
                customClass: { confirmButton: "btn btn-success mx-2", cancelButton: "btn btn-danger mx-2" },
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
                    swalWithBootstrapButtons.fire('Cancelado', 'El usuario no se ha eliminado', 'error');
                }
            });
        }
    </script>

	<script>
			document.addEventListener("DOMContentLoaded", function () {
				
				if (document.querySelector('#tblBuscador thead th')) {
	                new DataTable('#tblBuscador', {
	                    language: { url: 'https://cdn.datatables.net/plug-ins/2.3.4/i18n/es-ES.json' }
	                });
	            }
		
		    const tableBody = document.querySelector('#tblBuscador tbody');
		    const inputTotal = document.getElementById("txtTotal");
		    const inputIdInventario = document.getElementById("txtIdInventario");
		    const inputCantidadHidden = document.getElementById("txtCantidad");
		
		    tableBody.addEventListener("change", function (e) {
		
		        if (!e.target.classList.contains("seleccionar-checkbox") &&
		            !e.target.classList.contains("cantidad-input")) return;
		
		        const fila = e.target.closest("tr");
		        const checkbox = fila.querySelector(".seleccionar-checkbox");
		        const cantidadInput = fila.querySelector(".cantidad-input");
		
		        document.querySelectorAll(".seleccionar-checkbox").forEach(chk => {
		            if (chk !== checkbox) {
		                const filaChk = chk.closest("tr");
		                const cantidadChk = filaChk.querySelector(".cantidad-input");
		                chk.checked = false;
		                cantidadChk.value = 0;
		                cantidadChk.disabled = true;
		            }
		        });
		
		        if (checkbox.checked) {
		            cantidadInput.disabled = false;
		            cantidadInput.value = cantidadInput.value > 0 ? cantidadInput.value : 1;
		
		            const precio = parseFloat(checkbox.dataset.precio) || 0;
		            const cantidad = parseInt(cantidadInput.value) || 1;
		
		            inputIdInventario.value = checkbox.dataset.id;
		            inputCantidadHidden.value = cantidad;
		            inputTotal.value = (precio * cantidad).toFixed(2);
		
		            cantidadInput.focus();
		
		        } else {
		            cantidadInput.value = 0;
		            cantidadInput.disabled = true;
		
		            inputIdInventario.value = "";
		            inputCantidadHidden.value = 0;
		            inputTotal.value = "0.00";
		        }
		    });
		
		    tableBody.addEventListener("input", function (e) {
		
		        if (!e.target.classList.contains("cantidad-input")) return;
		
		        const fila = e.target.closest("tr");
		        const checkbox = fila.querySelector(".seleccionar-checkbox");
		
		        if (checkbox.checked) {
		            const precio = parseFloat(checkbox.dataset.precio) || 0;
		            const cantidad = parseInt(e.target.value) || 1;
		
		            inputCantidadHidden.value = cantidad;
		            inputTotal.value = (precio * cantidad).toFixed(2);
		        }
		    });
		
		});
	</script>

</footer>