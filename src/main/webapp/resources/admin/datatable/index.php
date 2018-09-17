<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Data Table Example</title>
	<link rel="stylesheet" type="text/css" href="Bootstrap-3.3.6/css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="DataTables-1.10.12/css/dataTables.bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="AutoFill-2.1.2/css/autoFill.bootstrap.css"/>
	<link rel="stylesheet" type="text/css" href="Buttons-1.2.2/css/buttons.bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="ColReorder-1.3.2/css/colReorder.bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="FixedColumns-3.2.2/css/fixedColumns.bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="FixedHeader-3.1.2/css/fixedHeader.bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="KeyTable-2.1.3/css/keyTable.bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="Responsive-2.1.0/css/responsive.bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="RowReorder-1.1.2/css/rowReorder.bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="Scroller-1.4.2/css/scroller.bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="Select-1.2.0/css/select.bootstrap.min.css"/>
	<link rel="stylesheet" href="font-awesome-4.6.3/css/font-awesome.min.css">
</head>
<body>
	<div class="container well">
		
		<div class="row well">
			<table id="datatable3" class="datatable table table-striped table-bordered dt-responsive nowrap compact stripe"
				data-language="{&quot;url&quot;:&quot;./english.json&quot;}"
				data-title="This is test document"
				data-deferRender="true"
				data-stateSave="false"
				data-responsive="{&quot;details&quot;:false}"
				data-page-length="10"
				data-lengthMenu="[ [10, 20, 50, 100,-1], [10, 20, 50, 100, &quot;All&quot;] ]"
				data-order="[[ 2, &quot;asc&quot; ]]"
				data-info="true"
				data-ordering="true"
				data-paging="true"
				data-scrollY="&quot;200px&quot;"
				data-processing="true"
				data-searching="true"
				data-serverSide="true"
				data-ajax="{&quot;url&quot;:&quot;data.json&quot;,&quot;dataSrc&quot;:&quot;data&quot;}"
				data-dom="<'row toolbar'><'row'<'col-sm-3'l><'col-sm-5 text-center'B><'col-sm-4'f>><'row'<'col-sm-12'tr>><'row'<'col-sm-5'i><'col-sm-7'p>>"
				buttons="copy,csv,excel,pdf,print,reload,resetColReorder,colvis"
				data-fixedHeader="true"
				width="100%"
				data-columns-sequence="index,image,name,position,office,extn,start_date,salary,action"
				>
		        <thead>
		        	<tr>
		        		<th rowspan="2" data-column-index="0" name="index" value="" type="index" data-visible="false" data-priority="7" data-orderable="false" data-searchable="false">SL No</th>
		            	<th rowspan="2" data-column-index="1" name="image" value="image" data-priority="2"  type="picture" data-orderable="false" data-searchable="false" render="(function( data, type, full, meta) { return '<a href=\'\'><img src=\'http://localhost:3000/image.jpg\' pdf-width=\'30\' pdf-height=\'20\' width=\'50\' class=\'img\'height=\'40\'/></a>'})">Picture</th>
		                <th rowspan="2" data-column-index="2" name="name" value="name" data-priority="1">Name</th>
		                <th colspan="2">HR</th>
		                <th colspan="3">Contact</th>
		                <th rowspan="2" data-column-index="8" name="action" value="id" data-edit="true" data-delete="false" data-view="true" data-delete-url="delete/:id" data-edit-url="edit/:id" data-view-url="view/:id" data-view-button-class="btn btn-primary btn-sm" data-edit-button-class="btn btn-info btn-sm" data-delete-button-class="btn btn-danger btn-sm" data-view-icon-class="fa fa-info-circle" data-edit-icon-class="" data-delete-icon-class="fa fa-trash" data-notexport="true" data-orderable="false" data-searchable="false" data-priority="2">Action</th>
		        	</tr>
		            <tr>
		                <th name="position" data-column-index="3" value="position" data-priority="4">Position</th>
		                <th name="office" data-column-index="4" value="office" data-priority="5">Office</th>
		                <th name="extn" data-column-index="5" value="extn" data-priority="6">Extb</th>
		                <th name="start_date" data-column-index="6" value="start_date" >Start date</th>
		                <th name="salary" data-column-index="7" value="salary" render="(function ( data, type, full, meta ) {return 'BDT '+data;})" data-priority="3">Salary</th>
		            </tr>
		             
		        </thead>
		    </table>

	    </div>
		<div class="row well">
			<table id="datatable" class="datatable table table-striped table-bordered dt-responsive nowrap compact stripe"
				data-language="{&quot;url&quot;:&quot;./english.json&quot;}"
				data-title="This is test document"
				data-deferRender="true"
				data-stateSave="false"
				data-responsive="{&quot;details&quot;:false}"
				data-page-length="10"
				data-lengthMenu="[ [10, 20, 50, 100,-1], [10, 20, 50, 100, &quot;All&quot;] ]"
				data-order="[[ 2, &quot;asc&quot; ]]"
				data-info="true"
				data-ordering="true"
				data-paging="true"
				data-scrollY="&quot;200px&quot;"
				data-processing="true"
				data-searching="true"
				data-serverSide="true"
				data-ajax="{&quot;url&quot;:&quot;data.json&quot;,&quot;dataSrc&quot;:&quot;data&quot;}"
				data-dom="<'row toolbar'><'row'<'col-sm-3'l><'col-sm-5 text-center'B><'col-sm-4'f>><'row'<'col-sm-12'tr>><'row'<'col-sm-5'i><'col-sm-7'p>>"
				buttons="copy,csv,excel,pdf,print,reload,resetColReorder,colvis"
				data-fixedHeader="true"
				data-colReorder="true"
				width="100%"
				data-columns-sequence="index,image,name,position,office,extn,start_date,salary,action"
				>
		        <thead>
		        	<tr>
		        		<th name="index" value="" type="index" data-visible="false" data-priority="7" data-orderable="false" data-searchable="false">SL No</th>
		            	<th name="image" value="image" data-export="pdf,print" data-priority="2"  type="picture" data-orderable="false" data-searchable="false" render="(function( data, type, full, meta) { return '<a href=\'\'><img src=\'http://localhost:3000/image.jpg\' pdf-width=\'30\' pdf-height=\'20\' width=\'50\' class=\'img\'height=\'40\'/></a>'})">Picture</th>
		                <th name="name" value="name" data-priority="1">Name</th>
		                <th name="position" value="position" data-priority="4" render="(function(data,type,full,meta){ return '<a href=\'http://localhost:3000/pdf\'>'+data+'</a>';})" type="link">Position</th>
		                <th name="office" value="office" data-priority="5">Office</th>
		                <th name="extn" value="extn" data-priority="6">Extb</th>
		                <th name="start_date" value="start_date" >Start date</th>
		                <th name="salary" value="salary" render="(function ( data, type, full, meta ) {return 'BDT '+data;})" data-priority="3">Salary</th>
		            	<th name="action" value="id" data-edit="true" data-delete="false" data-view="true" data-delete-url="delete/:id" data-edit-url="edit/:id" data-view-url="view/:id" data-view-button-class="btn btn-primary btn-sm" data-edit-button-class="btn btn-info btn-sm" data-delete-button-class="btn btn-danger btn-sm" data-view-icon-class="fa fa-info-circle" data-edit-icon-class="" data-delete-icon-class="fa fa-trash" data-notexport="true" data-orderable="false" data-searchable="false" data-priority="2">Action</th>
		            </tr>
		             
		        </thead>
		    </table>

	    </div>
    </div>
	<script type="text/javascript" src="jQuery-2.2.3/jquery-2.2.3.min.js"></script>
	<script type="text/javascript" src="Bootstrap-3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="JSZip-2.5.0/jszip.min.js"></script>
	<script type="text/javascript" src="pdfmake-0.1.18/build/pdfmake.min.js"></script>
	<script type="text/javascript" src="pdfmake-0.1.18/build/vfs_fonts.js"></script>
	<script type="text/javascript" src="DataTables-1.10.12/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="DataTables-1.10.12/js/dataTables.bootstrap.min.js"></script>
	<script type="text/javascript" src="AutoFill-2.1.2/js/dataTables.autoFill.min.js"></script>
	<script type="text/javascript" src="AutoFill-2.1.2/js/autoFill.bootstrap.min.js"></script>
	<script type="text/javascript" src="Buttons-1.2.2/js/dataTables.buttons.min.js"></script>
	<script type="text/javascript" src="Buttons-1.2.2/js/buttons.bootstrap.min.js"></script>
	<script type="text/javascript" src="Buttons-1.2.2/js/buttons.colVis.min.js"></script>
	<script type="text/javascript" src="Buttons-1.2.2/js/buttons.flash.min.js"></script>
	<script type="text/javascript" src="Buttons-1.2.2/js/buttons.html5.min.js"></script>
	<script type="text/javascript" src="Buttons-1.2.2/js/buttons.print.min.js"></script>
	<script type="text/javascript" src="ColReorder-1.3.2/js/dataTables.colReorder.min.js"></script>
	<script type="text/javascript" src="FixedColumns-3.2.2/js/dataTables.fixedColumns.min.js"></script>
	<script type="text/javascript" src="FixedHeader-3.1.2/js/dataTables.fixedHeader.min.js"></script>
	<script type="text/javascript" src="KeyTable-2.1.3/js/dataTables.keyTable.min.js"></script>
	<script type="text/javascript" src="Responsive-2.1.0/js/dataTables.responsive.min.js"></script>
	<script type="text/javascript" src="Responsive-2.1.0/js/responsive.bootstrap.min.js"></script>
	<script type="text/javascript" src="RowReorder-1.1.2/js/dataTables.rowReorder.min.js"></script>
	<script type="text/javascript" src="Scroller-1.4.2/js/dataTables.scroller.min.js"></script>
	<script type="text/javascript" src="Select-1.2.0/js/dataTables.select.min.js"></script>
	<script type="text/javascript">
	    $(document).ready(function() {
	    	String.prototype.boolean = function() {
			    return "true" == this || true==this; 
			};


			function getBase64Image(src,width=false,height=false) {
			    var img = new Image();
			    img.src = src;
			    var canvas = document.createElement("canvas");
			    canvas.width = width || img.width;
			    canvas.height = height || img.height;
			    var ctx = canvas.getContext("2d");
			    ctx.drawImage(img, 0, 0);
			    return canvas.toDataURL("image/png");
			}

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

	    	$(document).find('.datatable').each(function(index, el) {
	    		var $table = $(el);
				var $buttons = [];
	            var buttons = $table.attr('buttons').split(',');

	            if(buttons.indexOf('colvis')>=0){
	            	$buttons.push({
			            	extend:'colvis',
			            	text:'',
			            	className:'btn btn-primary glyphicon glyphicon-list',
			            	titleAttr: 'Click here to show/hide columns',
			            });
	            }

	            if ( buttons.indexOf('selectAll')>=0 || buttons.indexOf('selectNone')>=0 ) {

	            	var settingButtons = [];
	            	
	            	if(buttons.indexOf('selectAll')>=0){
	            		settingButtons.push({
			            	extend:'selectAll',
			            	text:'Selecte All',
			            	className:'',
			            	titleAttr: 'Click here to select all',
			            });
	            	}

	            	

	            	if(buttons.indexOf('selectNone')>=0){
	            		settingButtons.push({
			            	extend:'selectNone',
			            	text:'Deselect All',
			            	className:'',
			            	titleAttr: 'Click here to deselect all',
			            });
	            	}

	            	$buttons.push({
			    	 		extend:'collection',
			    	 		text:'',
			    	 		className:'btn btn-primary glyphicon glyphicon-ok-sign',
			    	 		buttons:settingButtons,
			    	 		titleAttr: '',
	            	});
	            }


	            if ( buttons.indexOf('copy')>=0
	            	|| buttons.indexOf('csv')>=0
	            	|| buttons.indexOf('excel')>=0
	            	|| buttons.indexOf('pdf')>=0
	            	) {
	            	var exportButtons = [];
	            	

	            	if(buttons.indexOf('copy')>=0){
	            		exportButtons.push({
			                extend: 'copy',
			                className:'',
			                text:'Copy to Clipboard',
			                title:$table.attr('data-title'),
			                exportOptions: {
			                	format: {
					                body: function ( data, row,column, node ) {
					                    if($($dataTable.table().header()).find("th:eq("+column+")").attr('type')=='index'){
					                   		return row+1;
					                    }else if ($($dataTable.table().header()).find("th:eq("+column+")").attr('type')=='picture') {
					                   		return ($($.parseHTML(data)).find('img').attr('src'));
					                    }else if($($dataTable.table().header()).find("th:eq("+column+")").attr('type')=='link'){
					                    	return $($.parseHTML(data)).find('a').html();
					                    }
					                    return data;
					                }
					            },
			                    columns: function ( idx, data, node ) {
			                    	/* The visible column */
						        	var isVisible = $dataTable.column( idx ).visible();
						        	/* Not export column */
						        	var isNotForExport = Boolean($(node).attr('data-notexport')) || false;
						        	/* export specific format only . default supports all format */
						        	var isExport       = $(node).attr('data-export') || 'copy,csv,excel,pdf,print';
					        		var exportFormat   = isExport.split(',');
						        	return isVisible && (exportFormat.indexOf('copy') >=0) && !isNotForExport ? true : false; 
						        }
			                },
			                stripHtml: true,
					     });
	            	}

	            	if(buttons.indexOf('csv')>=0){
	            		exportButtons.push({
			                extend: 'csv',
			                text:'Export as CSV',
			                title:$table.attr('data-title'),
			                exportOptions: {
			                	format: {
					                body: function ( data, row,column, node ) {
					                    if($($dataTable.table().header()).find("th:eq("+column+")").attr('type')=='index'){
					                   		return row+1;
					                    }else if ($($dataTable.table().header()).find("th:eq("+column+")").attr('type')=='picture') {
					                   		return getBase64Image($($.parseHTML(data)).find('img').attr('src'));
					                    }else if($($dataTable.table().header()).find("th:eq("+column+")").attr('type')=='link'){
					                    	return $($.parseHTML(data)).find('a').html();
					                    }
					                    return data;
					                }
					            },
			                    columns: function ( idx, data, node ) {
						            /* The visible column */
						        	var isVisible = $dataTable.column( idx ).visible();
						        	/* Not export column */
						        	var isNotForExport = Boolean($(node).attr('data-notexport')) || false;
						        	/* export specific format only . default supports all format */
						        	var isExport       = $(node).attr('data-export') || 'copy,csv,excel,pdf,print';
					        		var exportFormat   = isExport.split(',');
						        	return isVisible && (exportFormat.indexOf('csv') >=0) && !isNotForExport ? true : false; 
						        }
			                },
			                stripHtml: true,
			            });
	            	}

	            	if(buttons.indexOf('excel')>=0){
	            		exportButtons.push({
			                extend: 'excel',
			                text:'Export as Excel',
			                title:$table.attr('data-title'),
			                exportOptions: {
			                	format: {
					                body: function ( data, row,column, node ) {
					                    if($($dataTable.table().header()).find("th:eq("+column+")").attr('type')=='index'){
					                   		return row+1;
					                    }else if ($($dataTable.table().header()).find("th:eq("+column+")").attr('type')=='picture') {
					                   		return getBase64Image($($.parseHTML(data)).find('img').attr('src'));
					                    }else if($($dataTable.table().header()).find("th:eq("+column+")").attr('type')=='link'){
					                    	return $($.parseHTML(data)).find('a').html();
					                    }
					                   return data;
					                }
					            },
			                    columns: function ( idx, data, node ) {
						            /* The visible column */
						        	var isVisible = $dataTable.column( idx ).visible();
						        	/* Not export column */
						        	var isNotForExport = ($(node).attr('data-notexport') || 'false').boolean();
						        	/* export specific format only . default supports all format */
						        	var isExport       = $(node).attr('data-export') || 'copy,csv,excel,pdf,print';
					        		var exportFormat   = isExport.split(',');
						        	return isVisible && (exportFormat.indexOf('excel') >=0) && !isNotForExport ? true : false; 
						        },
						        stripHtml: false,
			                }
			            });
	            	}
	            	if(buttons.indexOf('pdf')>=0){
	            		exportButtons.push({
			                extend: 'pdf',
			                text:'Export as pdf',
			                title:$table.attr('data-title'),
			                exportOptions: {
			                	format: {
					                body: function ( data, row,column, node ) {
					                    if($($dataTable.table().header()).find("th:eq("+column+")").attr('type')=='index'){
					                   		return row+1;
					                    }else if ($($dataTable.table().header()).find("th:eq("+column+")").attr('type')=='picture') {
					                   		return getBase64Image($($.parseHTML(data)).find('img').attr('src'));
					                    }
					                    return data;
					                }
					            },
			                    columns: function ( idx, data, node ) {
						            /* The visible column */
						        	var isVisible = $dataTable.column( idx ).visible();
						        	/* Not export column */
						        	var isNotForExport = Boolean($(node).attr('data-notexport')) || false;
						        	/* export specific format only . default supports all format */
						        	var isExport       = $(node).attr('data-export') || 'copy,csv,excel,pdf,print';
					        		var exportFormat   = isExport.split(',');
						        	return isVisible && (exportFormat.indexOf('pdf') >=0) && !isNotForExport ? true : false; 
						        },
			                    stripHtml: false
			                },
			                customize: function(doc) {
			                	
						        for (var i=1;i<doc.content[1].table.body.length;i++) {
						        	
					        		$($dataTable.table().header()).find("th[type=picture]").each(function(index, el) {
						        		var columnIndex = $(el).attr('data-column-index');
						        		console.log(columnIndex);
						        		var html        = doc.content[1].table.body[i][columnIndex].text;
						        		var image  = $($.parseHTML(html)).find('img').attr('src');
						        		var width  = $($.parseHTML(html)).find('img').attr('pdf-width') || 30;
						        		var height = $($.parseHTML(html)).find('img').attr('pdf-height') || 20;
				                        delete doc.content[1].table.body[i][columnIndex].text;
				                        var base64image = getBase64Image(image,width,height);
				                        doc.content[1].table.body[i][columnIndex].image = base64image;
						        	});
					        
					        		$($dataTable.table().header()).find("th[type=link]").each(function(index, el) {
						        		var columnIndex = $(el).attr('data-column-index');
						        		console.log(columnIndex);
						        		var html        = doc.content[1].table.body[i][columnIndex].text;
						        		var link  = $($.parseHTML(html)).attr('href');
						        		var text  = $($.parseHTML(html)).html();
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
				            className:'btn btn-primary glyphicon glyphicon-download-alt',
				            titleAttr: 'Click here to download data',
			    	 		buttons:exportButtons,
	            	});
	            }	
	            if(buttons.indexOf('print')>=0){

	            	$buttons.push({
		            	extend:'print',
		            	text:'',
		            	title:$table.attr('data-title'),
		            	className:'btn btn-primary glyphicon glyphicon-print',
		            	titleAttr: 'Click here to print',
		            	exportOptions: {
		            		format: {
				                body: function ( data, row,column, node ) {
				                   return (typeof data =='object')? row+1:data;
				                }
				            },
		                    columns: function ( idx, data, node ) {
							    /* The visible column */
					        	var isVisible = $dataTable.column( idx ).visible();
					        	/* Not export column */
					        	var isNotForExport = Boolean($(node).attr('data-notexport')) || false;
					        	/* export specific format only . default supports all format */
					        	var isExport       = $(node).attr('data-export') || 'copy,csv,excel,pdf,print';
				        		var exportFormat   = isExport.split(',');
					        	return isVisible && (exportFormat.indexOf('print') >=0) && !isNotForExport ? true : false; 
							}
		                }
		            });
	            }

	            if(buttons.indexOf('resetColReorder')>=0){
	        		$buttons.push({
		            	extend:'resetColReorder',
		            	text:'',
		            	className:'btn btn-primary glyphicon glyphicon-repeat',
		            	titleAttr: 'Click here to Reset Column Ordering',
		            });
	        	}

	            if(buttons.indexOf('reload')>=0){
	            	$buttons.push({
		            	extend: 'reload',
		            	text: '',
		            	className:'btn btn-primary glyphicon glyphicon-refresh',
		            	titleAttr: 'Click here to reload data',
		        	});
	            }    	
	            var $columns = [];
	            var columns = $table.attr('data-columns-sequence').split(',');
	            $.each(columns, function(index, column_name) {
	            	var column  = $table.find('thead th[name='+column_name+']');
	            	 /* iterate through array or object */

	            	 var name    = $(column).attr('name') || '';
	            	 var data    = $(column).attr('value') || null;
	            	 var render  = $(column).attr('render') || '';
	            	 var visible = $(column).attr('data-visible') || true;
	            	 var column  = new Object();
	            	 column.data = data;
	            	 column.visible = visible;

	            	 if(name!=''){
	            	 	column.name = name;
	            	 }

	            	 if(render!='' && typeof eval(render)=='function'){
	            	 	column.render = eval(render);
	            	 }else if (render!='' && typeof eval(render)=='object') {
	            	 	column.render = JSON.parse(render);
	            	 }
	            	 if(name=='action'){
	            	 	column.render = function( data, type, full, meta) {
	            	 		//console.log(meta);
	            	 		var thead       = $dataTable.table().header();
	            	 		console.log(thead);
	            	 		var actionThead = $(thead).find("th[name=action]");
	            	 		console.log(actionThead);
	            	 	    var isEdit      = (actionThead.attr('data-edit') || 'false').boolean();
	            	 	    var isDelete    = (actionThead.attr('data-delete') || 'false').boolean();
	            	 	    var isView      = (actionThead.attr('data-view') || 'false').boolean();

	            	 	    var viewButtonClass   = actionThead.attr('data-view-button-class') || '';
	            	 	    var editButtonClass   = actionThead.attr('data-edit-button-class') || '';
	            	 	    var deleteButtonClass = actionThead.attr('data-delete-button-class') || '';

	            	 	    var viewIconClass     = actionThead.attr('data-view-icon-class') || 'glyphicon glyphicon-info-sign';
	            	 	    var editIconClass     = actionThead.attr('data-edit-icon-class') || 'glyphicon glyphicon-edit';
	            	 	    var deleteIconClass   = actionThead.attr('data-delete-icon-class') || 'glyphicon glyphicon-trash';

	            	 	    var action = '';

	            	 	    if(isView){
	            	 	    	var view_url = actionThead.attr('data-view-url');
	            	 	    	view_url     = view_url.replace(':id',data);
	            	 	    	action      += '<a href="'+view_url+'" class="data-view-action '+viewButtonClass+'" title="Click here to view details"><i class="'+viewIconClass+'"></i></a> ';
	            	 	    }

	            	 	    if(isEdit){
	            	 	    	var edit_url = actionThead.attr('data-edit-url');
	            	 	    	edit_url = edit_url.replace(':id',data);
	            	 	    	action += '<a href="'+edit_url+'" class="data-edit-action '+editButtonClass+'" title="Click here to edit this record"><i class="'+editIconClass+'"></i></a> ';
	            	 	    }

	            	 	    if(isDelete){
	            	 	    	var delete_url = actionThead.attr('data-delete-url');
	            	 	    	delete_url = delete_url.replace(':id',data);
	            	 	    	action += '<a href="'+delete_url+'" class="data-delete-action '+deleteButtonClass+'" title="Click here to delete this record"><i class="'+deleteIconClass+'"></i></a>';
	            	 	    }

	            	 		return action;
	            	 	}
	            	 }
	            	 $columns.push(column);

	            });

			    var $dataTable = $table.DataTable({
			    	lengthMenu: JSON.parse($table.attr('data-lengthMenu')) || [[10, 25, 50,100], [10, 25, 50, 100]],
			    	colReorder:$table.attr('data-colReorder') || false,
			    	fixedHeader:$table.attr('data-fixedHeader') || false,
			    	stateSave:$table.attr('data-stateSave') || false,
			    	buttons: $buttons,
			    	columns:$columns,
			    });

			    $dataTable.on( 'responsive-display responsive-resize order.dt search.dt column-reorder.dt', function () {
	        		$dataTable.column('index:name', {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
	            		cell.innerHTML = i+1;
	            		//$dataTable.cell( cell );
	            		
	        		} );
	    		} ).draw();
	    	});
		} );
	</script>
</body>
</html>