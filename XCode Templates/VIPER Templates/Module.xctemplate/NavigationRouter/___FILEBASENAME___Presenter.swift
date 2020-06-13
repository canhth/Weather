// ___FILEHEADER___
//  This file was generated by the 🐍 VIPER generator
//

import Foundation

final class ___VARIABLE_moduleName___Presenter {
    // MARK: - Private Properties

    private unowned let view: ___VARIABLE_moduleName___ViewInterface
    private let interactor: ___VARIABLE_moduleName___InteractorInterface
    private let router: ___VARIABLE_moduleName___RouterInterface

    // MARK: - LifeCycle

    init(view: ___VARIABLE_moduleName___ViewInterface,
         interactor: ___VARIABLE_moduleName___InteractorInterface,
         router: ___VARIABLE_moduleName___RouterInterface) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad() {
    }
}

// MARK: - ___VARIABLE_moduleName___PresenterInterface

extension ___VARIABLE_moduleName___Presenter: ___VARIABLE_moduleName___PresenterInterface {
}