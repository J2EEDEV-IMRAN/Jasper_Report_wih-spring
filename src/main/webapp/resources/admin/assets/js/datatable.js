
        $(document).ready(function() {
            String.prototype.boolean = function() {
                return "true" == this || true==this;
            };

            var dt ={};
            function getBase64Image(src, width, height) {
                var img = new Image();
                img.src = src;
                var canvas = document.createElement("canvas");
                canvas.width = width || img.width;
                canvas.height = height || img.height;
                var ctx = canvas.getContext("2d");
                ctx.drawImage(img, 0, 0);
                return canvas.toDataURL("image/png");
            }

            $.fn.dataTable.ext.errMode = 'none';

            $.fn.dataTable.ext.buttons.reload = {
                text:'Refresh',
                action: function ( e, dt, node, config ) {
                    dt.ajax.reload();
                }
            };
            $.fn.dataTable.ext.buttons.resetColReorder = {
                text: 'Reset Column Ordering',
                action: function ( e, dt, node, config ) {
                    dt.colReorder.reset();
                    dt.draw();
                }
            };
			$(document).on("childPageReload",function () {
                //alert("Hi");


                $(document).find('.datatable').each(function (index, el) {
                        if ($.trim($(el).prop("id"))==""){
                            return false;
                        }
                        var $table = $(el);
                        var $buttons = [];
                        var buttons = $table.attr('buttons').split(',');

                        if (buttons.indexOf('colvis') >= 0) {
                            $buttons.push({
                                extend: 'colvis',
                                text: '',
                                className: 'btn btn-primary glyphicon glyphicon-list',
                                titleAttr: 'Click here to show/hide columns',
                            });
                        }

                        if (buttons.indexOf('selectAll') >= 0 || buttons.indexOf('selectNone') >= 0) {

                            var settingButtons = [];

                            if (buttons.indexOf('selectAll') >= 0) {
                                settingButtons.push({
                                    extend: 'selectAll',
                                    text: 'Selecte All',
                                    className: '',
                                    titleAttr: 'Click here to select all',
                                });
                            }


                            if (buttons.indexOf('selectNone') >= 0) {
                                settingButtons.push({
                                    extend: 'selectNone',
                                    text: 'Deselect All',
                                    className: '',
                                    titleAttr: 'Click here to deselect all',
                                });
                            }

                            $buttons.push({
                                extend: 'collection',
                                text: '',
                                className: 'btn btn-primary glyphicon glyphicon-ok-sign',
                                buttons: settingButtons,
                                titleAttr: '',
                            });
                        }


                        if (buttons.indexOf('copy') >= 0
                            || buttons.indexOf('csv') >= 0
                            || buttons.indexOf('excel') >= 0
                            || buttons.indexOf('pdf') >= 0
                        ) {
                            var exportButtons = [];


                            if (buttons.indexOf('copy') >= 0) {
                                exportButtons.push({
                                    extend: 'copy',
                                    className: '',
                                    text: 'Copy to Clipboard',
                                    title: $table.attr('data-title'),
                                    exportOptions: {
                                        format: {
                                            body: function (data, row, column, node) {
                                                if ($($dataTable.table().header()).find("th:eq(" + column + ")").attr('type') == 'index') {
                                                    return row + 1;
                                                } else if ($($dataTable.table().header()).find("th:eq(" + column + ")").attr('type') == 'picture') {
                                                    return ($($.parseHTML(data)).find('img').attr('src'));
                                                } else if ($($dataTable.table().header()).find("th:eq(" + column + ")").attr('type') == 'link') {
                                                    return $($.parseHTML(data)).find('a').html();
                                                }
                                                return data;
                                            }
                                        },
                                        columns: function (idx, data, node) {
                                            /* The visible column */
                                            var isVisible = $dataTable.column(idx).visible();
                                            /* Not export column */
                                            var isNotForExport = Boolean($(node).attr('data-notexport')) || false;
                                            /* export specific format only . default supports all format */
                                            var isExport = $(node).attr('data-export') || 'copy,csv,excel,pdf,print';
                                            var exportFormat = isExport.split(',');
                                            return isVisible && (exportFormat.indexOf('copy') >= 0) && !isNotForExport ? true : false;
                                        }
                                    },
                                    stripHtml: true,
                                });
                            }

                            if (buttons.indexOf('csv') >= 0) {
                                exportButtons.push({
                                    extend: 'csv',
                                    text: 'Export as CSV',
                                    title: $table.attr('data-title'),
                                    exportOptions: {
                                        format: {
                                            body: function (data, row, column, node) {
                                                if ($($dataTable.table().header()).find("th:eq(" + column + ")").attr('type') == 'index') {
                                                    return row + 1;
                                                } else if ($($dataTable.table().header()).find("th:eq(" + column + ")").attr('type') == 'picture') {
                                                    return getBase64Image($($.parseHTML(data)).find('img').attr('src'));
                                                } else if ($($dataTable.table().header()).find("th:eq(" + column + ")").attr('type') == 'link') {
                                                    return $($.parseHTML(data)).find('a').html();
                                                }
                                                return data;
                                            }
                                        },
                                        columns: function (idx, data, node) {
                                            /* The visible column */
                                            var isVisible = $dataTable.column(idx).visible();
                                            /* Not export column */
                                            var isNotForExport = Boolean($(node).attr('data-notexport')) || false;
                                            /* export specific format only . default supports all format */
                                            var isExport = $(node).attr('data-export') || 'copy,csv,excel,pdf,print';
                                            var exportFormat = isExport.split(',');
                                            return isVisible && (exportFormat.indexOf('csv') >= 0) && !isNotForExport ? true : false;
                                        }
                                    },
                                    stripHtml: true,
                                });
                            }

                            if (buttons.indexOf('excel') >= 0) {
                                exportButtons.push({
                                    extend: 'excel',
                                    text: 'Export as Excel',
                                    title: $table.attr('data-title'),
                                    exportOptions: {
                                        format: {
                                            body: function (data, row, column, node) {
                                                if ($($dataTable.table().header()).find("th:eq(" + column + ")").attr('type') == 'index') {
                                                    return row + 1;
                                                } else if ($($dataTable.table().header()).find("th:eq(" + column + ")").attr('type') == 'picture') {
                                                    return getBase64Image($($.parseHTML(data)).find('img').attr('src'));
                                                } else if ($($dataTable.table().header()).find("th:eq(" + column + ")").attr('type') == 'link') {
                                                    return $($.parseHTML(data)).find('a').html();
                                                }
                                                return data;
                                            }
                                        },
                                        columns: function (idx, data, node) {
                                            /* The visible column */
                                            var isVisible = $dataTable.column(idx).visible();
                                            /* Not export column */
                                            var isNotForExport = ($(node).attr('data-notexport') || 'false').boolean();
                                            /* export specific format only . default supports all format */
                                            var isExport = $(node).attr('data-export') || 'copy,csv,excel,pdf,print';
                                            var exportFormat = isExport.split(',');
                                            return isVisible && (exportFormat.indexOf('excel') >= 0) && !isNotForExport ? true : false;
                                        },
                                        stripHtml: false,
                                    }
                                });
                            }
                            if (buttons.indexOf('pdf') >= 0) {
                                exportButtons.push({
                                    extend: 'pdf',
                                    text: 'Export as pdf',
                                    title: $table.attr('data-title'),
                                    exportOptions: {
                                        format: {
                                            body: function (data, row, column, node) {
                                                if ($($dataTable.table().header()).find("th:eq(" + column + ")").attr('type') == 'index') {
                                                    return row + 1;
                                                } else if ($($dataTable.table().header()).find("th:eq(" + column + ")").attr('type') == 'picture') {
                                                    return getBase64Image($($.parseHTML(data)).find('img').attr('src'));
                                                }
                                                return data;
                                            }
                                        },
                                        columns: function (idx, data, node) {
                                            /* The visible column */
                                            var isVisible = $dataTable.column(idx).visible();
                                            /* Not export column */
                                            var isNotForExport = Boolean($(node).attr('data-notexport')) || false;
                                            /* export specific format only . default supports all format */
                                            var isExport = $(node).attr('data-export') || 'copy,csv,excel,pdf,print';
                                            var exportFormat = isExport.split(',');
                                            return isVisible && (exportFormat.indexOf('pdf') >= 0) && !isNotForExport ? true : false;
                                        },
                                        stripHtml: false
                                    },
                                    customize: function (doc) {

                                        for (var i = 1; i < doc.content[1].table.body.length; i++) {

                                            $($dataTable.table().header()).find("th[type=picture]").each(function (index, el) {
                                                var columnIndex = $(el).attr('data-column-index');
                                                console.log(columnIndex);
                                                var html = doc.content[1].table.body[i][columnIndex].text;
                                                var image = $($.parseHTML(html)).find('img').attr('src');
                                                var width = $($.parseHTML(html)).find('img').attr('pdf-width') || 30;
                                                var height = $($.parseHTML(html)).find('img').attr('pdf-height') || 20;
                                                delete doc.content[1].table.body[i][columnIndex].text;
                                                var base64image = getBase64Image(image, width, height);
                                                doc.content[1].table.body[i][columnIndex].image = base64image;
                                            });

                                            $($dataTable.table().header()).find("th[type=link]").each(function (index, el) {
                                                var columnIndex = $(el).attr('data-column-index');
                                                console.log(columnIndex);
                                                var html = doc.content[1].table.body[i][columnIndex].text;
                                                var link = $($.parseHTML(html)).attr('href');
                                                var text = $($.parseHTML(html)).html();
                                                delete doc.content[1].table.body[i][columnIndex].text;
                                                doc.content[1].table.body[i][columnIndex].text = text;
                                                doc.content[1].table.body[i][columnIndex].color = '#337ab7';
                                                doc.content[1].table.body[i][columnIndex].link = link;
                                            });
                                        }
                                    }
                                });
                            }
                            $buttons.push({
                                extend: 'collection',
                                text: '',
                                className: 'btn btn-primary glyphicon glyphicon-download-alt',
                                titleAttr: 'Click here to download data',
                                buttons: exportButtons,
                            });
                        }
                        if (buttons.indexOf('print') >= 0) {

                            $buttons.push({
                                extend: 'print',
                                text: '',
                                title: $table.attr('data-title'),
                                className: 'btn btn-primary glyphicon glyphicon-print',
                                titleAttr: 'Click here to print',
                                exportOptions: {
                                    format: {
                                        body: function (data, row, column, node) {
                                            return (typeof data == 'object') ? row + 1 : data;
                                        }
                                    },
                                    columns: function (idx, data, node) {
                                        /* The visible column */
                                        var isVisible = $dataTable.column(idx).visible();
                                        /* Not export column */
                                        var isNotForExport = Boolean($(node).attr('data-notexport')) || false;
                                        /* export specific format only . default supports all format */
                                        var isExport = $(node).attr('data-export') || 'copy,csv,excel,pdf,print';
                                        var exportFormat = isExport.split(',');
                                        return isVisible && (exportFormat.indexOf('print') >= 0) && !isNotForExport ? true : false;
                                    }
                                }
                            });
                        }

                        if (buttons.indexOf('resetColReorder') >= 0) {
                            $buttons.push({
                                extend: 'resetColReorder',
                                text: '',
                                className: 'btn btn-primary glyphicon glyphicon-repeat',
                                titleAttr: 'Click here to Reset Column Ordering',
                            });
                        }

                        if (buttons.indexOf('reload') >= 0) {
                            $buttons.push({
                                extend: 'reload',
                                text: '',
                                className: 'btn btn-primary glyphicon glyphicon-refresh',
                                titleAttr: 'Click here to reload data',
                            });
                        }
                        var $columns = [];
                        try {
                            var columns = $table.data('columns-sequence').split(',');
                        } catch (e) {
                            alert("datatable data-columns-sequence attribute is not set!");
                        }

                        $.each(columns, function (index, column_name) {
                            var columnObj = $table.find('thead th[name=\'' + column_name + '\']');
                            /* iterate through array or object */

                            var name = $(columnObj).attr('name') || '';
                            var data = $(columnObj).attr('value') || null;
                            var render = $(columnObj).attr('render') || '';
                            var visible = $(columnObj).attr('data-visible') || true;
                            var formatColumn = $(columnObj).attr('data-format') || false;

                            var column = new Object();
                            column.data = data;
                            column.visible = visible;

                            if (formatColumn){
                                column.format=formatColumn;
                            }
                            if (name != '') {
                                column.name = name;
                            }

                            if (render != '' && typeof eval(render) == 'function') {
                                column.render = eval(render);
                            } else if (render != '' && typeof eval(render) == 'object') {
                                column.render = JSON.parse(render);
                            }
                            if (name == 'index') {
                                column.render = function (data, type, full, meta) {
                                    return meta.row + 1;
                                }
                            }
                            if (name == 'action') {
                                column.render = function (data, type, full, meta) {
                                    //console.log(meta);
                                    var thead = $dataTable.table().header();
                                    //console.log(thead);
                                    var actionThead = $(thead).find("th[name=action]");
                                    //console.log(actionThead);
                                    var isEdit = (actionThead.attr('data-edit') || 'false').boolean();
                                    var isDelete = (actionThead.attr('data-delete') || 'false').boolean();
                                    var isView = (actionThead.attr('data-view') || 'false').boolean();

                                    var viewButtonClass = actionThead.attr('data-view-button-class') || '';
                                    var editButtonClass = actionThead.attr('data-edit-button-class') || '';
                                    var deleteButtonClass = actionThead.attr('data-delete-button-class') || '';

                                    var viewIconClass = actionThead.attr('data-view-icon-class') || 'glyphicon glyphicon-info-sign';
                                    var editIconClass = actionThead.attr('data-edit-icon-class') || 'glyphicon glyphicon-edit';
                                    var deleteIconClass = actionThead.attr('data-delete-icon-class') || 'glyphicon glyphicon-trash';

                                    var action = '';

                                    if (isView) {
                                        var view_url = actionThead.attr('data-view-url');
                                        view_url = view_url.replace(':id', data);
                                        action += '<a href="' + view_url + '" class="data-view-action ' + viewButtonClass + '" title="Click here to view details"><i class="' + viewIconClass + '"></i></a> ';
                                    }

                                    if (isEdit) {
                                        var edit_url = actionThead.attr('data-edit-url');
                                        edit_url = edit_url.replace(':id', data);
                                        action += '<a href="' + edit_url + '" class="data-edit-action ' + editButtonClass + '" title="Click here to edit this record"><i class="' + editIconClass + '"></i></a> ';
                                    }

                                    if (isDelete) {
                                        var delete_url = actionThead.attr('data-delete-url');
                                        delete_url = delete_url.replace(':id', data);
                                        action += '<a href="' + delete_url + '" class="data-delete-action ' + deleteButtonClass + '" title="Click here to delete this record"><i class="' + deleteIconClass + '"></i></a>';
                                    }

                                    return action;
                                }
                            }
                            $columns.push(column);

                        });

                        var $dataTable = $table.DataTable({
                            lengthMenu: JSON.parse($table.attr('data-lengthMenu')) || [[10, 25, 50, 100], [10, 25, 50, 100]],
                            colReorder: $table.attr('data-colReorder') || false,
                            fixedHeader: $table.attr('data-fixedHeader') || false,
                            stateSave: $table.attr('data-stateSave') || false,
                            buttons: $buttons,
                            columns: $columns,
                            processing: true,
                            serverSide: true,
                            "drawCallback": function (settings) {
                                var api = this.api();
                                console.log(api.rows({page: 'current'}).data());
                            },
                            ajax: {
                                url: $table.data('ajax-url'),
                                contentType: "application/json",
                                type: "POST",
                                data: function (d) {
                                    /**
                                     *
                                     * To add Custom Search Parameter
                                     *
                                     */

                                    $table.parent().find(".datafilter").each(function (index, el) {
                                        d[$(el).prop('name')] = $(el).val();
                                    });
                                    /**
                                     *
                                     * Now Return Json Stringified Data
                                     *
                                     */

                                    return JSON.stringify(d);
                                }
                            },

                        });

                        $dataTable.on('responsive-display responsive-resize order.dt search.dt column-reorder.dt page.dt draw', function () {
                            $dataTable.column('index:name', {
                                search: 'applied',
                                order: 'applied',
                                page: 'applied'
                            }).nodes().each(function (cell, i) {
                                console.log("DRAWN DT");
                                console.log("INDEX = " + i);
                                cell.innerHTML = parseInt(i) + 1;
                                //$dataTable.cell( cell );
                                //console.log($(cell));

                            });



                        }).draw();
                });


            })
            $(document).on('click',".data-delete-action", function(event) {
                /* Act on the event */
                event.preventDefault();
                /**
                 * This requires the bootboxjs javascript plugin to be loaded.
                 */
                var obj = $(this);
                bootbox.confirm({
                    message: "<h3 class='text-warning'>Are you sure you want to delete this record?</h3>",
                    buttons: {
                        confirm: {
                            label: 'Yes',
                            className: 'btn-success'
                        },
                        cancel: {
                            label: 'No',
                            className: 'btn-danger'
                        }
                    },
                    callback: function (result) {
                        if(result){
                            $('.datatable').myAjaxLoder();
                            var actionUrl = obj.attr('href');

                            $.ajax({
                                url: actionUrl,
                                type: 'GET',
                                dataType: 'json',
                            })
                                .done(function(result) {
                                    if(typeof result.success!='undefined'){
                                        bootbox.alert("<h3 class='text-success'>"+result.message+"</h3>");
                                        obj.parents("tr").remove();
                                    }else{
                                        bootbox.alert("<h3 class='text-danger'>"+result.message+"</h3>");
                                    }

                                })
                                .fail(function() {
                                    bootbox.alert("<h3 class='text-danger'>Sorry! Something goes wrong! Please try again after sometime.</h3>");
                                })
                                .always(function() {
                                    $('.datatable').removeMyAjaxLoder();
                                });

                        }
                    }
                });
            });

		} );
