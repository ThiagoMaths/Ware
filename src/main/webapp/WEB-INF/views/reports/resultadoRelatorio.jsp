<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link >
</head>
<body>
<div class="row">

    <table class="table" id="tabelaresultados">

        <thead>

        <tr>
            <th scope="col">ID</th>
            <th scope="col">Nome</th>
            <th scope="col">Telefones</th>
        </tr>

        </thead>

        <tbody>

        <c:forEach items='${listaUser}' var='ml'>

        <tr>
            <td><c:out value="${ml.id}"></c:out></td>
            <td><c:out value="${ml.nome}"></c:out></td>
        </tr>

        <tr>
            <td items="${ml.modelTelefone}" var="fone"></td>
        </tr>

            <td style="font-size: 10px;">
                <c:out value="${fone.numero}"></c:out></td>

            </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>