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
