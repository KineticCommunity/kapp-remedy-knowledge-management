/**
 * Forms Search using Twitter Typeahead. Prefetch all accessible forms
 * for the Kapp.
**/
$(function(){
    if (!$('.navbar-form .typeahead').length){
        return;
    }
    var matcher = function(strs) {
        return function findMatches(query, callback) {
            var matches, substringRegex;
            matches = [];
            substrRegex = new RegExp(query, 'i');
            $.each(strs, function(i, str) {
                if (substrRegex.test(str)) {
                    matches.push(str);
                }
            });
            callback(matches);
        };
    };
    var formNames = [];
    var forms = {};
    $.get(window.bundle.apiLocation() + "/kapps/" + window.bundle.kappSlug() + "/forms", function( data ) {
        forms = data.forms;
        $.each(forms, function(i,val) {
            formNames.push(val.name);
            forms[val.name] = val;
        });
    });
    $('.navbar-form .typeahead').typeahead({
        highlight:true
    },{
        name: 'forms',
        source: matcher(formNames),
    }).bind('typeahead:select', function(ev, suggestion) {
        window.location.replace(window.bundle.kappLocation() + "/" + forms[suggestion].slug)
    });
});
