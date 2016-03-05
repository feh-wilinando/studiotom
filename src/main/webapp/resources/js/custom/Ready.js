/**
 * Created by Nando on 28/02/16.
 */
//function datatable( selector ){
//
//        $(selector).DataTable( {
//
//            fixedHeader: true,
//            //ajax:"",
//
//            columnDefs: [ {
//                orderable: false,
//                className: 'select-checkbox',
//                targets:   0
//            } ],
//            select: {
//                style:    'os',
//                selector: 'td:first-child'
//            },
//
//
//            dom: 'Bfrtip',
//            //lengthChange: false,
//
//            buttons: [
//                {
//                    extend:    'copyHtml5',
//                    text:      'Copiar<span class="fa fa-files-o"/>',
//                    titleAttr: 'Copiar',
//                    className: 'btn-primary'
//                },
//                {
//                    extend:    'excelHtml5',
//                    text:      'Excel<span class="fa fa-file-excel-o"/>',
//                    titleAttr: 'Excel',
//                    className: 'btn-success'
//                },
//
//                {
//                    extend:    'pdfHtml5',
//                    text:      'PDF<span class="fa fa-file-pdf-o"/>',
//                    titleAttr: 'PDF',
//                    className: 'btn-danger',
//                    download: 'open'
//                },
//
//                {
//                    extend:    'print',
//                    text:      'Imprimir<span class="fa fa-print"/>',
//                    titleAttr: 'Imprimir',
//                    className: 'btn-default'
//
//                }
//
//            ],
//
//            language: {
//                "url": "//cdn.datatables.net/plug-ins/1.10.11/i18n/Portuguese-Brasil.json"
//            }
//        } );
//
//}

function datatable(selector, jsonOptions, exportedButtons){

    var customButtons;

    if (typeof jsonOptions === 'undefined'){
        jsonOptions = {};
    }

    if (typeof exportedButtons === 'undefined'){
        exportedButtons = false;
    }

    //Default Options (override)
    jsonOptions.responsive = true;

    jsonOptions.language = {
        "url": "//cdn.datatables.net/plug-ins/1.10.11/i18n/Portuguese-Brasil.json",
        select: {
            rows: {
                _: "",
                0: "",
                1: ""
            }
        },
        buttons: {
            colvis: 'Selecionar colunas'
        }

    };

    jsonOptions.fixedHeader = true;


    if( exportedButtons ){
        jsonOptions.dom = 'Bfrtip';

        if(!(typeof jsonOptions.buttons === 'undefined') ){
            customButtons = jsonOptions.buttons;
        }

        jsonOptions.buttons = [];

        var buttonsExports = {
            extend:'collection',
            text:'Exportar <span class="fa fa-share-square-o"/>',
            buttons:[]
        };


        buttonsExports.buttons.push(
            {
                extend:    'excelHtml5',
                text:      '<span class="text-center fa fa-file-excel-o fa-2x"/>',
                titleAttr: 'Excel',
                className: 'text-center'
            });
        buttonsExports.buttons.push(
            {
                extend:    'pdfHtml5',
                text:      '<span class="fa fa-file-pdf-o fa-2x"/>',
                titleAttr: 'PDF',
                download: 'open',
                className: 'text-center'
            });

        buttonsExports.buttons.push(
            {
                extend:    'print',
                text:      '<span class="text-center fa fa-print fa-2x"/>',
                titleAttr: 'Imprimir',
                className: 'text-center'
            });

        jsonOptions.buttons.push(buttonsExports);

        if(!(typeof customButtons === 'undefined') ){
            customButtons.forEach(function (button) {
                jsonOptions.buttons.push(button);
            } );
        }

    }

    return $(selector).DataTable( jsonOptions );
}


$(document).ready(function() {
    $(":input").inputmask();
    $("[type='checkbox']").bootstrapSwitch();
    $(".alert-dismissible").fadeTo(2000, 500).slideUp(500)
});


function previewFileLoad(input, selector) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $(selector).attr('src', e.target.result);
        };

        reader.readAsDataURL(input.files[0]);
    }
}