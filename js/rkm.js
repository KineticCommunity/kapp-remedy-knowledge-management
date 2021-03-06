(function($, _) {
    /*----------------------------------------------------------------------------------------------
     * DOM MANIPULATION AND EVENT REGISTRATION
     *   This section is executed on page load to register events and otherwise manipulate the DOM.
     *--------------------------------------------------------------------------------------------*/
    $(function() {
    	// If URL contains query parameter, search by that parameter
    	if (!_.isEmpty(queryParameter)){
    	    var params = {
                "q": queryParameter
            };
            bundle.getSearchResults(params);
    	}
    	// If URL contains a hash, search by the hash value
    	else if ($(location).attr('hash')){
    	    var params = {
                "q": $(location).attr('hash').substr(1)
            };
    	    bundle.getSearchResults(params);
    	}

        // Set the focus to the search box
        $("form#rkm-search-form input").focus();

        // On submit of the search terms form we call the search.jsp which returns
        // a json result that represents the matching articles.  We use this json
        // result to generate an html table.  Each row in the table has a clicked
        // handler bound to it that retrieves the article (defined below).
        $("form#rkm-search-form").submit(function(e) {
       	    e.preventDefault();
            var searchInput = $(this).find('input');
            searchInput.blur();
            var params = {
                "q": searchInput.val()
            };
            bundle.getSearchResults(params);
            return false;
        });
    });

    /*----------------------------------------------------------------------------------------------
     * PACKAGE INIALIZATION
     *   This code is executed when the Javascript file is loaded
     *--------------------------------------------------------------------------------------------*/

    // Ensure the BUNDLE global object exists
    bundle = bundle || {};

    bundle.getSearchResults = function(parameters) {
        var params = parameters;
        params.returnType = "html";
        var searchInput = $('.rkm-search input');
        var searchMessage = $('.rkm-message');
        var searchError = $('.rkm-error');
        var searchResults = $('.rkm-results');
        if ($.trim(params.q)){
            $.ajax({
                type: 'get',
                url: bundle.kappLocation()+'?partial=search',
                data: params,
                dataType: "html",
                beforeSend: function(jqXHR, settings) {
                },
                success: function(data, textStatus, jqXHR) {
                    var count = searchResults.html(data).find('.rkm-count').data('rkm-count');
                    searchMessage.html(count + ' Result' + (count != 1 ? 's' : '')).css('display', 'table-cell');
                },
                error: function(jqXHR) {
                    searchMessage.html('<i class="fa fa-exclamation-triangle"></i> Error').css('display', 'table-cell');
                }
            });
        }
        else {
            searchError.text('Required').css('display', 'table-cell');
            searchInput.val('').one('keydown', function(event){
            searchError.empty().hide();
    	    });
        }
    }
})(jQuery, _);
