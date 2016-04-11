// rkmSearch.js handles the returned articles and brings back detailed article descriptions when applicable.
(function($) {
    $(function() {
        // evaluates the number of RKM articles returned by a search query
        var rkmCount = $('div.rkm-count').data('rkm-count');
        $('div.rkm-message').text(rkmCount + "Result" + (rkmCount != "1" ? "s" : ""));
        // takes advantage of qtip display convention
        var qtipOptions = {
            content: { attr:'data-description' },
            style: { classes:'qtip-tipsy qtip-shadow', tip: { corner: true } },
            position: { my:'left center', at:'right middle' }
        };
        $('div.rkm-article-id i, div.rkm-article-date i').qtip(qtipOptions).qtip('api');
        // expands article to fetch any applicable details
        $('div.rkm-article-title').on('click', function(e){
            var article = $(this).closest('.rkm-article');
            var dataLoaded = article.data('rkm-article-loaded') ? true : false;
            article.find('div.rkm-article-text').stop(true, true).slideToggle(300);
            $(this).find('i').toggleClass('fa-plus-square fa-minus-square');
            // checks to see if rkm-article-loaded exists and then preforms an ajax call that fetches a partial that displays article detail
            if (!dataLoaded){
                article.data('rkm-article-loaded', true);
                var articleText = article.find('.rkm-article-text');
                var articleId = $(this).data('rkm-article-id');
                var requestId = $(this).data('request-id');
                var closeOnly = $('div#article-' + articleId).hasClass('selected-article');
                $('div.selected-article.show').empty().toggleClass('selected-article show');
                // calls partial display
                $.ajax({
                    url: bundle.kappLocation() + '?partial=articles/' + $(this).data('rkm-article-source'),
                    data: { articleId: articleId},
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
                        // var words = $(data)
                        // console.log(words);
                        articleText.append("<div id='"+requestId+"''><i class='use fa fa-square-o fa-lg'> <span>Was this helpful?</span></i></div>");
                        $("div#"+requestId).children("i.use").click(function(){
                            $.ajax({
                               url: bundle.kappLocation() + '?partial=articles/incrementRelevance',
                               data: {articleId: articleId},
                               success: function(data){
                                   $("div#"+requestId).children("i.use").remove();
                                   $("div#"+requestId).append("<i class='use fa fa-check-square fa-lg'> <span>Feedback Submitted</span></i>");
                               },
                               error: function(jqXHR){
                                   $("div#"+requestId).children("i.use").remove();
                                   $("div#"+requestId).append("<span style='color:red !important'>submission has failed</span>");
                               }
                           })
                       });
                    }
                });
            }
        })
    })
})(jQuery);
