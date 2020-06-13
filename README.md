# Weather
An iOS app to retrieve weather information based on their searching criteria and render the searched results on dashboard screen.
#### Requires Swiftlint installed.

# Demo
<p align="center">
  <img width="160" height="320" src="demo.gif"/>
</p>
<p align="center"> Simulator-iP11 </p>

# Functionalities completed
1. The application is a simple iOS application which is written by Swift.
2. The application is able to retrieve the weather information from OpenWeatherMaps API.
3. The application is able to allow user to input the searching term.
4. The application is able to proceed searching with a condition of the search term length
must be from 3 characters or above.
5. The application is able to render the searched results as a list of weather items.
6. The application is able to support caching mechanism so as to prevent the app from
generating a bunch of API requests.
7. The application is able to manage caching mechanism & lifecycle.
8. The application is able to handle failures.

# More technical notes
- [x] Swift 5.0.
- [x] Following VIPER architechture.
- [x] Pull to refresh.
- [x] Network caching.
- [x] UnitTests.
- [x] UITests.
- [x] Swiftlint for coding styles & clean code.
- [x] Support `fastlane`. Run `fastlane scan` in Xcode project directory.
- [x] Prepared to support multi environments (dev and prod).

# Things need to improve:
- Intergrate CI/CD & codecov.io, to double check every commit/PR pass the test cases and how many percent of test coverage.
- Support VoiceOver & Scaling Text.

# Project structures
```
Weather
├── Resources
├── Models
├── CommonViews
├── Modules
├── Core
│  └── Helper
|  └── Extensions
|  └── Networking
│  └── BaseVIPER
|     └── Presenter
|     └── Router
|     └── View

WeatherTests
├── Resources
├── NetworkingTests
├── ModulesTests
├── ExtensionTests
├── Helper

WeatherUITests
├── ModulesTests
├── Helper
```


### Why VIPER??
[VIPER](https://medium.com/@smalam119/viper-design-pattern-for-ios-application-development-7a9703902af6) is a very clean architecture. It isolates each module from others. So changing or fixing bugs are very easy as you only have to update a specific module. Also for having modular approach VIPER creates a very good environment for unit testing.

###### Other Key Advantages of using VIPER Architecture:
- Good for large teams.
- Makes it scalable. Enable developers to simultaneously work on it as seamlessly as possible.
- Makes it easy to add new features.
- Makes it easy to write automated tests since your UI logic is separated from the business logic.
- Makes it easier to track issues via crash reports due to the Single Responsibility Principle.
- Makes the source code cleaner, more compact, and reusable.
- Reduces the number of conflicts within the development team.
- Applies SOLID principles.

#### Added VIPER Template
I created a VIPER Xcode template to make the work easier, reduce time for create new files and repeate the same code per module.

[Installation Instruction](https://github.com/m-rec/524ad38f766143bd5e1f804e231ba7a3b8877ce6/tree/master/XCode%20Templates)

To create new module: `Create new Group as your module name ---> Add new File --> Scroll down to select VIPER template --> type your module name.`

### BaseNetworking
A very lightweight URLSession wrapper to work with REST APIs. Easy to use and flexible with diffirent endpoints, methods.

```swift
networkClient.fetch(endPoint: MobileNetworkEndpoint.fetchListMobileData(limit: 20, offset: 20),
                            type: MobileDataResponse.self,
                            loadFromCache: true) { (response) in
                                switch response {
                                case .success(let data):
                                    print(error)
                                case .failure(let error):
                                    print(error)
                                }
        }
```



 ## TestCoverage: 78.05%

Add test cases for each modules or base components to make sure we won't break it after changes. Can run `fastlane scan` 
- [x] NetworkingTests.
- [x] WeatherModuleTests.
- [x] WeatherCellTests.
- [x] Load data from cache.
- [x] Support Mockable test or load data from local JSON.

NAB-Test/Weather/Weather/AppDelegate.swift: 8 of 8 lines (100.00%)
NAB-Test/Weather/Weather/CommonViews/EmptyStateView.swift: 29 of 32 lines (90.62%)
NAB-Test/Weather/Weather/Core/Extensions/Collection+Ext.swift: 6 of 6 lines (100.00%)
NAB-Test/Weather/Weather/Core/Extensions/Date+Ext.swift: 9 of 9 lines (100.00%)
NAB-Test/Weather/Weather/Core/Extensions/UIFont+Ext.swift: 6 of 6 lines (100.00%)
NAB-Test/Weather/Weather/Core/Extensions/UITableView+Ext.swift: 8 of 9 lines (88.89%)
NAB-Test/Weather/Weather/Core/Extensions/UIView+Ext.swift: 54 of 55 lines (98.18%)
NAB-Test/Weather/Weather/Core/Helper/Logger.swift: 68 of 113 lines (60.18%)
NAB-Test/Weather/Weather/Core/Helper/NameDescribable.swift: 6 of 6 lines (100.00%)
NAB-Test/Weather/Weather/Core/Helper/UserDefault.swift: 7 of 10 lines (70.00%)
NAB-Test/Weather/Weather/Core/Networking/BaseNetworking/APIEndpoint.swift: 46 of 47 lines (97.87%)
NAB-Test/Weather/Weather/Core/Networking/BaseNetworking/NetworkClient.swift: 45 of 57 lines (78.95%)
NAB-Test/Weather/Weather/Core/Networking/BaseNetworking/NetworkConfiguration.swift: 19 of 19 lines (100.00%)
NAB-Test/Weather/Weather/Core/Networking/BaseNetworking/NetworkError.swift: 17 of 28 lines (60.71%)
NAB-Test/Weather/Weather/Core/Networking/BaseNetworking/Reachablility.swift: 18 of 21 lines (85.71%)
NAB-Test/Weather/Weather/Core/Networking/Endpoints/WeatherEndpoint.swift: 18 of 18 lines (100.00%)
NAB-Test/Weather/Weather/Core/VIPER/Router/NavigationRouter.swift: 24 of 46 lines (52.17%)
NAB-Test/Weather/Weather/Core/VIPER/Router/RouterInterfaces.swift: 3 of 22 lines (13.64%)
NAB-Test/Weather/Weather/Core/VIPER/Router/ViewRouter.swift: 5 of 11 lines (45.45%)
NAB-Test/Weather/Weather/Core/VIPER/View/BaseViewController.swift: 8 of 17 lines (47.06%)
NAB-Test/Weather/Weather/Core/VIPER/View/ViewInterface.swift: 3 of 3 lines (100.00%)
NAB-Test/Weather/Weather/Modules/Weather/Cells/WeatherCell.swift: 90 of 93 lines (96.77%)
NAB-Test/Weather/Weather/Modules/Weather/Cells/WeatherCellViewModel.swift: 13 of 14 lines (92.86%)
NAB-Test/Weather/Weather/Modules/Weather/WeatherDependency.swift: 13 of 13 lines (100.00%)
NAB-Test/Weather/Weather/Modules/Weather/WeatherInteractor.swift: 17 of 18 lines (94.44%)
NAB-Test/Weather/Weather/Modules/Weather/WeatherPresenter.swift: 36 of 49 lines (73.47%)
NAB-Test/Weather/Weather/Modules/Weather/WeatherViewController.swift: 96 of 131 lines (73.28%)
Tested 672/861 statements
```
