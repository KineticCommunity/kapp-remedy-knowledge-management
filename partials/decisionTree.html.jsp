<%@page contentType="text/html; charset=UTF-8"%>
<%@include file="bundles/initialization.jspf"%>

<c:choose>
  <c:when test="${context == null}">
      <c:out value="${ResponseHelper.sendUnauthorizedResponse(response)}">
  <c:otherwise>
      <c:set var="articleId" value="${request.getParameter("articleId")}"/>
      <c:set var="decisionTree" value="${DecisionTree.findById(serverUser, articleId)}"/>
      <div class="article">
        <c:if test="${decisionTree.getDecisionTree() != null}">
          <div class="field">
              <div class="label">Decision Tree</div>
              <div class="value">${decisionTree.getDecisionTree()}</div>
          </div>
        </c:if>
      </div>
  </c:otherwise>
</c:choose>
