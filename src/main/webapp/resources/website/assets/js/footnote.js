var pageHeight = 970; // our print page height - Safari 970, Firefox 977, Chrome 970
var pageWidth = 670; // our print page width - Safari 670, Firefox 705, Chrome 670
var footnoteHeight = 15;

// First pass - identify footnotes, mark locations and replace all the footnote text
var footnoteCount = 0;
var pageFooterOffsets = [];
var pageFooterText = [];
var all = $('#content').children();
all.wrapAll("<div id=\"pageWrapper\" style=\"width:"+pageWidth+"px; float:none;\" />");
$('.footnotes').each(function (ind, el) {
    var f = $(el);
    var domElem = f[0];
    var offset = f.offset();
    var myPos = offset.top;
    pageFooterOffsets[footnoteCount] = myPos;
    pageFooterText[footnoteCount] = "<tr class=\"footerEntry\"><td>" + (footnoteCount+1) + "</td><td>" + domElem.innerHTML + "</td></tr>";
    f.replaceWith("<sup class=\"footnote\">" + (footnoteCount+1) + "</sup>");
    footnoteCount++;
});

// Second pass - Insert the footnotes at page boundaries
var currentPage = 0;
var currentFootnote = 0;
var lastFootnoteInPage = 0;
var availHeight = pageHeight;
var div;
var domElem;
var offset;
if (footnoteCount > 0) {
    $('#pageWrapper').children('div,p').each(function (ind, el) {
        div = $(el);
        domElem = div[0];
        offset = div.offset();
        if (currentFootnote == footnoteCount)
            return; // All finished
        if (domElem.style.position != "" && domElem.style.position != "relative") {
            return; // We ignore a fixed / absolute positioned div for determining page breaks
        }
        currentPage = Math.ceil(offset.top / pageHeight);
        var pageStartPos = (currentPage - 1) * pageHeight;
        while (lastFootnoteInPage < footnoteCount && pageFooterOffsets[lastFootnoteInPage] <= Math.min(offset.top + div.height(),pageStartPos + availHeight)) {
            availHeight -= footnoteHeight;
            lastFootnoteInPage++;
        }
        if (div.height() < pageHeight && (offset.top + div.height() > pageStartPos + availHeight)) {
            // Create a page break (white space padding) and insert the footnotes

            while (lastFootnoteInPage > currentFootnote && pageFooterOffsets[lastFootnoteInPage - 1] > offset.top)
                lastFootnoteInPage--; // The paragraph containing the footnote will move.

            var breakSize = pageStartPos + pageHeight - offset.top;

            // Insert the current batch of footnotes.
            var footerHeight = (lastFootnoteInPage - currentFootnote) * footnoteHeight;
            var footerPadding = breakSize - footerHeight;
            var footer="<div style=\"height:"+footerHeight+"px; padding-top:"+footerPadding+"px; padding-bottom:10px;\"><table class=\"footer\">";
            while (currentFootnote < lastFootnoteInPage)
                footer += pageFooterText[currentFootnote++];
            footer += "</table></div>";
            div.before(footer);

            // Adjust the position of all remaining footnotes.
            for (i = currentFootnote; i < footnoteCount; i++)
                pageFooterOffsets[i] += breakSize;

            // set up for next page
            availHeight = pageHeight;
            lastFootnoteInPage = currentFootnote;
        }
    });

    // Insert the last batch of footnotes.

    if (currentFootnote < footnoteCount) {
        // Find the last child to append after
        div = $('#pageWrapper').children('div,p').eq(-1);
        offset = div.offset();
        currentPage = Math.ceil(offset.top / pageHeight);
        var pageStartPos = (currentPage - 1) * pageHeight;
        var footerHeight = (footnoteCount - currentFootnote) * footnoteHeight;
        var breakSize = pageStartPos + pageHeight - offset.top - div.height();
        var footerPadding = breakSize - footerHeight;
        var footer="<div style=\"height:"+footerHeight+"px; padding-top:"+footerPadding+"px; padding-bottom:10px;\"><table class=\"footer\">";
        while (currentFootnote < footnoteCount)
            footer += pageFooterText[currentFootnote++];
        footer += "</table></div>";
        $('body').append(footer);
        console.log("Appended html at document end: " + footer);
    }
}
all.unwrap();
