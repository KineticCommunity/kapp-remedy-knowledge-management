<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="bundle/initialization.jspf" %>
<%@include file="bundle/router.jspf" %>
<c:set var="bundleCategories" value="${CategoryHelper.getCategories(kapp)}"/>

<bundle:layout page="layouts/form.jsp">

  <script type="text/javascript">
      var resultType = "${RKMResultType.getByValue(param.resultType).valueOf()}";
      var queryParameterExists = ${param.q == null ? false : true};
      var queryParameter = "${param.q != null ? param.q : ""}";
  </script>

  <c:if test="${RKMResultType.getByValue(param.resultType).equals(RKMResultType.CONTAINER)}">
      <section id="rkm-section">
        <div class="container">
  </c:if>
      <c:if test="${!RKMResultType.getByValue(param.resultType).equals(RKMResultType.RESULT)}">
        <div class="rkm-data">
	        <div class="rkm-title">
	            Remedy Knowledge Management
	        </div>
	        <div class="rkm-search">
	          <form id="rkm-search-form">
	            <div class="input-group input-group-sm">
	                <input type="text" class="form-control" value="${param.q != null ? param.q : ''}" placeholder="Search Remedy Knowledge Management" name="q">
                  <span class="input-group-addon rkm-message hide"></span>
                  <span class="input-group-addon rkm-error hide"></span>
	                <span class="input-group-btn">
	                    <button class="btn btn-primary" type="submit"><i class="fa fa-search"></i></button>
	                </span>
	            </div>
		        </form>
	        </div>
	        <div class="rkm-results"></div>
	      </div>
      </c:if>
      <c:if test="${RKMResultType.getByValue(param.resultType).equals(RKMResultType.RESULT)}">
          <div class="rkm-message"></div>
          <div class="rkm-results"></div>
      </c:if>
  <c:if test="${RKMResultType.getByValue(param.resultType).equals(RKMResultType.CONTAINER)}">
      </div>
    </section>
  </c:if>
</bundle:layout>
