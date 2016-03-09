<%@page contentType="text/html; charset=UTF-8"%>
<%@include file="bundles/initialization.jspf"%>

<c:choose>
  <c:when test="${context == null}">
      <c:out value="${ResponseHelper.sendUnauthorizedResponse(response)}">
  <c:otherwise>
      <c:set var="articleId" value="${request.getParameter("articleId")}"/>
      <c:set var="knownError" value="${KnownError.findById(serverUser, articleId)}"/>
      <div class="article">
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
  </c:otherwise>
</c:choose>
