<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<!DOCTYPE html>
<html lang="en">

<c:import url="../common/head.jsp"/>
<body>

<c:import url="../common/theme-loader.jsp"/>

<div id="pcoded" class="pcoded">
    <div class="pcoded-overlay-box"></div>
    <div class="pcoded-container navbar-wrapper">

        <c:import url="../common/navbar.jsp"/>
        <
        <div class="pcoded-main-container">
            <div class="pcoded-wrapper">

                <c:import url="../common/navbarmainmenu.jsp"/>
                <div class="pcoded-content">

                    <c:import url="../common/page-header.jsp"/>
                    <div class="pcoded-inner-content">
                        <div class="main-body">
                            <div class="page-wrapper">
                                <div class="page-body">
                                    <div class="row">

                                        <h1>Conteúdo das páginas do sistema</h1>

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
</div>

<c:import url="../common/javascriptfile.jsp"/>


</body>

</html>
    