## Overview
This bundle is used to access BMC Remedy Knowledge Management.

It includes the default:

* RKM service Kapp (kapp.jsp)
* Full Article display (rkmArticle.jsp)
* Login page (login.jsp)
* Reset Password (resetPassword.jsp)

## Personalization
This bundle easily allows for minor personalization by including optional attributes in your KAPP, Form and/or Categories.

#### KAPP Attributes
The following KAPP Attributes are required to properly establish a connection to RKM.
* _rkmAdminUsername_ : The name of the service administrator.
* _rkmAdminPassword_ : The password of the service administrator.
* _rkmLocale_ : The local language code. This is the language in which you want the information returned.
* _rkmServer_ : The server on which the RKM data is stored. this will be something like _server.yourcompany.com_.
* _rkmPort_ : The port number.

The following Kapp Attribute are required to properly establish a connection to Filehub and properly display images.
* _Filehub Url_ : The URL to the Kinetic Filehub application. (https://acme.com/kinetic-filehub)
* _RKM Filestore Slug_ : The slug of the desired filestore configured in Kinetic Filehub.
* _RKM Filestore Key_ : The secret associated to the specified key.
* _RKM Filestore Secret_ : The key for an access key associated to the specified filestore.

##### Optional KAPP Attributes
* _Task Server Url_ : URL of your Kinetic Task engine.
* _Task Source Name_ : Source name from Kinetic Task engine.

#### Category Attributes
* _Hidden_ : Including this attribute on a category means the category and forms in that category will not be shown on the portal page.

## Customization
When you customize this bundle it is a good idea to fork it on your own git server to track your customizations and merge in any code changes we make to the default.

We also suggest you update this README with your own change summary for future bundle developers.

### Structure
This RKM bundle uses our standard directory structure. Bundles are completely self contained so should include all libraries and markup needed.

### External RKM Call

bellow is the structure of how json data is returned from an callback

## externalRKMQuery.json.jsp
<code><pre>
<%@page pageEncoding="UTF-8" contentType="application/json" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf"%>
<%@taglib prefix="json" uri="http://kineticdata.com/taglibs/json"%>
    <%-- Set the page content type, ensuring that UTF-8 is used --%>
    <%-- establishes a catch condition in the event the enclosed code fails --%>
       <%-- Retrieve the search terms from the request parameters. --%>
       <c:set var="mustHave" value="${rkmQuery}"/>
       <c:set var="mayHave" value=""/>
       <c:set var="mustNotHave" value=""/>
       <%-- Perform the multi form search and write the result to the out stream. --%>
       <c:set var="mfs" value="${RKMHelper.searchForms(mustHave, mayHave, mustNotHave, systemUser)}"/>
        <%-- form.jsp --%>
       <json:array>
         <%-- Pulls back stringified JSON Data if returnHTML is false --%>
         <c:forEach var="jsonData" items="${mfs.searchData(systemUser)}">
            <json:object>
              <json:property name="id" value="${jsonData['Article ID']}"/>
              <json:property name="title" value="${jsonData['Article Title']}"/>
              <json:property name="source" value="${jsonData['Source']}"/>
              <json:property name="created date" value="${jsonData['Created Date']}"/>
              <json:property name="link" value="${bundle.getKappLocation()}?partial=${jsonData['Source'].substring(0, 1).toLowerCase()}${fn:replace(jsonData['Source'].substring(1), ' ', '')}.html&articleId=${jsonData['Article ID']}"/>
              <json:property name="summary" value="${jsonData['Summary']}"/>
              <json:property name="kappSlug" value="${kapp.slug}"/>
              <json:property name="kappName" value="${kapp.name}"/>
            </json:object>
          </c:forEach>
        </json:array>
</pre></code>
