<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="st" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<st:page>
    <jsp:attribute name="extraScrpits">
    </jsp:attribute>
    <jsp:body>

        <div class="col-md-offset-3 col-md-6">

            <form:form  action="${spring:mvcUrl('CC#save').build()}" method="post" commandName="client" enctype="multipart/form-data">

                <input type="hidden" name="id" value="${client.id}">
                <input type="hidden" name="profileImagePath" value="${client.profileImagePath}">

                <div class="row text-center">
                    <img id="foto"  class="img-thumbnail" width="171" height="180" src="${not empty client.profileImagePath? client.profileImagePath :"http://placehold.it/171x180"}"/>
                </div>

                <c:set var="profileImagePathHasError">
                    <form:errors path="profileImagePath" cssClass="pull-right text-danger"/>
                </c:set>

                <div class="row ${not empty profileImagePathHasError? 'has-error' : ''}">
                    <input type="file"
                           class="filestyle"
                           data-buttonText="Escolha uma imagem"
                           data-buttonBefore="true"
                           data-iconname="glyphicon glyphicon-picture"
                           data-buttonname="btn btn-warning btn-block"
                           data-placeholder="Selecione uma foto"
                           onchange="previewFileLoad(this, '#foto')"
                           name="profileImg"
                    />
                    ${profileImagePathHasError}
                </div>

                <fieldset>
                    <legend>Cadastrais</legend>

                    <c:set var="nameHasError">
                        <form:errors path="name" cssClass="pull-right text-danger"/>
                    </c:set>
                    <div class="row form-group ${not empty nameHasError? 'has-error': ''}">
                        <div class="col-md-12">
                            <label for="name"> Nome</label>
                            <form:input  path="name" type="text" class="form-control"/>
                            ${nameHasError}
                        </div>
                    </div>


                    <c:set var="emailHasError">
                        <form:errors path="email" cssClass="pull-right text-danger"/>
                    </c:set>
                    <div class="row form-group ${not empty emailHasError? 'has-error' : ''}">
                        <div class="col-md-12">
                            <label for="email"> Email</label>
                            <form:input  path="email" type="text" class="form-control"/>
                            ${emailHasError}
                        </div>
                    </div>


                    <c:set var="birthDateHasError">
                        <form:errors path="birthDate" cssClass="pull-right text-danger"/>
                    </c:set>
                    <div class="row form-group">
                        <div class="col-md-6 ${not empty birthDateHasError? 'has-error' : ''}">
                            <label for="birthDate"> Data Nascimento</label>
                            <form:input path="birthDate" type="date" class="form-control"/>
                            ${birthDateHasError}
                        </div>


                        <c:set var="genderHasError">
                            <form:errors path="gender" cssClass="pull-right text-danger"/>
                        </c:set>
                        <div class="col-md-6 ${not empty genderHasError? 'has-error' : ''}">
                            <label for="gender"> Sexo</label>
                            <form:select path="gender"  cssClass="selectpicker show-tick show-menu-arrow form-control" >
                                <form:option value="" disabled="true" selected="true">Selecione um gênero</form:option>
                                <form:options items="${genders}" itemLabel="value"/>
                            </form:select>
                            ${genderHasError}
                        </div>

                    </div>

                    <div class="row form-group">

                        <c:set var="telephoneHasError">
                            <form:errors path="telephone" cssClass="pull-right text-danger"/>
                        </c:set>
                        <div class="col-md-6 ${not empty telephoneHasError? 'has-error' : ''}">
                            <label for="telephone">Telefone</label>
                            <form:input path="telephone" type="text"  class="form-control"
                                   data-inputmask-mask="(99) 9999-9999" data-inputmask-removeMaskOnSubmit="true"/>
                            ${telephoneHasError}
                        </div>


                        <c:set var="cellPhoneHasError">
                            <form:errors path="cellPhone" cssClass="pull-right text-danger"/>
                        </c:set>
                        <div class="col-md-6 ${not empty cellPhoneHasError? 'has-error' : ''}">
                            <label for="cellPhone">Celular</label>
                            <form:input path="cellPhone" type="text" class="form-control"
                                   data-inputmask-mask="(99) [9]9999-9999" data-inputmask-removeMaskOnSubmit="true"/>
                            ${cellPhoneHasError}
                        </div>

                    </div>
                </fieldset>
                <fieldset>
                    <legend>Documentos</legend>
                    <div class="row">


                        <c:set var="identityDocumentHasError">
                            <form:errors path="identityDocument" cssClass="pull-right text-danger"/>
                        </c:set>
                        <div class="col-md-6 form-group ${not empty identityDocumentHasError? 'has-error' : ''}">
                            <label for="identityDocument"> RG</label>
                            <form:input path="identityDocument" type="text"  class="form-control"/>
                            ${identityDocumentHasError}
                        </div>

                        <c:set var="socialIdHasError">
                            <form:errors path="socialId" cssClass="pull-right text-danger"/>
                        </c:set>
                        <div class="col-md-6 form-group ${not empty socialIdHasError? 'has-error' : ''}">
                            <label for="socialId"> CPF</label>
                            <form:input path="socialId" type="text"  class="form-control"
                                   data-inputmask-mask="999.999.999-99" data-inputmask-removeMaskOnSubmit="true"/>
                            ${socialIdHasError}
                        </div>
                    </div>

                </fieldset>

                <fieldset>
                    <legend>Endereço</legend>

                    <div class="row form-group">

                        <c:set var="streetHasError">
                            <form:errors path="street" cssClass="pull-right text-danger"/>
                        </c:set>
                        <div class="col-md-8 ${not empty streetHasError? 'has-error' : ''}">
                            <label for="street">Endereço</label>
                            <form:input path="street" type="text"  class="form-control"/>
                            ${streetHasError}
                        </div>


                        <c:set var="numeberHasError">
                            <form:errors path="number" cssClass="pull-right text-danger"/>
                        </c:set>
                        <div class="col-md-4 ${not empty numeberHasError? 'has-error' : ''}">
                            <label for="number">Numero</label>
                            <form:input path="number" type="number" class="form-control" min="0"/>
                            ${numeberHasError}
                        </div>
                    </div>

                    <div class="row form-group">

                        <c:set var="complementHasError">
                            <form:errors path="complement" cssClass="pull-right text-danger"/>
                        </c:set>
                        <div class="col-md-12 ${not empty complementHasError? 'has-error' : ''}">
                            <label for="complement">Complemento</label>
                            <form:input path="complement" type="text" class="form-control"/>
                            ${complementHasError}
                        </div>
                    </div>


                    <div class="row form-group">

                        <c:set var="zipCodeHasError">
                            <form:errors path="zipCode" cssClass="pull-right text-danger"/>
                        </c:set>
                        <div class="col-md-4 ${not empty zipCodeHasError? 'has-error' : ''}">
                            <label for="zipCode">CEP</label>
                            <form:input path="zipCode" type="text" class="form-control"
                                   data-inputmask-mask="99999-999" data-inputmask-removeMaskOnSubmit="true"/>
                            ${zipCodeHasError}
                        </div>


                        <c:set var="stateCodeHasError">
                            <form:errors path="state" cssClass="pull-right text-danger"/>
                        </c:set>
                        <div class="col-md-4 ${not empty stateCodeHasError? 'has-error' : ''}">
                            <label for="state">Estado</label>
                            <form:input path="state" type="text" class="form-control"/>
                            ${stateCodeHasError}
                        </div>


                        <c:set var="stateCodeHasError">
                            <form:errors path="city" cssClass="pull-right text-danger"/>
                        </c:set>
                        <div class="col-md-4 ${not empty stateCodeHasError? 'has-error' : ''}">
                            <label for="city">Municipio</label>
                            <form:input path="city" type="text" class="form-control"/>
                            ${stateCodeHasError}
                        </div>

                    </div>

                    <div>
                        <button class="btn btn-danger" type="reset">Limpar</button>
                        <button class="btn btn-primary" type="submit">Salvar</button>
                    </div>

                </fieldset>
            </form:form>
        </div>
    </jsp:body>
</st:page>