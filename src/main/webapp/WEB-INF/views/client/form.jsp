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

            <form:form  action="${spring:mvcUrl('CC#save').build()}" method="post" commandName="client">
                <div class="row text-center">
                    <img id="foto"  class="img-thumbnail" width="171" height="180" src="http://placehold.it/171x180"/>
                </div>

                <c:set var="profileImagePathHasError">
                    <form:errors path="profileImagePath"  cssClass="pull-right text-danger"/>
                </c:set>
                <div class="row ${not empty profileImagePathHasError? 'has-error' : ''}">
                    <input type="file"
                           class="filestyle"
                           data-buttonText="Escolha uma imagem"
                           data-buttonBefore="true"
                           data-iconname="glyphicon glyphicon-picture"
                           data-buttonname="btn btn-warning btn-block"
                           onchange="previewFileLoad(this, '#foto')"
                           name="profileImagePath"
                    >
                    ${profileImagePathHasError}
                </div>



                <fieldset>
                    <legend>Cadastrais</legend>

                    <c:set var="nameHasError">
                        <form:errors path="name" cssClass="pull-right text-danger"/>
                    </c:set>
                    <div class="row form-group ${not empty nameHasError? 'has-error' : ''}">
                        <div class="col-md-12">
                            <label for="nome"> Nome</label>
                            <input id="nome" name="name" type="text" class="form-control">
                            ${nameHasError}
                        </div>
                    </div>


                    <c:set var="emailHasError">
                        <form:errors path="email" cssClass="pull-right text-danger"/>
                    </c:set>
                    <div class="row form-group ${not empty emailHasError? 'has-error' : ''}">
                        <div class="col-md-12">
                            <label for="email"> Email</label>
                            <input id="email" name="email" type="text" class="form-control">
                            ${emailHasError}
                        </div>
                    </div>


                    <div class="row form-group">
                        <c:set var="birthDateHasError">
                            <form:errors path="birthDate" cssClass="pull-right text-danger"/>
                        </c:set>
                        <div class="col-md-6 ${not empty birthDateHasError? 'has-error' : ''}">
                            <label for="dataNascimento"> Data Nascimento</label>
                            <input id="dataNascimento" name="birthDate" type="date" class="form-control">
                            ${birthDateHasError}
                        </div>

                        <c:set var="genderHasError">
                            <form:errors path="gender" cssClass="pull-right text-danger"/>
                        </c:set>
                        <div class="col-md-6 ${not empty genderHasError? 'has-error' : ''}">
                            <label for="genero"> Sexo</label>
                            <select id="genero" name="gender" class="selectpicker show-tick show-menu-arrow form-control" >
                                <option value="" disabled selected>Selecione um gênero</option>
                                <c:forEach items="${genders}" var="gender">
                                    <option value="${gender}">${gender.value}</option>
                                </c:forEach>
                            </select>
                            ${genderHasError}
                        </div>

                    </div>

                    <div class="row form-group">

                        <c:set var="telephoneHasError">
                            <form:errors path="telephone" cssClass="pull-right text-danger"/>
                        </c:set>
                        <div class="col-md-6 ${not empty telephoneHasError? 'has-error' : ''}">
                            <label for="telefone">Telefone</label>
                            <input id="telefone" name="telephone" type="text"  class="form-control"
                                   data-inputmask-mask="(99) 9999-9999" data-inputmask-removeMaskOnSubmit="true">
                            ${telephoneHasError}
                        </div>


                        <c:set var="cellPhoneHasError">
                            <form:errors path="cellPhone" cssClass="pull-right text-danger"/>
                        </c:set>
                        <div class="col-md-6 ${not empty cellPhoneHasError? 'has-error' : ''}">
                            <label for="celular">Celular</label>
                            <input id="celular" name="cellPhone" type="text" class="form-control"
                                   data-inputmask-mask="(99) [9]9999-9999" data-inputmask-removeMaskOnSubmit="true">
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
                            <label for="rg"> RG</label>
                            <input id="rg" name="identityDocument" type="text"  class="form-control">
                            ${identityDocumentHasError}
                        </div>


                        <c:set var="socialIdHasError">
                            <form:errors path="socialId" cssClass="pull-right text-danger"/>
                        </c:set>
                        <div class="col-md-6 form-group ${not empty socialIdHasError? 'has-error' : ''}">
                            <label for="cpf"> CPF</label>
                            <input id="cpf" name="socialId" type="text"  class="form-control"
                                   data-inputmask-mask="999.999.999-99" data-inputmask-removeMaskOnSubmit="true">
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
                            <label for="endereco">Endereço</label>
                            <input id="endereco" name="street" type="text"  class="form-control">
                            ${streetHasError}
                        </div>

                        <c:set var="numeberHasError">
                            <form:errors path="number" cssClass="pull-right text-danger"/>
                        </c:set>
                        <div class="col-md-4 ${not empty numeberHasError? 'has-error' : ''}">
                            <label for="numero">Numero</label>
                            <input id="numero" name="number" type="number" class="form-control" min="0">
                            ${numeberHasError}
                        </div>
                    </div>

                    <div class="row form-group">

                        <c:set var="complementHasError">
                            <form:errors path="complement" cssClass="pull-right text-danger"/>
                        </c:set>
                        <div class="col-md-12 ${not empty complementHasError? 'has-error' : ''}">
                            <label for="complemento">Complemento</label>
                            <input id="complemento" name="complement" type="text" class="form-control">
                            ${complementHasError}
                        </div>
                    </div>


                    <div class="row form-group">


                        <c:set var="zipCodeHasError">
                            <form:errors path="zipCode" cssClass="pull-right text-danger"/>
                        </c:set>
                        <div class="col-md-4 ${not empty zipCodeHasError? 'has-error' : ''}">
                            <label for="cep">CEP</label>
                            <input id="cep" name="zipCode" type="text" class="form-control"
                                   data-inputmask-mask="99999-999" data-inputmask-removeMaskOnSubmit="true">
                            ${zipCodeHasError}
                        </div>


                        <c:set var="stateCodeHasError">
                            <form:errors path="state" cssClass="pull-right text-danger"/>
                        </c:set>
                        <div class="col-md-4 ${not empty stateCodeHasError? 'has-error' : ''}">
                            <label for="estado">Estado</label>
                            <input id="estado" name="state" type="text" class="form-control">
                            ${stateCodeHasError}
                        </div>


                        <c:set var="cityCodeHasError">
                            <form:errors path="city" cssClass="pull-right text-danger"/>
                        </c:set>
                        <div class="col-md-4 ${not empty stateCodeHasError? 'has-error' : ''}">
                            <label for="municipio">Municipio</label>
                            <input id="municipio" name="city" type="text" class="form-control">
                            ${cityCodeHasError}
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