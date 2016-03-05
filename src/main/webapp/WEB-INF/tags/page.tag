
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@attribute name="title" required="false"%>
<%@attribute name="controller" required="false"%>
<%@attribute name="extraScrpits" required="false" fragment="true" %>

<%@include file="/WEB-INF/includes/header.jsp"%>

    <%@include file="/WEB-INF/includes/navigation.jsp"%>


    <main class="container-fluid">
        <jsp:doBody/>
    </main>


    <jsp:invoke fragment="extraScrpits" />

<%@include file="/WEB-INF/includes/footer.jsp"%>