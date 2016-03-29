$(function() {
    var rkmCount = $('div.rkm-count').data('rkm-count');
    $('div.rkm-message').text(rkmCount + "Result" + (rkmCount != "1" ? "s" : ""));
    // <c:out value="${showCount ? "$('div.rkm-message-container').hide();" : ""}"/>
    var qtipOptions = {
        content: { attr:'data-description' },
        style: { classes:'qtip-tipsy qtip-shadow', tip: { corner: true } },
        position: { my:'left center', at:'right middle' }
    };
    $('div.rkm-article-id i, div.rkm-article-date i').qtip(qtipOptions).qtip('api');
    $('div.rkm-article-title').on('click', function(e){
        var article = $(this).closest('.rkm-article');
        var dataLoaded = article.data('rkm-article-loaded') ? true : false;
        article.find('div.rkm-article-text').stop(true, true).slideToggle(300);
        $(this).find('i').toggleClass('fa-plus-square fa-minus-square');
        if (!dataLoaded){
            article.data('rkm-article-loaded', true);
            var articleText = article.find('.rkm-article-text');
            var articleId = $(this).data('rkm-article-id');
            var closeOnly = $('div#article-' + articleId).hasClass('selected-article');
            $('div.selected-article.show').empty().toggleClass('selected-article show');
            // calls partial display
            $.ajax({
                url: bundle.kappLocation() + '?partial=articles/' + $(this).data('rkm-article-source'),
                data: { articleId: $(this).data('rkm-article-id')},
                success: function(data) {
                    // Article Data
                    articleText.html(data);

                    // Images through Kinetic
                    articleText.find("img").each(function(){
                        var arattid, arentryid, arschema;
                        arattid = $(this).attr("arattid");
                        if ($(this).attr("arschema") && $(this).attr("arschema").length > 0){
                            arschema = $(this).attr("arschema");
                        }
                        if ($(this).attr("arentryid") && $(this).attr("arentryid").length > 0){
                            arentryid = $(this).attr("arentryid");
                        }
                        $(this).attr("src", bundle.kappLocation() + "?filestore=ars&form=" + arschema + "&entry=" + arentryid + "&field=" + arattid);
                    });

                    // Document attachments through Kinetic
                    articleText.find("a[path*='sharedresources']").each(function(){
                        var path = $(this).attr('path').replace(/\?(.*)/,"");
                        var urlParsed = path.split("/");
                        $(this).attr("href", "DownloadAttachment/" + urlParsed[2] + "/" + urlParsed[3] + "/" + urlParsed[4]);
                    });

                    // Keywords
                    var strKeywords = articleText.find('.article .field .value.keywords').text();
                    var keywords = strKeywords.replace(/[\n\r]/g,"").split(" ");
                    articleText.find('.article .field .value.keywords').empty();
                    $.each(keywords, function(index,val){
                        if(val != ""){
                            articleText.find('.article .field .value.keywords').append('<span>'+val+'</span>');
                        }
                    });
                }
            });
        }
    })
});
