<%@page contentType="text/html; charset=UTF-8"%>
<%@include file="bundles/initialization.jspf"%>

<c:choose>
  <c:when test="${context == null}">
      <c:out value="${ResponseHelper.sendUnauthorizedResponse(response)}">
  <c:otherwise>
      <c:set var="articleId" value="${request.getParameter("articleId")}"/>
      <c:set var="howTo" value="${HowTo.findById(serverUser, articleId)}"/>
      <div class="article">
        <c:if test="${howTo.getQuestion() != null}">
          <div class="field">
              <div class="label">Question</div>
              <div class="value">${howTo.getQuestion()}</div>
          </div>
        </c:if>
        <c:if test="${howTo.getAnswer() != null}"
          <div class="field">
              <div class="label">Answer</div>
              <div class="value">${howTo.getAnswer()}</div>
          </div>
        </c:if>
        <c:if test="${howTo.getTechnicalNotes() != null}">
          <div class="field">
              <div class="label">Technical Notes</div>
              <div class="value"><c:out value="${howTo.getTechnicalNotes()}"></div>
          </div>
        </c:if>
      </div>
  </c:otherwise>
</c:choose>
