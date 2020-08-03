# NOTE FOR EDGESDK 1.5 AND EARLIER USERS

The current models in this repository all assume the use of EdgeSDK 1.6. The 
reason for this is that EdgeSDK 1.5 and earlier version do not support the 
MULTI\_DIM\_NVP type in the JSon *description* of TagGroups. 

The TagGroup files as provided in this repository will need to be changed for 
use in earlier versions, as the JSon parser in these versions will reject some of 
these TagGroups as having an invalid syntax.

Run-time the type is supported, so, provided you have written the marshalling 
and demarshalling code properly (or have generated code) you could also use that code
for those earlier versions.

The change is simply changing the _type_ from *MULTI\_DIM\_NVP* to *NVP\_SEQ*, 
and putting the dimensions in the _unit_ field.

However, keep in mind that once a TagGroup is published, it cannot be changed. By 
changing the TagGroup to have a tag with a different type, it will become 
incompatible with 1.6 applications. Therefore, you also would need to change the 
version. We recommend using the 1.6 version and appending _-pre1.6_ to it.

You can then use the wildcard feature of input-TagGroups on the ThingClass
to support both definitions; the run-time code for both versions can be exactly 
the same.
