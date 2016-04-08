<%@page contentType="text/html; charset=UTF-8"%>
<%@include file="../../bundle/initialization.jspf"%>

    <c:out value="${RelevanceHelper.relevanceIncriment(systemUser, param.articleId)}"/>
