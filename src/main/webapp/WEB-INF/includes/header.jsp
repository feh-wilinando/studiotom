<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="author" content="Fernando Willian de Souza Furtado">

    <c:url value="/resources" var="resourcesPath"/>

    <%--CSS--%>
    <link rel="stylesheet" href="${resourcesPath}/css/normalize.css">
    <link rel="stylesheet" href="${resourcesPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${resourcesPath}/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="${resourcesPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${resourcesPath}/css/bootstrap-switch.min.css">
    <link rel="stylesheet" href="${resourcesPath}/css/bootstrap-select.min.css">
    <link rel="stylesheet" href="${resourcesPath}/css/datatables.min.css">


    <%--Libs JS--%>
    <script src="${resourcesPath}/js/jquery-2.2.0.min.js"></script>
    <script src="${resourcesPath}/js/bootstrap.min.js"></script>

    <%--Extensions for lib--%>
    <script src="${resourcesPath}/js/extensions/jquery/jquery-inpumask/jquery.inputmask.bundle.min.js"></script>
    <script src="${resourcesPath}/js/extensions/bootstrap/bootstrap-switch/bootstrap-switch.min.js"></script>
    <script src="${resourcesPath}/js/extensions/bootstrap/bootstrap-select/bootstrap-select.min.js"></script>
    <script src="${resourcesPath}/js/extensions/bootstrap/bootstrap-select/i18n/defaults-pt_BR.min.js"></script>
    <script src="${resourcesPath}/js/extensions/bootstrap/bootstrap-filestyle/bootstrap-filestyle.min.js"></script>
    <script src="${resourcesPath}/js/extensions/jquery/datatable/datatables.min.js"></script>

    <%--Custom--%>
    <script src="${resourcesPath}/js/custom/Ready.js"></script>

    <title>Studio Tom</title>

</head>
<body>