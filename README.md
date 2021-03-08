# ADLINK-VisionDataModels-Reference
This repository is the result of a consolidation of several sources:
https://github.com/ADLINK-DEV/AppDataModelsV1.0
https://gitlab.com/oasys/adlink/vision/data-models.git

A TagGroup is defined by name:context:version. In this repository, the definition is stored under _context/version/nameTagGroup.json_

This means that all TagGroups from the same context (eg. com.adlinktech.vision) are grouped together under their versions.

Note that some TagGroups may be versioned separately from others, so make sure that if you want the latest, you examine the directories closely.

The appropriate procedure is to fork the repository to your own personal account, create a branch, make your suggested changes, then create a Pull Request (PR).

It will then be examined and reviewed, and if deemed appropriate become part of the repositories.

Note that creating a PR early might help in assessing its need and direction early, preventing unnecessary work.

In order to avoid intricate dependencies, it is mandatory to not only change the version on your TagGroup-definition file, but also on the others in the same hierarchy. 

To avoid having to do this manually, a tool called TagGroupVersionBumper will be provided that will allow you to do this.
