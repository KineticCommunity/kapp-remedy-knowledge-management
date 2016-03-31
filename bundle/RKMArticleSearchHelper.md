## Overview
RKMArticleSearchHelper was developed to filter through and pull back relevant search results.
within this helper are functions and sub-helpers that iterate through the data and pull back
the matching information as either an array of objects or a string.

## Functions

**${RKMArticleSearchHelper.searchForms(String mustHave, String mayHave, String mustNotHave, com.bmc.arsys.api.ARServerUser serverUser)}**
initializes the MultiFormSearch class by supplying required parameters and builds a private "query" attribute
Requires - String mustHave, String mayHave, String mustNotHave, com.bmc.arsys.api.ARServerUser serverUser
Returns - MultiFormSearch

**${RKMArticleSearchHelper.searchForms.search(com.bmc.arsys.api.ARServerUser serverUser)}**
Gets objects that are found by calling the private "preformSearch" function filtering results through the query attributes. Search then returns a JSON string of the results.
Requires - com.bmc.arsys.api.ARServerUser serverUser
Returns - String string

**${RKMArticleSearchHelper.searchForms.searchData(com.bmc.arsys.api.ARServerUser serverUser)}**
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
