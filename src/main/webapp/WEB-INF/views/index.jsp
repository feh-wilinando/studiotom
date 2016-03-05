<%--
  Created by IntelliJ IDEA.
  User: Nando
  Date: 12/02/16
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="st" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/resources/ng/controller/Customer/ClientController.js" var="controller"/>


<st:page controller="CustomerController">

    <jsp:attribute name="extraScrpits">
        <script src="${controller}"></script>
    </jsp:attribute>


    <jsp:body>
        <h1>{{nome}}</h1>


    </jsp:body>

</st:page>