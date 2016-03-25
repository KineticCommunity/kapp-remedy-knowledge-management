<%-- Include the package initialization file. --%>
<%--
    search.jsp - searches RKM
    Parameters:
        q: The search term(s) *Required*
        returnType: [html/json] Do you want HTML of JSON returned (Default=json) *Optional*
        count: [true/false] If returning HTML, do you want count div to be visible (Default=false) *Optional*
 --%>
 <%@page pageEncoding="UTF-8" contentType="application/json" trimDirectiveWhitespaces="true"%>
 <%@include file="../bundle/initialization.jspf" %>
 <link rel="stylesheet" href="${bundle.location}/css/search.css"/>
 <script src="${bundle.location}/js/search.js" type="text/javascript"/>
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
    <c:set var="mfs" value="${RKMArticleSearchHelper.searchForms(mustHave, mayHave, mustNotHave, systemUser)}"/>

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
                                        <%-- accesses RKMIconHelper and returns the cooresponding html string --%>
                                        ${RKMIconHelper.getIconForSource(a['Source'].toString())} <span>${a["Article ID"]}</span>
                                    </div>
                                    <div class="col-sm-6 rkm-article-date">
                                        <i class="fa fa-clock-o" data-description="${a["Created Date"]}"></i> <span>${a["Created Date"]}</span>
                                    </div>
                                </div>
                                <div class="panel-body rkm-article-text collapse">
                                    <i class="fa fa-spinner fa-spin"></i> Loading Article
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                    <div class="rkm-count collapse" data-rkm-count="${rkmCount}"></div>
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
