<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<nav class="navbar navbar-default">

        <div class="container-fluid">

            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-principal-collapse" >
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>

            <div class="navbar-header">

                    <span class="fa fa-stethoscope fa-4x"/>

            </div>




            <div class="collapse navbar-collapse" id="navbar-principal-collapse">
                <ul class="nav navbar-nav">
                    <li><a href="#"><spring:message code="nav.menu.home"/></a></li>
                    <li><a href="<c:url value="/client"/>"> <spring:message code="nav.menu.client"/> </a> </li>
                    <li><a href="#"><spring:message code="nav.menu.anamnesis"/></a></li>
                    <li><a href="#"><spring:message code="nav.menu.calendar"/></a></li>
                    <li><a href="#"><spring:message code="nav.menu.admin"/></a></li>
                </ul>
            </div>


        </div><%--container-fluid--%>
</nav>