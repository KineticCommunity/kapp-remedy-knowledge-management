<%@page contentType="text/html; charset=UTF-8"%>
<%@include file="../../bundle/initialization.jspf"%>

<c:set var="articleId" value="${param.articleId}"/>
<c:set var="reference" value="${RKMArticleDetailHelper.findReferenceById(systemUser, articleId)}"/>
<div class="article">
    <c:if test="${reference.getReference() != null}">
        <div class="field">
            <div class="label">Reference</div>
            <div class="value"><pre>${reference.getReference()}</pre></div>
        </div>
    </c:if>
</div>
