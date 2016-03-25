<%-- Include the package initialization file. --%>
<%--
    search.jsp - searches RKM
    Parameters:
        q: The search term(s) *Required*
        returnType: [html/json] Do you want HTML of JSON returned (Default=json) *Optional*
        count: [true/false] If returning HTML, do you want count div to be visible (Default=false) *Optional*
 --%>
<%@page pageEncoding="UTF-8" contentType="application/json" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf"%>
<%@taglib prefix="json" uri="http://kineticdata.com/taglibs/json"%>
<%-- Set the page content type, ensuring that UTF-8 is used --%>
<%-- establishes a catch condition in the event the enclosed code fails --%>
<%-- Retrieve the search terms from the request parameters. --%>
<c:set var="mustHave" value="${rkmQuery}"/>
<c:set var="mayHave" value=""/>
<c:set var="mustNotHave" value=""/>
<%-- Perform the multi form search and write the result to the out stream. --%>
<c:set var="mfs" value="${RKMArticleSearchHelper.searchForms(mustHave, mayHave, mustNotHave, systemUser)}"/>
<%-- form.jsp --%>
<json:array>
    <%-- Pulls back stringified JSON Data if returnHTML is false --%>
    <c:forEach var="jsonData" items="${mfs.searchData(systemUser)}">
        <json:object>
            <json:property name="id" value="${jsonData['Article ID']}"/>
            <json:property name="title" value="${jsonData['Article Title']}"/>
            <json:property name="source" value="${jsonData['Source']}"/>
            <json:property name="created date" value="${jsonData['Created Date']}"/>
            <json:property name="link" value="${bundle.getKappLocation()}?partial=articles/${jsonData['Source'].substring(0, 1).toLowerCase()}
                ${fn:replace(jsonData['Source'].substring(1), ' ', '')}&articleId=${jsonData['Article ID']}"/>
            <json:property name="summary" value="${jsonData['Summary']}"/>
            <json:property name="kappSlug" value="${kapp.slug}"/>
            <json:property name="kappName" value="${kapp.name}"/>
        </json:object>
    </c:forEach>
</json:array>
