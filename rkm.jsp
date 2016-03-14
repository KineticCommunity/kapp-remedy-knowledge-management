<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="bundle/initialization.jspf" %>

<bundle:layout page="layouts/form.jsp">

  <%-- RKMResultType resultType = RKMResultType.getByValue(request.getParameter("resultType"));
  Boolean hasQuery = request.getParameter("q") == null ? false : true;--%>
  <%-- <%= String query = request.getParameter("q") != null ? request.getParameter("q") : ""%> --%>

  <script type="text/javascript">
      var resultType = "${RKMResultType.getByValue(request.getParameter("resultType")).valueOf()}";
      var queryParameterExists = ${request.getParameter("q") == null ? false : true};
      var queryParameter = "${request.getParameter("q") != null ? request.getParameter("q") : ""}";
  </script>
  <!-- Page Stylesheets -->
  <%-- <link rel="stylesheet" href="package.css" type="text/css" /> --%>
  <!-- Page Javascript -->
  <%-- <script defer type="text/javascript" src="js/rkm.js"></script> --%>

  <c:if test="${RKMResultType.getByValue(request.getParameter("resultType")).equals(RKMResultType.CONTAINER)}">
      <section id="rkm-section">
        <div class="container">
  </c:if>
      <c:if test="${!RKMResultType.getByValue(request.getParameter("resultType")).equals(RKMResultType.RESULT)}">
        <div class="rkm-data">
	        <div class="rkm-title">
	            Remedy Knowledge Management
	        </div>
	        <div class="rkm-search">
	          <form id="rkm-search-form">
	            <div class="input-group input-group-sm">
	                <input type="text" class="form-control" value="${request.getParameter('q') != null ? request.getParameter('q') : ''}" placeholder="Search Remedy Knowledge Management" name="q">
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
      <c:if test="${RKMResultType.getByValue(request.getParameter("resultType")).equals(RKMResultType.RESULT)}">
          <div class="rkm-message"></div>
          <div class="rkm-results"></div>
      </c:if>
  <c:if test="${RKMResultType.getByValue(request.getParameter("resultType")).equals(RKMResultType.CONTAINER)}">
      </div>
    </section>
  </c:if>
</bundle:layout>
