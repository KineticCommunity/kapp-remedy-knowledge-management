## Overview
RKMArticleDetailHelper was developed with the express purpose of building out detailed descriptions
of search results returned by a RKM Search Query. within this helper are multiple functions that
are referenced pending on the article type.

## Functions

**${findReferenceById(com.bmc.arsys.api.ARServerUser serverUser, String id)}**
takes in user information and an article id, then fetches the related article
Requires - com.bmc.arsys.api.ARServerUser serverUser, String id
Returns - Reference

**${findHowToById(com.bmc.arsys.api.ARServerUser serverUser, String id)}**
takes in user information and an article id, then fetches the related article
Requires - com.bmc.arsys.api.ARServerUser serverUser, String id
Returns - HowTo

**${findKnownErrorById(com.bmc.arsys.api.ARServerUser serverUser, String id)}**
takes in user information and an article id, then fetches the related article
Requires - com.bmc.arsys.api.ARServerUser serverUser, String id
Returns - KnownError

**${findProblemSolutionById(com.bmc.arsys.api.ARServerUser serverUser, String id)}**
takes in user information and an article id, then fetches the related article
Requires - com.bmc.arsys.api.ARServerUser serverUser, String id
Returns - ProblemSolution

**${findDecisionTreeById(com.bmc.arsys.api.ARServerUser serverUser, String id)}**
takes in user information and an article id, then fetches the related article
Requires - com.bmc.arsys.api.ARServerUser serverUser, String id
Returns - DecisionTree

**${findKnowledgeArticleById(com.bmc.arsys.api.ARServerUser serverUser, String id)}**
takes in user information and an article id, then fetches the related article
Requires - com.bmc.arsys.api.ARServerUser serverUser, String id
Returns - KnowledgeArticle
