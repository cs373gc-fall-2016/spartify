/**
 * Created by brianb on 10/19/16.
 */
$(document).ready(function() {
    $("#contributors").DataTable({
        columnDefs: [ {
            targets: 4,
            render: $.fn.dataTable.render.ellipsis(65)
        } ],
        rowReorder: {
            selector: 'td:nth-child(2)'
        },
        responsive: true
    });
    $("#projects").DataTable({
        columnDefs: [ {
            targets: 4,
            render: $.fn.dataTable.render.ellipsis(65)
        } ],
        rowReorder: {
            selector: 'td:nth-child(2)'
        },
        responsive: true
    });
    $("#companies").DataTable({
        columnDefs: [ {
            targets: 4,
            render: $.fn.dataTable.render.ellipsis(65)
        } ],
        rowReorder: {
            selector: 'td:nth-child(2)'
        },
        responsive: true
    });
    $("#languages").DataTable({
        columnDefs: [ {
            targets: 4,
            render: $.fn.dataTable.render.ellipsis(65)
        } ],
        rowReorder: {
            selector: 'td:nth-child(2)'
        },
        responsive: true
    });
});

$.fn.dataTable.render.ellipsis = function ( cutoff ) {
    return function ( data, type, row ) {
        return type === 'display' && data.length > cutoff ?
        data.substr( 0, cutoff ) +'…' :
            data;
    }
};