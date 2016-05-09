<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="bundle/initialization.jspf" %>
<%@include file="bundle/router.jspf" %>

<bundle:layout page="layouts/form.jsp">

    <script type="text/javascript">
        var queryParameter = "${text.escapeJs(param.q != null ? param.q : "")}";
    </script>
    <script type="text/javascript">
        var rkmFileStore = "${kapp.getAttribute('RKM Filestore Slug').value}";
    </script>

    <div class="rkm-data">
        <div class="rkm-title">
            Remedy Knowledge Management
        </div>
        <div class="rkm-search">
            <form id="rkm-search-form">
                <div class="input-group input-group-sm">
                    <input type="text" class="form-control" value="${text.escape(param.q != null ? param.q : '')}"
                           placeholder="Search Remedy Knowledge Management" name="q">
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
    
</bundle:layout>
