<%@page contentType="text/html; charset=UTF-8"%>
<%@include file="../bundle/initialization.jspf"%>
<%-- <c:choose>
  <c:when test="${context == null}"> --%>
    <%-- checks if user is logged in --%>
      <%-- <c:out value="${ResponseHelper.sendUnauthorizedResponse(response)}"/>
  </c:when>
  <c:otherwise> --%>
    <c:out value="otherwise"/>
      <c:set var="articleId" value="${param.articleId}"/>
      <c:set var="reference" value="${HtmlHelper.findReferenceById(systemUser, articleId)}"/>
      <div class="article">
        <c:if test="${reference.getReference() != null}">
          <div class="field">
              <div class="label">Reference</div>
              <div class="value">${reference.getReference()}</div>
          </div>
        </c:if>
      </div>
  <%-- </c:otherwise>
</c:choose> --%>
