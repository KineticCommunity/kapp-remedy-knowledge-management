<%@page contentType="text/html; charset=UTF-8"%>
<%@include file="../../bundle/initialization.jspf"%>

<c:set var="articleId" value="${param.articleId}"/>
<c:set var="decisionTree" value="${RKMArticleDetailHelper.findDecisionTreeById(systemUser, articleId)}"/>
<div class="article">
    <c:if test="${decisionTree.getDecisionTree() != null}">
        <div class="field">
            <div class="label">Decision Tree</div>
            <div class="value">${decisionTree.getDecisionTree()}</div>
        </div>
    </c:if>
</div>
