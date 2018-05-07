# The Movies DB
Project to fetch movies list from The Movie DB api.

The Movie DB has a lot of APIs to load movies according to some criteria, this project only to focus on /discover API. This API accepts a sorting parameter to load the data you need. 

For example, to load most popular movies, project uses popularity.desc, or for heist revenue, you can use revenue.desc,.. and so on

## Assignment

### Approach & Implementation

•	The MVVM architecture, SOLID Principle and protocol-oriented programming design has been used to complete the assignment.

•	The code follows the BDD approach which is being implemented using 3rd party frameworks, Quick and Nimble, based on XCTest. The code is scalable, testable and flexible.

•      Master-Detail application template is used to create application.

•	The user-defaults have been used to persist the data. Although, CoreData/iCloud can be used to make it scalable but considering the scope and time of the assignment, I restricted it to user defaults.

•	The native API has been used in the all the possible cases, to avoid the incompatibility with iOS versions and to make the software flexible enough like NSCache, URLSession, UITableView, UICollectionView etc.

•	The app is universal.

•      Image caching is done using NSCache.

•      Both Master/Details screens shown together on Tablets in landscape mode.

•	App is designed using storyboard.

•	Handled all error scenarios.

### Assumptions

•	The basic UI has been used to depict the behavior and the assignment. The UI can be modified and improved further but not considered as a part of this assignment.

### Tests & Static Analysis & others

•	Coverage is more than 87% with 28 non UI test cases.

•	Zero warnings

•      Added README.md file to talkl about approach & implementation.

