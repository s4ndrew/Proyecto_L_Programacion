<script src="https://cdn.datatables.net/2.3.4/js/dataTables.min.js"></script>

<script>
document.addEventListener("DOMContentLoaded", function () {

    // -------- Inicializar DataTable SOLO si existe --------
if (document.querySelector('#tblBuscador thead th')) {
    new DataTable('#tblBuscador', {
        language: {
            url: 'https://cdn.datatables.net/plug-ins/2.3.4/i18n/es-ES.json'
        }
    });
}


    const tableBody = document.querySelector('#tblBuscador tbody');
    const inputTotal = document.getElementById("txtTotal");
    const inputIdInventario = document.getElementById("txtIdInventario");

    // -------- Delegación de eventos (clave para DataTables) --------
    tableBody.addEventListener("change", function (e) {

        if (!e.target.classList.contains("seleccionar-checkbox") &&
            !e.target.classList.contains("cantidad-input")) return;

        const fila = e.target.closest("tr");
        const checkbox = fila.querySelector(".seleccionar-checkbox");
        const cantidadInput = fila.querySelector(".cantidad-input");

        // Permitir solo un producto seleccionado
        document.querySelectorAll(".seleccionar-checkbox").forEach(chk => {
            if (chk !== checkbox) chk.checked = false;
        });

        if (checkbox.checked) {
            if (cantidadInput.value < 1) cantidadInput.value = 1;

            const precio = parseFloat(fila.cells[4].textContent) || 0;
            const cantidad = parseInt(cantidadInput.value) || 1;

            inputIdInventario.value = checkbox.dataset.id;
            inputTotal.value = (precio * cantidad).toFixed(2);
        } else {
            inputIdInventario.value = "";
            inputTotal.value = "";
        }
    });
});
</script>
