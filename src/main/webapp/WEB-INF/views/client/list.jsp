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

                    var a = document.createElement('a');
                    a.href = link;
                    a.click();
                }
            };


            var buttonDelete = {
                text: 'Excluir <span class="fa fa-user-times"/>',
                titleAttr: 'Excluir',
                action: function(element, data, node, config ){
                    var selected = dt.rows({selected: true});
                    var tr = selected.nodes()[0];
                    var id = tr.getAttribute("id")
                    var link = 'client/delete/' + id;
                    console.log(tr);


                    var a = document.createElement('a');
                    a.href = link;
                    a.click();


                }
            };


            var buttonUpdate = {
                text: 'Editar <span class="fa fa-refresh"/>',
                titleAttr: 'Excluir',
                action: function(element, data, node, config ){
                    $("#form").modal();
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
                <tr id="1">
                    <td>Fernando Willian</td>
                    <td>388.036.778.79</td>
                    <td>11 2423-2419</td>
                    <td>11 9 6045-8507</td>
                </tr>

                <tr>
                    <td>Fernando Willian</td>
                    <td>388.036.778.79</td>
                    <td>11 2423-2419</td>
                    <td>11 9 6045-8507</td>
                </tr>

                <tr>
                    <td>Fernando Willian</td>
                    <td>388.036.778.79</td>
                    <td>11 2423-2419</td>
                    <td>11 9 6045-8507</td>
                </tr>
                <tr>
                    <td>Fernando Willian</td>
                    <td>388.036.778.79</td>
                    <td>11 2423-2419</td>
                    <td>11 9 6045-8507</td>
                </tr>
                <tr>
                    <td>Fernando Willian</td>
                    <td>388.036.778.79</td>
                    <td>11 2423-2419</td>
                    <td>11 9 6045-8507</td>
                </tr>
                <tr>
                    <td>Fernando Willian</td>
                    <td>388.036.778.79</td>
                    <td>11 2423-2419</td>
                    <td>11 9 6045-8507</td>
                </tr>
                <tr>
                    <td>Fernando Willian</td>
                    <td>388.036.778.79</td>
                    <td>11 2423-2419</td>
                    <td>11 9 6045-8507</td>
                </tr>
                <tr>
                    <td>Fernando Willian</td>
                    <td>388.036.778.79</td>
                    <td>11 2423-2419</td>
                    <td>11 9 6045-8507</td>
                </tr>
                <tr>
                    <td>Fernando Willian</td>
                    <td>388.036.778.79</td>
                    <td>11 2423-2419</td>
                    <td>11 9 6045-8507</td>
                </tr>
                <tr>
                    <td>Fernando Willian</td>
                    <td>388.036.778.79</td>
                    <td>11 2423-2419</td>
                    <td>11 9 6045-8507</td>
                </tr>
                <tr>
                    <td>Fernando Willian</td>
                    <td>388.036.778.79</td>
                    <td>11 2423-2419</td>
                    <td>11 9 6045-8507</td>
                </tr>

                <tr>
                    <td>Fernando Willian</td>
                    <td>388.036.778.79</td>
                    <td>11 2423-2419</td>
                    <td>11 9 6045-8507</td>
                </tr>



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
