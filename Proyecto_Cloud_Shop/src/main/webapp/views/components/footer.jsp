<footer>

	<!-- ================= BOOTSTRAP ================= -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

	<!-- ================= SWEET ALERT ================= -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

	<!-- ================= DATATABLES ================= -->
	<script src="https://cdn.datatables.net/2.3.4/js/dataTables.min.js"></script>

	<!-- =========================================================
     VALIDACIÓN DE FORMULARIOS BOOTSTRAP
========================================================= -->
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

	<!-- =========================================================
     CERRAR DROPDOWNS ABIERTOS
========================================================= -->
	<script>
document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll(".dropdown-menu.show")
        .forEach(el => el.classList.remove("show"));
});
</script>

	<!-- =========================================================
     DATATABLE + CÁLCULO TOTAL + SELECCIÓN
========================================================= -->
	<script>


	<!-- =========================================================
     MENSAJES SWEET ALERT (SESSION)
========================================================= -->
	<script>
var mensaje = "${sessionScope.msj}";

if (mensaje === "create") {
    Swal.fire({
        title: "Se registró correctamente",
        icon: "success"
    });
}
else if (mensaje === "delete") {
    Swal.fire({
        title: "Eliminado",
        text: "Se ha eliminado correctamente",
        icon: "success"
    });
}
else if (mensaje === "edit") {
    Swal.fire({
        title: "Actualizado",
        text: "Se ha actualizado correctamente",
        icon: "success"
    });
}
</script>

	<%
	session.removeAttribute("msj");
	%>

</footer>
