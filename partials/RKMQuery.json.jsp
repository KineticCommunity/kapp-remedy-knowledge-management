<%-- Include the package initialization file. --%>
<%--
    RKMQuery.json.jsp - searches RKM
    Parameters:
        q: The search term(s) *Required*
        returnType: [html/json] Do you want HTML of JSON returned (Default=json) *Optional*
        count: [true/false] If returning HTML, do you want count div to be visible (Default=false) *Optional*
 --%>
 <%@page pageEncoding="UTF-8" contentType="application/json" trimDirectiveWhitespaces="true"%>
 <%@include file="../bundle/initialization.jspf" %>
     <%-- Set the page content type, ensuring that UTF-8 is used --%>
     <%-- establishes a catch condition in the event the enclosed code fails --%>
        <c:catch var ="e">
            <%-- Retrieve the search terms from the request parameters. --%>
            <c:set var="mustHave" value="${param.q}"/>
            <c:set var="mayHave" value=""/>
            <c:set var="mustNotHave" value=""/>

            <%-- Is search term passed in --%>
            <c:set var="validRequest" value="${param.q != null && param.q.length() > 0}"/>
            <%-- Should we return formatted HTML --%>
            <c:set var="returnHTML" value="${param.returnType != null && param.returnType.equalsIgnoreCase("html")}"/>
            <%-- Should we show the count --%>
            <c:set var="showCount" value="${param.count != null && param.count.equalsIgnoreCase("true")}"/>
            <%-- Perform the multi form search and write the result to the out stream. --%>
            <c:set var="mfs" value="${SearchHelper.searchForms(mustHave, mayHave, mustNotHave, systemUser)}"/>

          <c:choose>
            <%-- checks if return type is HTML --%>
             <c:when test="${returnHTML}">
               <div class="panel panel-default rkm-message-container hide">
               <div class="panel-heading rkm-message"></div>
               </div>
               <c:choose>
                 <%-- checks if request length is greater than 0 and not null --%>
                 <c:when test="${validRequest}">
   	                <c:set var="rkmCount" value="0"/>
                    <%-- iterates over returned arraylist and each instance is refered to as "a" --%>
   	                <c:forEach var="a" items="${mfs.searchData(systemUser)}">
   	                    <c:if test="${a['Source'] != null}">
                          <c:set var="sourceCallback" value="${a['Source'].toString().replaceAll("\\s","")}"/>
                          <c:set var="sourceCallback" value="${sourceCallback.substring(0, 1).toLowerCase()}${sourceCallback.substring(1)}"/>
                          <c:set var="rkmCount" value="${rkmCount + 1}"/>
 	                        <div class="panel panel-default rkm-article" id="article-${a["Article ID"]}">
 	                            <div class="panel-heading rkm-article-title" data-rkm-article-source="${sourceCallback}" data-rkm-article-id="${a["Article ID"]}">
 	                                <span>${a['Article Title']}</span> <i class="fa fa-plus-square"></i>
 	                            </div>
 	                            <div class="panel-body rkm-article-details">
 	                                <div class="rkm-article-summary">
 	                                    <span>${a["Summary"]}</span>
 	                                </div>
 	                                <div class="col-sm-6 rkm-article-id">
                                    <%-- accesses IconHelper and returns the cooresponding html string --%>
 	                                    ${IconHelper.getIconForSource(a['Source'].toString())} <span>${a["Article ID"]}</span>
 	                                </div>
 	                                <div class="col-sm-6 rkm-article-date">
 	                                    <i class="fa fa-clock-o" data-description="${a["Created Date"]}"></i> <span>${a["Created Ago"]} ago</span>
 	                                </div>
 	                            </div>
 	                            <div class="panel-body rkm-article-text collapse">
 	                                <i class="fa fa-spinner fa-spin"></i> Loading Article
 	                            </div>
 	                        </div>
   	                    </c:if>
   	                </c:forEach>

                   <div class="rkm-count collapse" data-rkm-count="${rkmCount}"></div>
                   <style type="text/css">
                       .rkm-message-container,
           						.rkm-article {
           						    margin: 5px 0;
           						    border-color: #cccccc;
           						    color: #292929;
           						}
           						.rkm-message-container > div,
           						.rkm-article > div {
           						    padding: 5px;
           						}
           						.rkm-message-container .rkm-message {
           						    position: relative;
           	                        font-weight: bold;
           	                        padding-right: 20px;
           	                        border: none;
           						}
           						.rkm-article .rkm-article-title {
           						    position: relative;
           						    cursor: pointer;
           						    font-weight: bold;
           						    padding-right: 20px;
           	                        border-color: #cccccc;
           						}
           						.rkm-article .rkm-article-title i {
           						    position: absolute;
           						    top: 7px;
           						    right: 5px;
           						}
           						.rkm-article div[class^="col-"] {
           						    padding: 0;
           						    margin: 0;
           						}
           						.rkm-article .rkm-article-text {
           						    border-top-style: solid;
           						    border-top-width: 1px;
           						    border-top-color: inherit;
           						    background-color: #fafafa !important;
           						}
                       .rkm-article .rkm-article-text * {
                           font-size: 12px !important;
                           color: #292929 !important;
                           background-color: transparent !important;
                           border: none !important;
                           margin: 0 !important;
                       }
                       .rkm-article .rkm-article-text div.article a {
                           color: #0000AA !important;
                       }
                       .rkm-article .rkm-article-text div.article sup {
                           font-size: 70% !important;
                           position: relative !important;
                       }
                       .rkm-article .rkm-article-text .article div.label {
                           font-weight: bold !important;
                           text-decoration: underline !important;
                       }
                       .rkm-article .rkm-article-text .article div.value {
                           margin: 5px 0 !important;
                       }
                   </style>
                   <script type="text/javascript">
                       $('div.rkm-message').text("${rkmCount} Result" + ("${rkmCount}" != "1" ? "s" : ""));
                       <c:out value="${showCount ? "$('div.rkm-message-container').hide();" : ""}"/>
                       var qtipOptions = {
                           content: { attr:'data-description' },
                           style: { classes:'qtip-tipsy qtip-shadow', tip: { corner: true } },
                           position: { my:'left center', at:'right middle' }
                       };
                       $('div.rkm-article-id i, div.rkm-article-date i').qtip(qtipOptions).qtip('api');
                       $('div.rkm-article-title').on('click', function(e){
                       	var $article = $(this).closest('.rkm-article');
                       	var dataLoaded = $article.data('rkm-article-loaded') ? true : false;
                           $article.find('div.rkm-article-text').stop(true, true).slideToggle(300);
                           $(this).find('i').toggleClass('fa-plus-square fa-minus-square');
                       	if (!dataLoaded){
                       		$article.data('rkm-article-loaded', true);
                       		var $articleText = $article.find('.rkm-article-text');
                          var articleId = $(this).data('rkm-article-id');
                          var closeOnly = $('div#article-' + articleId).hasClass('selected-article');
                          $('div.selected-article.show').empty().toggleClass('selected-article show');
                          // calls partial display
                       		$.ajax({
                              url: '${bundle.kappLocation}' + '?partial=' + $(this).data('rkm-article-source') + '.html',
                              data: { articleId: $(this).data('rkm-article-id')},
                              success: function(data) {
                                   // Article Data
                                   $articleText.html(data);

                                   // Images through Kinetic
                                   $articleText.find("img").each(function(){
                                     var arattid, arentryid, arschema;
                                       arattid = $(this).attr("arattid");
                                       ($(this).attr("arschema") && $(this).attr("arschema").length > 0) ? arschema = $(this).attr("arschema") : arschema = articleForm;
                                       ($(this).attr("arentryid") && $(this).attr("arentryid").length > 0) ? arentryid = $(this).attr("arentryid") : arentryid = articleRequestId.replace(/(KBA\w+)/,"").replace('|',"");
                                       $(this).attr("src", "DownloadAttachment/" + arschema + "/" + arattid + "/" + arentryid);
                                   });

                                   // Document attachments through Kinetic
                                   $articleText.find("a[path*='sharedresources']").each(function(){
                                     var path = $(this).attr('path').replace(/\?(.*)/,"");
                                     var urlParsed = path.split("/");
                                     $(this).attr("href", "DownloadAttachment/" + urlParsed[2] + "/" + urlParsed[3] + "/" + urlParsed[4]);
                                   });

                                   // Keywords
                                   var strKeywords = $articleText.find('.article .field .value.keywords').text();
                                   var keywords = strKeywords.replace(/[\n\r]/g,"").split(" ");
                                   $articleText.find('.article .field .value.keywords').empty();
                                   $.each(keywords, function(index,val){
                                     if(val != ""){
                                   	  $articleText.find('.article .field .value.keywords').append('<span>'+val+'</span>');
                                     }
                                   });
                               }
                           });
                   	     }
                       });
                   </script>
                 </c:when>
                 <c:otherwise>
                       <script type="text/javascript">
                           $('div.rkm-message').text("Invalid search criteria.");
                           $('div.rkm-message-container').removeClass('hide');
                       </script>
                 </c:otherwise>
               </c:choose>
             </c:when>
             <c:otherwise>
               <%-- Pulls back stringified JSON Data if returnHTML is false --%>
                 <c:set var="jsonData" value="${mfs.search(systemUser)}"/>
            </c:otherwise>
           </c:choose>
         </c:catch>
         <c:if test = "${e != null}">
            ${throw e}
         </c:if>
