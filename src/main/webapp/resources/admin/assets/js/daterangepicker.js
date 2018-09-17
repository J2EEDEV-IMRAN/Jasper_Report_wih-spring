var start = moment().subtract(29, 'days');
var end = moment();
$(document).find(".range_picker").each(function(index, el) {
    var callback = function cb(start, end) {
        $(el).find("input")[0].val(start);
        $(el).find("input")[1].val(end);
                                    //$('.range span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
    };

    $(el).daterangepicker({
        "showDropdowns": true,
        "autoApply": true,
        "dateLimit": {
            "days": 365
        },
        "ranges": {
               'Today': [moment(), moment()],
               'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
               'Last 7 Days': [moment().subtract(6, 'days'), moment()],
               'Last 15 Days': [moment().subtract(14, 'days'), moment()],
               'Last 30 Days': [moment().subtract(29, 'days'), moment()],
               'Last 60 Days': [moment().subtract(59, 'days'), moment()],
               'Last 90 Days': [moment().subtract(89, 'days'), moment()],
               'Last 180 Days': [moment().subtract(180, 'days'), moment()],
               'Last 365 Days': [moment().subtract(364, 'days'), moment()],
               'This Month': [moment().startOf('month'), moment().endOf('month')],
               'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
        },
        "locale": {
            "format": "DD/MM/YYYY",
            "separator": " - ",
            "applyLabel": "Apply",
            "cancelLabel": "Cancel",
            "fromLabel": "From",
            "toLabel": "To",
            "customRangeLabel": "Custom",
            "weekLabel": "W",
            "daysOfWeek": [
                "Su",
                "Mo",
                "Tu",
                "We",
                "Th",
                "Fr",
                "Sa"
            ],
            "monthNames": [
                "January",
                "February",
                "March",
                "April",
                "May",
                "June",
                "July",
                "August",
                "September",
                "October",
                "November",
                "December"
            ],
            "firstDay": 1
        },
        "alwaysShowCalendars": true,
        "startDate": start,
        "endDate": end
    },callback);

    callback(start, end);
});

                                
