
<%@page import="negocio.modelo.Comida"%>
<%@page import="negocio.modelo.ComidaDelCarrito"%>
<%@page import="java.util.ArrayList"%>
<%@page import="negocio.modelo.DAO.CategoriaDAO"%>
<%@page import="negocio.modelo.Categoria"%>
<%@page import="negocio.modelo.Cliente"%>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="La caba?ita Template">
        <meta name="keywords" content="La caba?ita, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>La caba?ita - pedido en l?nea</title>

        <!-- Google Font -->    
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap1.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/detallesProducto.css" type="text/css">
        <link rel="stylesheet" href="css/themify-icons.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style1.css?v=1.0" type="text/css">
        <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@700&display=swap" rel="stylesheet">

    </head>

    <body>
        <script>
            function confirmar() {
                if (confirm("?Esta seguro que desea agregar al carrito?")) {
                    return true;
                }
                return false;
            }
            function carritoVacio() {
                if (confirm("Su carrito de compras est? vac?o.")) {
                    return true;
                }
                return false;
            }
        </script>
        
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>

        <!-- Header Section Begin -->

        <header class="header-section">
            <div class="header-top">
                <div class="container">
                    <div class="ht-left">
                        <div class="mail-service">
                            <i class=" fa fa-envelope"></i>
                            danielsmart5@hotmail.com
                        </div>
                        <div class="phone-service">
                            <i class=" fa fa-phone"></i>
                            +51 977 953 432
                        </div>
                    </div>
                    <div class="ht-right">
                        <%
                            Cliente cliente = null;
                            cliente = (Cliente) request.getSession().getAttribute("cliente");
                            if (cliente == null) {


                        %>
                        <a href="login" class="login-panel"><i class="fa fa-user"></i>Ingresar</a>
                        <%                        } else {

                        %>
                        <div class="login-panel">
                            <span style="padding-right: 10px"><a href="datosCliente" style="color: black"><%=cliente.getUsuario()%></a></span>
                            <a href="cerrarSesionCliente" style="color: black"><i class="fa fa-user"></i>Cerrar sesi?n</a>

                        </div>

                        <%
                            }
                        %>
                        <div class="top-social">
                            <a href="#"><i class="ti-facebook"></i></a>
                            <a href="#"><i class="ti-twitter-alt"></i></a>
                            <a href="#"><i class="ti-linkedin"></i></a>
                            <a href="#"><i class="ti-youtube"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="inner-header">
                    <div class="row">
                        <div class="col-lg-2 col-md-2" style="margin-top: -30px;">
                            <div class="logo">
                                <a href="Principal.jsp">
                                    <img src="img/logo.png" alt="">
                                </a>
                            </div>
                        </div>
                        <form class="col-lg-7 col-md-7" action="buscarProductoPorInicial" method="post">
                            <div class="advanced-search">
                                 <button type="button" class="category-btn">Toda categoria</button>
                                <div class="input-group">
                                    
                                    <input type="text" placeholder="Ingresa el nombre" name="nombreProducto">
                                    <button type="submit"><i class="ti-search"></i></button>
                                </div>
                            </div>
                        </form>
                        <div class="col-lg-3 text-right col-md-3">
                            <ul class="nav-right">

                                <li class="cart-icon">
                                    <a href="#">
                                        <i class="icon_bag_alt"></i>
                                        <%
                                            ArrayList<ComidaDelCarrito> comidasCarrito = (ArrayList<ComidaDelCarrito>) request.getSession().getAttribute("comida_Carrito");
                                            if (comidasCarrito != null) {

                                                int cantidad = comidasCarrito.size();

                                        %>
                                        <span><%=cantidad%></span>
                                        <%
                                            }
                                        %>
                                    </a>
                                    <div class="cart-hover">
                                        <div class="select-items">
                                            <table>
                                                <tbody>
                                                    <%
                                                        comidasCarrito = (ArrayList<ComidaDelCarrito>) request.getSession().getAttribute("comida_Carrito");
                                                        if (comidasCarrito != null) {

                                                            for (ComidaDelCarrito comida : comidasCarrito) {


                                                    %>
                                                    <tr>
                                                        <td class="si-pic"><img width="150" height="100" src="ControladorImagen?idcomida=<%=comida.getIdcomida()%>"></td>
                                                        <td class="si-text">
                                                            <div class="product-selected">
                                                                <p><span>S/. </span><%=comida.getPrecio()%><span> x <%=comida.getCantidad()%></span></p>
                                                                <h6><%=comida.getNombre()%></h6>
                                                            </div>
                                                        </td>
                                                        <td class="si-close">
                                                            <a href="eliminarDelCarrito?idcomida=<%=comida.getIdcomida()%>&pathJSP=indexCommerce"><i class="ti-close"></i></a>
                                                        </td>
                                                    </tr>
                                                    <%
                                                            }
                                                        }
                                                    %>

                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="select-total">
                                            <span>total:</span>
                                            <%
                                                float total = 0;
                                                if (comidasCarrito != null) {

                                                    for (ComidaDelCarrito comida : comidasCarrito) {

                                            %>
                                            <%                                                        total += comida.getPrecio_total();
                                                    }
                                                }
                                            %>
                                            <h5><span>S/. </span><%=total%></h5>
                                        </div>
                                        <div class="select-button">
                                            <a href="carrito" class="primary-btn view-card">Ver todo</a>
                                            <%
                                                if (comidasCarrito != null) {


                                            %>
                                            <a href="confirmarCompra" class="primary-btn checkout-btn">Confirmar compra</a>
                                            <%                                            } else {
                                            %>
                                            <a href="#" onclick="return carritoVacio()" class="primary-btn checkout-btn">Confirmar compra</a>
                                            <%
                                                }
                                            %>
                                        </div>
                                    </div>
                                </li>
                                <li class="cart-price"><span>S/. </span><%=total%></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="nav-item">
                <div class="container">
                    <div class="nav-depart">
                        <div class="depart-btn">
                            <i class="ti-menu"></i>
                            <span>Todas las categor?as</span>
                            <ul class="depart-hover">
                                <%
                                    ArrayList<Categoria> categorias = CategoriaDAO.listarCategorias();
                                    for (Categoria c : categorias) {
                                %>
                                <li><a href="comidasCategoria?idcategoria=<%=c.getIdcategoria()%>"><%=c.getCategoria()%></a></li>
                                    <%}%>    

                            </ul>
                        </div>
                    </div>
                    <nav class="nav-menu mobile-menu">
                        <ul>
                            <li class="active"><a href="indexCommerce">Inicio</a></li>
                            <li><a href="shop">Men?</a></li>



                            <li><a href="#">P?ginas</a>
                                <ul class="dropdown">

                                    <li><a href="carrito">Carrito de compra</a></li>
                                    
                                        <%
                                            if (cliente == null) {
                                        %>
                                    <li><a href="agregarCliente">Registrarse</a></li>
                                    <li><a href="login">Ingresar</a></li>
                                        <%
                                        } else {
                                        %>
                                    <li><a href="historialDeCompra">Historial de compras</a></li>
                                        <%
                                            }
                                        %>
                                </ul>
                            </li>
                    </nav>
                    <div id="mobile-menu-wrap"></div>
                </div>
            </div>
        </header>
        <!-- Header End -->
        <div class="container" style="margin-bottom: 80px">
            <div class="Productocard">
                <div class="container-fliud">
                    <div class="Productowrapper row">
                        <div class="Productopreview col-md-6">
                            <%
                                Comida comida = (Comida) request.getAttribute("comida");
                            %>
                            <div class="Productopreview-pic Productotab-content">
                                <div class="tab-pane active"><img width="100" height="300" src="ControladorImagen?idcomida=<%=comida.getIdcomida()%>" /></div>

                            </div>


                        </div>
                        <div class="Productodetails col-md-6">
                            <h3 class="product-title"><%=comida.getNombre()%></h3>
                            <div class="Productorating">
                                <div class="stars">
                                    <span class="fa fa-star Productochecked"></span>
                                    <span class="fa fa-star Productochecked"></span>
                                    <span class="fa fa-star Productochecked"></span>
                                    <span class="fa fa-star"></span>
                                    <span class="fa fa-star"></span>
                                </div>
                                <span class="review-no">15 rese?as</span>
                            </div>
                            <p class="product-description"><%=comida.getDescripcion()%></p>
                            <h4 class="Productoprice">Precio: <span>S/. <%=comida.getPrecio()%></span></h4>



                            <div class="action">
                                <a href="agregarCarrito?idcomida=<%=comida.getIdcomida()%>&pathJSP=detalle"><button onclick="return confirmar()" class="Pro-add-to-cart btn btn-default">Agregar al carrito</button></a>


                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Banner Section End -->




        <!-- Partner Logo Section Begin -->
        <div class="partner-logo">
            <div class="container">
                <div class="logo-carousel owl-carousel">
                    <div class="logo-item">
                        <div class="tablecell-inner">
                            <img src="img/logo-carousel/logo-1.png" alt="">
                        </div>
                    </div>
                    <div class="logo-item">
                        <div class="tablecell-inner">
                            <img src="img/logo-carousel/logo-2.png" alt="">
                        </div>
                    </div>
                    <div class="logo-item">
                        <div class="tablecell-inner">
                            <img src="img/logo-carousel/logo-3.png" alt="">
                        </div>
                    </div>
                    <div class="logo-item">
                        <div class="tablecell-inner">
                            <img src="img/logo-carousel/logo-4.png" alt="">
                        </div>
                    </div>
                    <div class="logo-item">
                        <div class="tablecell-inner">
                            <img src="img/logo-carousel/logo-5.png" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Partner Logo Section End -->

        <!-- Footer Section Begin -->
        <footer class="foot">
            <div class="container py-5">
                <div class="row py-4">
                    <div class="col-lg-4 col-md-6 mb-4 mb-lg-0"><img src="img/logo.png" alt="" height="75" width="180" class="mb-3">
                        <p style="font-size: 15px; color:white">? 2022 La Mayita. Todos los derechos reservados</p>
                        <ul class="list-inline mt-4">
                            <li class="list-inline-item"><a href="#" target="_blank" title="twitter"><i class="fa fa-twitter"></i></a></li>
                            <li class="list-inline-item"><a href="#" target="_blank" title="facebook"><i class="fa fa-facebook"></i></a></li>
                            <li class="list-inline-item"><a href="#" target="_blank" title="instagram"><i class="fa fa-instagram"></i></a></li>
                            <li class="list-inline-item"><a href="#" target="_blank" title="pinterest"><i class="fa fa-pinterest"></i></a></li>
                            <li class="list-inline-item"><a href="#" target="_blank" title="vimeo"><i class="fa fa-vimeo"></i></a></li>
                        </ul>
                    </div>
                    <div class="col-lg-2 col-md-6 mb-4 mb-lg-0">
                        <h6 class="text-uppercase mb-4" style="color: #2773BE; font-weight: 700">Informaci?n</h6>
                        <ul class="list-unstyled mb-0">
                            <li class="mb-2" style="font-size: 15px; color:white"><a href="sobreNosotros" class="text-muted">Sobre nosotros</a></li>
                            <li class="mb-2" style="font-size: 15px; color:white"><a href="contacto" class="text-muted">Cont?ctanos</a></li>
                            <li class="mb-2" style="font-size: 15px; color:white"><a href="reservar" class="text-muted">Reservaci?n</a></li>

                        </ul>
                    </div>
                    <div class="col-lg-2 col-md-6 mb-4 mb-lg-0">
                        <h6 class="text-uppercase mb-4" style="color: #2773BE; font-weight: 700">Empresa</h6>
                        <ul class="list-unstyled mb-0">
                            <li class="mb-2"><a href="login" class="text-muted">Ingresar</a></li>
                            <li class="mb-2"><a href="agregarCliente" class="text-muted">Registrarse</a></li>

                            <li class="mb-2"><a href="carrito" class="text-muted">Carrito de compras</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-4 col-md-6 mb-lg-0">
                        <h6 class="text-uppercase mb-4" style="color: #2773BE; font-weight: 700">Mantente informado</h6>
                        <p class="text-muted mb-4" style="font-size: 15px; color:white">LIngresa tu correo y te mantendremos informado con las ?ltimas ofertas disponibles</p>
                        <div class="p-1 rounded border">
                            <div class="input-group">
                                <input type="email" placeholder="Enter your email address" aria-describedby="button-addon1" class="form-control border-0 shadow-0">
                                <div class="input-group-append">
                                    <button id="button-addon1" type="submit" class="btn btn-link"><i class="fa fa-paper-plane"></i></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Copyrights -->

        </footer>
        <!-- Footer Section End -->

        <!-- Js Plugins -->
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap1.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.countdown.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery.zoom.min.js"></script>
        <script src="js/jquery.dd.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main1.js"></script>
    </body>

</html>