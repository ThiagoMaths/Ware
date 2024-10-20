<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<!DOCTYPE html>
<html lang="en">


<c:import url="../../common/head.jsp"/>


<body>
<c:import url="../../common/theme-loader.jsp"/>

<!-- Pre-loader end -->
<div id="pcoded" class="pcoded">
    <div class="pcoded-overlay-box"></div>
    <div class="pcoded-container navbar-wrapper">

        <c:import url="../../common/navbar.jsp"/>

        <div class="pcoded-main-container">
            <div class="pcoded-wrapper">

                <c:import url="../../common/navbarmainmenu.jsp"/>

                <div class="pcoded-content">
                    <!-- Page-header start -->

                    <c:import url="../../common/page-header.jsp"/>
                    <!-- Page-header end -->
                    <div class="pcoded-inner-content">
                        <!-- Main-body start -->
                        <div class="main-body">
                            <div class="page-wrapper">
                                <!-- Page-body start -->
                                <div class="page-body">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <!-- Basic Form Inputs card start -->
                                            <div class="card">
                                                <div class="card-block">
                                                    <h4 class="sub-title">Rel. Usuário </h4>

                                                    <form class="form-material"
                                                          action="<%= request.getContextPath() %>/ServletUsuarioController?acao=imprimirRelatorioUser"
                                                          method="get" id="formUser">

                                                        <input type="hidden" id="acaoRelatorioImprimirTipo" name="acao"
                                                               value="imprimirRelatorioUser">

                                                        <div class="form-row align-items-center">
                                                            <div class="col-auto">
                                                                <label class="sr-only" for="dataInicial">Data
                                                                    Inicial</label>
                                                                <input type="text" value="${dataInicial}"
                                                                       class="form-control mb-2" id="dataInicial"
                                                                       name="dataInicial">
                                                            </div>
                                                            <div class="col-auto">
                                                                <div class="input-group mb-2">

                                                                    <label class="sr-only" for="dataFinal">Data
                                                                        Final</label>
                                                                    <input type="text" value="${dataFinal}"
                                                                           class="form-control" id="dataFinal"
                                                                           name="dataFinal">
                                                                </div>
                                                            </div>

                                                            <div class="col-auto">
                                                                <button type="button" onclick="imprimirHtml()"
                                                                        class="btn btn-primary mb-2">Imprimir Relatório
                                                                </button>

                                                                <button type="button" onclick="imprimirPdf() "
                                                                        class="btn btn-primary mb-2">Imprimir PDF
                                                                </button>

                                                            </div>
                                                        </div>
                                                    </form>

                                                    <c:import url="resultadoRelatorio.jsp"/>

                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="styleSelector"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<c:import url="../../common/javascriptfile.jsp"/>
<script href="js/reluser.js" type="text/javascript"></script>

</body>
</html>