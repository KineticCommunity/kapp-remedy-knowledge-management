<%@page contentType="text/html; charset=UTF-8"%>
<%@include file="../../bundle/initialization.jspf"%>

<c:set var="articleId" value="${param.articleId}"/>
<c:set var="knownError" value="${RKMArticleDetailHelper.findKnownErrorById(systemUser, articleId)}"/>
<div class="article" id="${articleId}">
    <c:if test="${knownError.getError() != null}">
        <div class="field">
            <div class="label">Error</div>
            <div class="value">${knownError.getError()}</div>
        </div>
    </c:if>
    <c:if test="${knownError.getRootCause() != null}">
        <div class="field">
            <div class="label">Root Cause</div>
            <div class="value">${knownError.getRootCause()}</div>
        </div>
    </c:if>
    <c:if test="${knownError.getWorkAroundFix() != null}">
        <div class="field">
            <div class="label">Work Around/Fix</div>
            <div class="value">${knownError.getWorkAroundFix()}</div>
        </div>
    </c:if>
    <c:if test="${knownError.getTechnicalNotes() != null}">
        <div class="field">
            <div class="label">Technical Notes</div>
            <div class="value">${knownError.getTechnicalNotes()}</div>
        </div>
    </c:if>
</div>
