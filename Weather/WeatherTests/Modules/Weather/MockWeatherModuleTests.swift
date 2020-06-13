//
//  MockWeatherTests.swift
//  WeatherTests
//
//  Created by Canh Tran Wizeline on 6/13/20.
//  Copyright © 2020 CanhTran. All rights reserved.
//

import XCTest
@testable import Weather

final class MockWeatherInteractor {
    
    private let networkClient: NetworkRequestable

    // MARK: - LifeCycle

    init(networkClient: NetworkRequestable = NetworkClient()) {
        self.networkClient = networkClient
    }
}

extension MockWeatherInteractor: WeatherInteractorInterface {
    func fetchWeatherData(isCached: Bool,
                          keyword: String,
                          completion: @escaping (Result<[Forecast], NetworkError>) -> Void) {
        guard let data = TestSuite().data(fromResource: "response", withExtension: "json") else {
            XCTFail("Can not get the data form response.json")
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let resultData = try decoder.decode(ForecastResponse.self, from: data)
            let forecast = resultData.list
            completion(.success(forecast))
            XCTAssertNotNil(forecast, "Should load the list forecast without error.")
        } catch {
            XCTFail("Can not parse the response.json")
        }
    }
}

