/**
 * Created by brianb on 10/19/16.
 */
$(document).ready(function() {
    $("#contributors").DataTable({
        columnDefs: [ {
            targets: 4,
            render: $.fn.dataTable.render.ellipsis(65)
        } ]
    });
    $("#projects").DataTable({
        columnDefs: [ {
            targets: 4,
            render: $.fn.dataTable.render.ellipsis(65)
        } ]
    });
    $("#companies").DataTable({
        columnDefs: [ {
            targets: 4,
            render: $.fn.dataTable.render.ellipsis(65)
        } ]
    });
    $("#languages").DataTable({
        columnDefs: [ {
            targets: 4,
            render: $.fn.dataTable.render.ellipsis(65)
        } ]
    });
});

$.fn.dataTable.render.ellipsis = function ( cutoff ) {
    return function ( data, type, row ) {
        return type === 'display' && data.length > cutoff ?
        data.substr( 0, cutoff ) +'…' :
            data;
    }
};