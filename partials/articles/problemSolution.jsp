<%@page contentType="text/html; charset=UTF-8"%>
<%@include file="../../bundle/initialization.jspf"%>

<c:set var="articleId" value="${param.articleId}"/>
<c:set var="problemSolution" value="${RKMArticleDetailHelper.findProblemSolutionById(systemUser, articleId)}"/>
<div class="article">
    <c:if test="${problemSolution.getProblem() != null}">
        <div class="field">
            <div class="label">Problem</div>
            <div class="value"><pre>${problemSolution.getProblem()}</pre></div>
        </div>
    </c:if>
    <c:if test="${problemSolution.getSolution() != null}">
        <div class="field">
            <div class="label">Solution</div>
            <div class="value"><pre>${problemSolution.getSolution()}</pre></div>
        </div>
    </c:if>
    <c:if test="${problemSolution.getTechnicalNotes() != null}">
        <div class="field">
            <div class="label">Technical Notes</div>
            <div class="value"><pre>${problemSolution.getTechnicalNotes()}</pre></div>
        </div>
    </c:if>
</div>
