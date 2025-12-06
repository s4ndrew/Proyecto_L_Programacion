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
                <i class="bi bi-box-seam-fill me-2"></i>Iventario
            </h3>

            <!-- FORMULARIO -->
            <form action="ProductoController" method="POST" class="needs-validation" novalidate>

                <!-- FILA 1 -->
                <div class="row g-4 mb-3">
                    <div class="col-6">
                        <input type="text" class="form-control form-control-lg" name="categoria" 
                               placeholder="Categoría" required>
                        <div class="invalid-feedback">Ingrese la categoría.</div>
                    </div>

                    <div class="col-6">
                        <input type="text" class="form-control form-control-lg" name="codigo" 
                               placeholder="Código" required>
                        <div class="invalid-feedback">Ingrese el código.</div>
                    </div>
                </div>

                <!-- FILA 2 -->
                <div class="row g-4 mb-3">
                    <div class="col-6">
                        <input type="text" class="form-control form-control-lg" name="producto"
                               placeholder="Producto" required>
                        <div class="invalid-feedback">Ingrese el nombre del producto.</div>
                    </div>

                    <div class="col-6">
                        <input type="number" class="form-control form-control-lg" name="stock"
                               placeholder="Stock" required>
                        <div class="invalid-feedback">Ingrese el stock.</div>
                    </div>
                </div>

                <!-- FILA 3 -->
                <div class="row g-4 mb-4">
                    <div class="col-6">
                        <input type="text" class="form-control form-control-lg" name="marca"
                               placeholder="Marca" required>
                        <div class="invalid-feedback">Ingrese la marca.</div>
                    </div>

                    <div class="col-6">
                        <input type="number" step="0.01" class="form-control form-control-lg" 
                               name="precio" placeholder="Precio" required>
                        <div class="invalid-feedback">Ingrese el precio.</div>
                    </div>
                </div>

                <!-- BOTÓN -->
                <div class="text-start my-4">
                    <button class="btn btn-success btn-lg px-5 py-2">REGISTRAR</button>
                </div>

            </form>

            <!-- BUSCADOR -->
            <div class="input-group mb-4 shadow-sm">
                <span class="input-group-text bg-white"><i class="bi bi-search"></i></span>
                <input type="text" class="form-control form-control-lg" placeholder="Buscar productos">
            </div>

            <!-- TABLA -->
            <table class="table table-hover table-responsive rounded-4 overflow-hidden shadow-sm mt-2">
                <thead class="table-secondary text-white">
                    <tr class="text-center">
                        <th class="border-0 p-3">Categoría</th>
                        <th class="border-0 p-3">Producto</th>
                        <th class="border-0 p-3">Código</th>
                        <th class="border-0 p-3">Stock</th>
                        <th class="border-0 p-3">Precio</th>
                        <th class="border-0 p-3">Eliminar</th>
                        <th class="border-0 p-3">Modificar</th>
                    </tr>
                </thead>

                <tbody>
                    <tr class="text-center">
                        <td class="border-end p-3">Componentes</td>
                        <td class="border-end p-3">Procesador Intel i5 12400F</td>
                        <td class="border-end p-3">001</td>
                        <td class="border-end p-3">18</td>
                        <td class="border-end p-3">$180</td>
                        <td class="border-end p-3">
                            <i class="bi bi-trash-fill text-danger fs-5"></i>
                        </td>
                        <td class="p-3">
                            <i class="bi bi-pencil-square text-primary fs-5"></i>
                        </td>
                    </tr>
                </tbody>
            </table>

        </section>

    </main>

    <jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
