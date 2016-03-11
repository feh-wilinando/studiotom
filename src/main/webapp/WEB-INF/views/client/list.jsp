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
                text: '<spring:message code="site.client.actions.insert"/> <span class="fa fa-user-plus"/>',
                titleAttr: '<spring:message code="site.client.actions.insert"/>',
                action: function(element, data, node, config ){
                    var link = '${spring:mvcUrl("CC#form").build()}';

                    document.location.href = link;
                }
            };


            var buttonDelete = {
                text: '<spring:message code="site.client.actions.delete"/> <span class="fa fa-user-times"/>',
                titleAttr: '<spring:message code="site.client.actions.delete"/>',
                action: function(element, data, node, config ){

                    var rows = data.rows({selected: true}).nodes();

                    if (!(rows.length > 0)){
                        $("#alert").removeClass();
                        $("#alert").addClass('alert alert-danger alert-dismissible');
                        $("#alert-body").html("<strong><spring:message code="site.cliente.actions.NoSelectItem"/></strong><br><spring:message code="site.cliente.actions.NoSelectItem.sub"/>")
                        $("#alert").fadeTo(2200, 500).slideUp(500)
                        $("#alert").alert();

                        return;
                    }


                    var tr = rows[0];
                    var td = tr.children[0];
                    var name = $(td).text();
                    var id = tr.getAttribute("id");
                    var link = "${spring:mvcUrl("CC#delete").build()}" + id;


                    $("#confirmModal").on('show.bs.modal', function(){
                        var modal = $(this);

                        modal.focus();

                        modal.find('#modal-body-text').text('<spring:message code="site.client.actions.delete.confirm"/> '+name+' ?');



                        var btnAction = modal.find('#modal-btn-action');
                        btnAction.addClass('btn-danger');
                        btnAction.attr('href', link);
                        btnAction.text('Excluir');



                        var btnCancel = modal.find('#modal-btn-cancel');
                        btnCancel.addClass('btn-primary');
                        btnCancel.text('Cancelar');

                    });

                    $("#confirmModal").modal({backdrop:'static'});


                }
            };


            var buttonUpdate = {
                text: '<spring:message code="site.client.actions.update"/> <span class="fa fa-refresh"/>',
                titleAttr: '<spring:message code="site.client.actions.update"/>',
                action: function(element, data, node, config ){
                    var rows = data.rows({selected: true}).nodes();

                    if (!(rows.length > 0)){
                        $("#alert").removeClass();
                        $("#alert").addClass('alert alert-danger alert-dismissible');
                        $("#alert-body").html("<strong><spring:message code="site.cliente.actions.NoSelectItem"/></strong><br><spring:message code="site.cliente.actions.NoSelectItem.sub"/>")
                        $("#alert").fadeTo(2200, 500).slideUp(500)
                        $("#alert").alert();

                        return;
                    }


                    var tr = rows[0];
                    var id = tr.getAttribute("id");
                    var link = "${spring:mvcUrl("CC#edit").build()}"+ id;

                    document.location.href = link;
                }
            };



            var buttons = {

                extend: 'collection',
                text: '<spring:message code="site.client.actions"/> <span class="fa fa-cogs"/>',
                buttons:[buttonInsert, buttonUpdate, buttonDelete],
                fade:true
            };

            jsonOptions.buttons = [buttons];


            dt = datatable('#table',jsonOptions,true);


        </script>
    </jsp:attribute>

    <jsp:body>

        <div class="modal fade" id="confirmModal">
        	<div class="modal-dialog">
        		<div class="modal-content">
        			<div class="modal-header">
        				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        				<h4 class="modal-title">Atenção</h4>
        			</div>
        			<div class="modal-body">
        				<span id="modal-body-text"></span>
        			</div>
        			<div class="modal-footer">
        				<a id="modal-btn-cancel" href=""  class="btn" data-dismiss="modal"></a>
        				<a id="modal-btn-action" href="#" class="btn"></a>
        			</div>
        		</div><!-- /.modal-content -->
        	</div><!-- /.modal-dialog -->
        </div><!-- /.modal -->

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


        <div id="alert">
            <span id="alert-body"></span>
        </div>

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
