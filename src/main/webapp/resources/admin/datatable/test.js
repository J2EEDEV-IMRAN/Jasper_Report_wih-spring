 $buttons = [
		    	 	{
		            	extend:'colvis',
		            	text:'',
		            	className:'glyphicon glyphicon-list',
		            	titleAttr: 'Click here to show/hide columns',
		            },
		    	 	{
		    	 		extend:'collection',
		    	 		text:'',
		    	 		className:'glyphicon glyphicon-ok-sign',
		    	 		buttons:[
		    	 			{
		    	 				extend:'selectAll',
		    	 			},
		    	 			{
		    	 				extend:'selectNone',
		    	 			},
		    	 			{
		    	 				extend:'resetColReorder',
		    	 			},
		    	 		],
		    	 		titleAttr: 'Click here to select/deselect rows',
		    	 	},
		            {
			            extend: 'collection',
			            text: '',
			            className:'glyphicon glyphicon-download-alt',
			            titleAttr: 'Click here to download data',
			            buttons: [
			            	{
				                extend: 'copy',
				                text:'Copy to Clipboard',
				                exportOptions: {
				                	format: {
						                body: function ( data, row,column, node ) {
						                   return (typeof data.index !='undefined')? row+1:data;
						                }
						            },
				                    columns: function ( idx, data, node ) {
							          var isVisible = $dataTable.column( idx ).visible();
							          var isNotForExport = Boolean($(node).attr('data-notexport')) || false;
							          //var isNotForExport = $dataTable.settings().init().columns[idx].name=='action';
							          return isVisible && !isNotForExport ? true : false; 
							        }
				                }
				            },
				           
				            {
				                extend: 'csv',
				                text:'Export as CSV',
				                exportOptions: {
				                	format: {
						                body: function ( data, row,column, node ) {
						                   return (typeof data.index !='undefined')? row+1:data;
						                }
						            },
				                    columns: function ( idx, data, node ) {
							          var isVisible = $dataTable.column( idx ).visible();
							          var isNotForExport = Boolean($(node).attr('data-notexport')) || false;
							          //var isNotForExport = $dataTable.settings().init().columns[idx].name=='action';
							          return isVisible && !isNotForExport ? true : false; 
							        }
				                }
				            },
				            {
				                extend: 'excel',
				                text:'Export as Excel',
				                exportOptions: {
				                	format: {
						                body: function ( data, row,column, node ) {
						                   return (typeof data.index !='undefined')? row+1:data;
						                }
						            },
				                    columns: function ( idx, data, node ) {
							          var isVisible = $dataTable.column( idx ).visible();
							          var isNotForExport = Boolean($(node).attr('data-notexport')) || false;
							          //var isNotForExport = $dataTable.settings().init().columns[idx].name=='action';
							          return isVisible && !isNotForExport ? true : false; 
							        }
				                }
				            },
				            {
				                extend: 'pdf',
				                text:'Export as pdf',
				                exportOptions: {
				                	format: {
						                body: function ( data, row,column, node ) {
						                   return (typeof data.index !='undefined')? row+1:data;
						                }
						            },
				                    columns: function ( idx, data, node ) {
							          var isVisible = $dataTable.column( idx ).visible();
							          var isNotForExport = Boolean($(node).attr('data-notexport')) || false;
							          //var isNotForExport = $dataTable.settings().init().columns[idx].name=='action';
							          return isVisible && !isNotForExport ? true : false; 
							        },
				                    stripHtml: false
				                }
				            },
			            ]
			        },

		            {
		            	extend:'print',
		            	text:'',
		            	className:'glyphicon glyphicon-print',
		            	titleAttr: 'Click here to print',
		            	exportOptions: {
		            		format: {
				                body: function ( data, row,column, node ) {
				                   return (typeof data.index !='undefined')? row+1:data;
				                }
				            },
		                    columns: function ( idx, data, node ) {
							    var isVisible = $dataTable.column( idx ).visible();
							    var isNotForExport = Boolean($(node).attr('data-notexport')) || false;
							    //var isNotForExport = $dataTable.settings().init().columns[idx].name=='action';
							    return isVisible && !isNotForExport ? true : false; 
							}
		                }
		            },
		            
		            {
		            	extend: 'reload',
		            	text: '',
		            	className:'glyphicon glyphicon-refresh',
		            	titleAttr: 'Click here to reload data',
		        	}
		    ];

		    data-columns="[
			{ &quot;data&quot;: null, &quot;name&quot;: &quot;index&quot;},
            { &quot;data&quot;: &quot;name&quot;,&quot;name&quot;: &quot;name&quot; },
            { &quot;data&quot;: &quot;position&quot;,&quot;name&quot;: &quot;position&quot;},
            { &quot;data&quot;: &quot;office&quot;,&quot;name&quot;: &quot;office&quot; },
            { &quot;data&quot;: &quot;extn&quot;,&quot;name&quot;: &quot;extn&quot; },
            { &quot;data&quot;: &quot;start_date&quot;,&quot;name&quot;: &quot;start_date&quot; },
            { &quot;data&quot;: &quot;salary&quot;,&quot;name&quot;: &quot;salary&quot; },
            { &quot;data&quot;: &quot;index&quot;,&quot;name&quot;: &quot;action&quot; }
        ]"