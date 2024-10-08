<%@page import="servlets.ServletUsuarioController, model.ModelLogin" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="ISO-8859-1" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">


<body>


<div id="pcoded" class="pcoded">
    <div class="pcoded-overlay-box"></div>
    <div class="pcoded-container navbar-wrapper">


        <div class="pcoded-main-container">
            <div class="pcoded-wrapper">


                <div class="pcoded-content">


                    <div class="pcoded-inner-content">
                        <div class="main-body">
                            <div class="page-wrapper">
                                <div class="page-body">

                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="card">
                                                <div class="card-block">
                                                    <h4 class="sub-title">Cad. Usuário</h4>


                                                        <input type="hidden" name="acao" id="acao" value="">

                                                        <div class="form-group form-default form-static-label">
                                                            <span class="form-bar"></span>
                                                            <label class="float-label">ID:</label>
                                                        </div>

                                                        <div class="form-group form-default form-static-label">
                                                            <span class="form-bar"></span>
                                                            <label class="float-label">Nome:</label>
                                                        </div>

                                                        <div class="form-group form-default form-static-label">
                                                            <span class="form-bar"></span>
                                                            <label class="float-label">Data Nascimento:</label>
                                                        </div>
                                                        <div class="form-group form-default form-static-label">
                                                            <span class="form-bar"></span>
                                                            <label class="float-label">Renda Mensal:</label>
                                                        </div>

                                                        <div class="form-group form-default form-static-label">
                                                            <span class="form-bar"></span>
                                                            <label class="float-label">E-mail:</label>
                                                        </div>

                                                        <div class="form-group form-default form-static-label">
                                                            <select class="form-control"
                                                                    aria-label="Default select example" name="perfil">




                                                            </select>
                                                            <span class="form-bar"></span>
                                                            <label class="float-label">Perfil:</label>
                                                        </div>


                                                        <div class="form-group form-default form-static-label">
                                                            <span class="form-bar"></span>
                                                            <label class="float-label">Cep</label>
                                                        </div>

                                                        <div class="form-group form-default form-static-label">
                                                            <span class="form-bar"></span>
                                                            <label class="float-label">Logradouro</label>
                                                        </div>

                                                        <div class="form-group form-default form-static-label">
                                                            <span class="form-bar"></span>
                                                            <label class="float-label">Bairro</label>
                                                        </div>

                                                        <div class="form-group form-default form-static-label">
                                                            <span class="form-bar"></span>
                                                            <label class="float-label">Cidade</label>
                                                        </div>

                                                        <div class="form-group form-default form-static-label">
                                                            <span class="form-bar"></span>
                                                            <label class="float-label">Estado</label>
                                                        </div>

                                                        <div class="form-group form-default form-static-label">
                                                            <span class="form-bar"></span>
                                                            <label class="float-label">Número</label>
                                                        </div>


                                                        <div class="form-group form-default form-static-label">
                                                            <span class="form-bar"></span>
                                                            <label class="float-label">Login</label>
                                                        </div>

                                                        <div class="form-group form-default form-static-label">
                                                            <span class="form-bar"></span>
                                                            <label class="float-label">Senha</label>
                                                        </div>

                                                        <div class="form-group form-default form-static-label">
                                                            >Masculino

                                                        </div>


                                                        <c:if test="${modolLogin.id > 0 }">

                                                        </c:if>

                                                    </form>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <span id="msg">${msg}</span>

                                    <div style="height: 300px; overflow: scroll;">
                                        <table class="table" id="tabelaresultadosview">
                                            <thead>
                                            <tr>
                                                <th scope="col">ID</th>
                                                <th scope="col">Nome</th>
                                                <th scope="col">Ver</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items='${modelLogins}' var='ml'>
                                                <tr>
                                                    <td><c:out value="${ml.id}"></c:out></td>
                                                    <td><c:out value="${ml.nome}"></c:out></td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>


                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination">
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                            <div id="styleSelector"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<!-- Modal -->
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Pesquisa de usuário</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <div class="input-group mb-3">
                    <div class="input-group-append">
                        <button class="btn btn-success" type="button" onclick="buscarUsuario();">Buscar</button>
                    </div>
                </div>

                <div style="height: 300px;overflow: scroll;">
                    <table class="table" id="tabelaresultados">
                        <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Nome</th>
                            <th scope="col">Ver</th>
                        </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </div>
                <nav aria-label="Page navigation example">
                    <ul class="pagination" id="ulPaginacaoUserAjax">

                    </ul>
                </nav>

                <span id="totalResultados"></span>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
            </div>
        </div>
    </div>
</div>




</body>
</html>