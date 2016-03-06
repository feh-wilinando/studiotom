<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="st" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<st:page>
    <jsp:attribute name="extraScrpits">
        <script>

            var jsonOptions = {};

            jsonOptions.select = {
                style:    'single'
            };

            var buttonInsert = {
                text: 'Incluir <span class="fa fa-user-plus"/>',
                titleAttr: 'Incluir',
                action: function(element, data, node, config ){
                    var link = '${spring:mvcUrl("CC#form").build()}';

                    document.location.href = link;
                }
            };


            var buttonDelete = {
                text: 'Excluir <span class="fa fa-user-times"/>',
                titleAttr: 'Excluir',
                action: function(element, data, node, config ){
                    var selected = dt.rows({selected: true});
                    var tr = selected.nodes()[0];
                    var id = tr.getAttribute("id");
                    var link = 'client/delete/' + id;

                    document.location.href = link;


                }
            };


            var buttonUpdate = {
                text: 'Editar <span class="fa fa-refresh"/>',
                titleAttr: 'Editar',
                action: function(element, data, node, config ){
                    var selected = dt.rows({selected: true});
                    var tr = selected.nodes()[0];
                    var id = tr.getAttribute("id");
                    var link = 'client/' + id;

                    document.location.href = link;
                }
            };



            var buttons = {

                extend: 'collection',
                text: 'Ações <span class="fa fa-cogs"/>',
                buttons:[buttonInsert, buttonUpdate, buttonDelete],
                fade:true
            };

            jsonOptions.buttons = [buttons];


            dt = datatable('#table',jsonOptions,true);
        </script>
    </jsp:attribute>

    <jsp:body>

        <table id="table" class="table table-striped table-bordered table-hover">
            <thead>
                <th>Nome</th>
                <th>CPF</th>
                <th>Telefone</th>
                <th>Celular</th>
            </thead>
            <tbody>

                <c:forEach items="${clients}" var="client">

                    <tr id="${client.id}">
                        <td>${client.name}</td>
                        <td>${client.socialId}</td>
                        <td>${client.telephone}</td>
                        <td>${client.cellPhone}</td>
                    </tr>

                </c:forEach>

            </tbody>
        </table>


        <c:if test="${not empty registrationNotification}">
            <div class="alert alert-success alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>

                <strong>${registrationNotification}</strong>

            </div>
        </c:if>

    </jsp:body>

</st:page>
