// ___FILEHEADER___
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class ___VARIABLE_moduleName___Dependency: ___VARIABLE_moduleName___DependencyInterface {
    // MARK: - Module Setup

    func make___VARIABLE_moduleName___View() -> ViewInterface {
        let view = ___VARIABLE_moduleName___ViewController()

        let interactor = ___VARIABLE_moduleName___Interactor()
        let navigationController = NavigationController()
        let router = ___VARIABLE_moduleName___Router(rootController: navigationController)
        router.setRootView(view, animated: false)

        let presenter = ___VARIABLE_moduleName___Presenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter

        return router.toController()
    }
}
