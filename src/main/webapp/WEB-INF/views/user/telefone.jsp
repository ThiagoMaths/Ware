<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<%@page import="servlets.ServletTelefone, model.ModelLogin" %>
<!DOCTYPE html>
<html lang="en">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../../common/head.jsp"></jsp:include>


  <body>
  <jsp:include page="../../common/theme-loader.jsp"></jsp:include>
  
  <!-- Pre-loader end -->
  <div id="pcoded" class="pcoded">
      <div class="pcoded-overlay-box"></div>
      <div class="pcoded-container navbar-wrapper">
       
<jsp:include page="../../common/navbar.jsp"></jsp:include>

          <div class="pcoded-main-container">
              <div class="pcoded-wrapper">
               
               <jsp:include page="../../common/navbarmainmenu.jsp"></jsp:include>
               
                  <div class="pcoded-content">
                      <!-- Page-header start -->
                      
                      <jsp:include page="../../common/page-header.jsp"></jsp:include>
                      
                      <!-- Page-header end -->
                        <div class="pcoded-inner-content">
                            <!-- Main-body start -->
                            <div class="main-body">
                                <div class="page-wrapper">
                                    <!-- Page-body start -->
									<div class="row">
										<div class="col-sm-12">
											<!-- Basic Form Inputs card start -->
											<div class="card">
												<div class="card-block">
												<h4 class="sub-title">Cad. telefone</h4>
                                                    <form class="form-material"  action="<%= request.getContextPath() %>/ServletTelefone" method="post" id="formUser" >

                                                        <div class="form-group form-default form-static-label">
                                                            <input type="text" name="id" id="id" class="form-control"  readonly="readonly" value="${modelLogin.id}">
                                                            <span class="form-bar"></span>
                                                            <label class="float-label">ID User:</label>
                                                        </div>

                                                        <div class="form-group form-default form-static-label">
                                                            <input readonly="readonly" type="text" name="nome" id="nome" class="form-control" required="required" value="${modelLogin.nome}">
                                                            <span class="form-bar"></span>
                                                            <label class="float-label">Nome:</label>
                                                        </div>

                                                        <div class="form-group form-default form-static-label">
                                                            <input type="text" name="numero" id="numero" class="form-control" required="required">
                                                            <span class="form-bar"></span>
                                                            <label class="float-label">Numero:</label>
                                                        </div>

                                                        <button  class="btn btn-success waves-effect waves-light">Salvar</button>

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
                                                <th scope="col">Numero</th>
                                                <th scope="col">Excluir</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items='${modelTelefone}' var='f'>
                                                <tr>
                                                    <td><c:out value="${f.id}"></c:out></td>
                                                    <td><c:out value="${f.numero}"></c:out></td>
                                                    <td><a class="btn btn-success" href="<%= request.getContextPath() %>/ServletTelefone?acao=excluir&id=${f.id}&userpai=${modelLogin.id}" >Excluir</a></td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                    <!-- Page-body end -->
                                </div>
                                <div id="styleSelector"> </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
   <jsp:include page="../../common/javascriptfile.jsp"></jsp:include>
  <script type="text/javascript">
      $("#numero").keypress(function (event) {

          return /\d/.test(String.fromCharCode(event.keyCode));

      });
  </script>
</body>

</html>
    