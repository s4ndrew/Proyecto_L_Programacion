<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp"></jsp:include>

<body style="background-color: rgba(243, 244, 246, 1)">

    <jsp:include page="header.jsp"></jsp:include>

    <main class="container d-flex justify-content-center">

        <section class="card p-4 my-5 rounded-4 shadow-lg border-0" style="max-width: 1000px; width: 100%;">

            <h3 class="text-start mb-4">
                <i class="bi bi-cart-fill me-2"></i>Ventas
            </h3>

            <!-- FORMULARIO -->
            <form class="needs-validation" action="VentasController" method="POST" novalidate>

                <!-- FILA 1 -->
                <div class="row g-4 mb-3">
                    <div class="col-6">
                        <input type="text" name="txtNombre" class="form-control form-control-lg" 
                               placeholder="Nombre y Apellido" required>
                        <div class="invalid-feedback">Ingrese su nombre.</div>
                    </div>

                    <div class="col-6">
                        <input type="number" name="txtDNI" class="form-control form-control-lg" 
                               placeholder="DNI" required>
                        <div class="invalid-feedback">Ingrese su DNI.</div>
                    </div>
                </div>

                <!-- FILA 2 -->
                <div class="row g-4 mb-3">
                    <div class="col-6">
                        <select class="form-select form-select-lg" name="cboCategoria" required>
                            <option value="">Seleccione una Categoría</option>
                            <option value="1">Laptop</option>
                            <option value="2">Desktop</option>
                            <option value="3">GPU</option>
                        </select>
                        <div class="invalid-feedback">Seleccione una categoría.</div>
                    </div>

                    <div class="col-6">
                        <select class="form-select form-select-lg" name="cboProducto" required>
                            <option value="">Seleccione un Producto</option>
                            <option value="1">HP</option>
                            <option value="2">Asus</option>
                            <option value="3">Msi</option>
                        </select>
                        <div class="invalid-feedback">Seleccione un producto.</div>
                    </div>
                </div>

                <!-- FILA 3 -->
                <div class="row g-4 mb-4">
                    <div class="col-6">
                        <input type="number" name="txtCantidad" class="form-control form-control-lg" 
                               placeholder="Cantidad" required>
                        <div class="invalid-feedback">Ingrese la cantidad.</div>
                    </div>

                    <div class="col-6">
                        <input type="number" name="txtPrecio" class="form-control form-control-lg" 
                               placeholder="Precio" min="0" step="0.01" required>
                        <div class="invalid-feedback">Ingrese el precio.</div>
                    </div>
                </div>

                <!-- BOTÓN REGISTRAR -->
                <div class="text-start my-4">
                    <button class="btn btn-success btn-lg px-5 py-2" type="submit">AGREGAR</button>
                </div>

            </form>

            <!-- TABLA -->
            <table class="table table-hover table-responsive rounded-4 overflow-hidden shadow-sm mt-4">
                <thead class="table-secondary text-white">
                    <tr class="text-center">
                        <th class="border-0 p-3">Código</th>
                        <th class="border-0 p-3">Nombre y Apellido</th>
                        <th class="border-0 p-3">DNI</th>
                        <th class="border-0 p-3">Categoría</th>
                        <th class="border-0 p-3">Producto</th>
                        <th class="border-0 p-3">Cantidad</th>
                        <th class="border-0 p-3">Precio</th>
                        <th class="border-0 p-3">Eliminar</th>
                        <th class="border-0 p-3">Modificar</th>
                    </tr>
                </thead>

                <tbody>
                    <tr class="text-center">
                        <td class="border-end p-3">1</td>
                        <td class="border-end p-3">2</td>
                        <td class="border-end p-3">3}</td>
                        <td class="border-end p-3">4</td>
                        <td class="border-end p-3">5</td>
                        <td class="border-end p-3">6</td>
                        <td class="border-end p-3">7</td>
                        <td class="border-end p-3">
                            <i class="bi bi-trash text-danger"></i>
                        </td>
                        <td class="p-3">
                            <i class="bi bi-pencil-square text-warning"></i>
                        </td>
                    </tr>
                </tbody>
            </table>

        </section>
    </main>

    <jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
