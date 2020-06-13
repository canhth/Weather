//
//  WeatherModuleTests.swift
//  WeatherTests
//
//  Created by Canh Tran Wizeline on 6/13/20.
//  Copyright © 2020 CanhTran. All rights reserved.
//

import XCTest
@testable import Weather

final class WeatherModuleTests: WeatherTests {
    
    private let viewController = WeatherViewController()
    private let interactor = WeatherInteractor()
    private let router = WeatherRouter(rootController: UINavigationController())
    private lazy var presenter = WeatherPresenter(view: viewController,
                                                     interactor: interactor,
                                                     router: router)
    private let keyword = "saigon"
    
    override func setUp() {
        super.setUp()
        viewController.presenter = presenter
    }
    
    /// Test Presenter gets list data by network
    func test_Fetching_Data_By_Network() {
        let expect = expectation(description: "test_forecast_by_network")
        
        presenter.fetchWeatherData(keyword: keyword)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + limitTimeOut - 1) {
            expect.fulfill()
        }
        
        waitForExpectations(timeout: limitTimeOut) { [unowned self] error in
            if let error = error {
                self.router.showAlert(message: "Error")
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            } else {
                XCTAssertTrue(self.presenter.numberOfForecast() > 0, "Should load at least one forecast.")
                self.loadDataFromLocal()
            }
        }
    }
    
    /// Test Presenter gets list data by Mock data
    func test_Fetching_Data_By_Mock_Data() {
        let mockInteractor = MockWeatherInteractor()
        presenter = WeatherPresenter(view: viewController,
                                     interactor: mockInteractor,
                                     router: WeatherRouter(rootController: UINavigationController()))
        viewController.presenter = presenter

        presenter.fetchWeatherData(keyword: keyword)

        let numberOfForecast = presenter.numberOfForecast()

        XCTAssertTrue(numberOfForecast > 0, "Should load at least 1 forecast.")
    }

    // Test pull to reload page
    func test_Reload_Page() {
        presenter.refreshListData(keyword: keyword)
        XCTAssertTrue(presenter.numberOfForecast() == 0, "Should clean up everything.")

        let expect = expectation(description: "test_reloadData_by_network")
        DispatchQueue.main.asyncAfter(deadline: .now() + limitTimeOut - 1) {
            expect.fulfill()
        }

        waitForExpectations(timeout: limitTimeOut) { [unowned self] error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            } else {
                XCTAssertTrue(self.presenter.numberOfForecast() > 0, "Should reload after pulldown to refresh.")
            }
        }
    }

    // MARK: Privates nested tests

    // Load data from local
    private func loadDataFromLocal() {
        interactor.fetchWeatherData(isCached: true, keyword: keyword) { (result) in
            switch result {
            case .success(let data):
                XCTAssertFalse(data.isEmpty, "Should load data from cache perfectly.")
            case .failure(let error):
                XCTFail("Can not load data from cache \(error)")
            }
        }
    }
}
