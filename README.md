# kapp-remedy-knowledge-management

## Overview
The bundle directory includes files that are needed for initialization and helper files for commonly used functionality.

It includes:

* initialization.jspf
* router.jspf
* SearchHelper.jspf
* ResponseHelper.jspf
* IconHelper.jspf
* AgeHelper.jspf

* rkm.js

* RKMQuery.json.jsp

* HowTo.html.jsp
* knownError.html.jsp
* problemSolution.html.jsp
* reference.html.jsp
* decisionTree.html.jsp

* rkm.jsp
* rkmArticle.jsp


## RKMQuery.json.jsp

Processes RKM search request. Evaluates request parameter and passes along either an HTML display or JSON data.


## rkm.js

Preforms Ajax calls and


## SearchHelper.jspf

**${SearchHelper.searchForms(String mustHave, String mayHave, String mustNotHave, com.bmc.arsys.api.ARServerUser serverUser)}**
initializes the MultiFormSearch class by supplying required parameters and builds a private "query" attribute
Requires - String mustHave, String mayHave, String mustNotHave, com.bmc.arsys.api.ARServerUser serverUser
Returns - MultiFormSearch

**${SearchHelper.searchForms.search(com.bmc.arsys.api.ARServerUser serverUser)}**
Gets objects that are found by calling the private "preformSearch" function filtering results through the query attributes. Search then returns a JSON string of the results.
Requires - com.bmc.arsys.api.ARServerUser serverUser
Returns - String string

**${SearchHelper.searchForms.searchData(com.bmc.arsys.api.ARServerUser serverUser)}**
Gets objects that are found by calling the private "preformSearch" function filtering results through the query attributes.
Requires - com.bmc.arsys.api.ARServerUser serverUser
Returns - ArrayList<LinkedHashMap> list

**${buildQuery()}**
checks the value of local attribute "mustHave", "mayHave", and "mustNotHave" and returns results matching the attributes
Returns - String string

**${buildSchemaIds()}**
uses local attribute "serverUser" to build and define schema IDs.
Returns - String string

**${performSearch(com.bmc.arsys.api.ARServerUser serverUser)}**
Authenticates "serverUser" then iterates over JSON checking for any instances of the data provided by the query attribute
Requires - com.bmc.arsys.api.ARServerUser serverUser
Returns - ArrayList<LinkedHashMap> list


## IconHelper.jspf

**${IconHelper.getIconForSource(String source)}**
Takes in object source attribute and returns a line of HTML
Requires - String source
Returns - String string


## AgeHelper.jspf

**${AgeHelper.timeAgo(java.util.Date pastDate)}**
Takes in creation date of an object and compares that with the current date and returns the amount of time that has elapsed.
Requires - java.util.Date pastDate
Returns - String string


## ResponseHelper.jspf
