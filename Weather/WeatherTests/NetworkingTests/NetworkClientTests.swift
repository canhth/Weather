//
//  NetworkClientTests.swift
//  WeatherTests
//
//  Created by Canh Tran Wizeline on 6/13/20.
//  Copyright © 2020 CanhTran. All rights reserved.
//

import XCTest
@testable import Weather

final class NetworkClientTests: WeatherTests {
    
    private let networkClient = NetworkClient()
    private let keyword = "saigon"
    
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        return decoder
    }()
    
    // MARK: Mocks
    
    func testMockForecastData() {
        guard let data = TestSuite().data(fromResource: "response", withExtension: "json") else {
            XCTFail("Can not get the data form response.json")
            return
        }
        
        do {
            let resultData = try decoder.decode(ForecastResponse.self, from: data)
            let list = resultData.list
            XCTAssertNotNil(list, "Should load the list forecast without error.")
        } catch {
            XCTFail("Can not parse the response.json")
        }
    }
    
    func testMockForecastDataWithError() {
        guard let data = TestSuite().data(fromResource: "error", withExtension: "json") else {
            XCTFail("Can not get the data form error.json")
            return
        }
        
        do {
            let _ = try decoder.decode(ForecastResponse.self, from: data)
            XCTFail("Can not parse the error.json")
        } catch {
            XCTAssertTrue(!error.localizedDescription.isEmpty, "Catch block should be excuted.")
        }
    }
    
    // MARK: Network
    
    func testFetchListMobileData() {
        let expect = expectation(description: "test_saigon_by_network")
        
        var forecasts = [Forecast]()
        networkClient.fetch(endPoint: WeatherEndpoint.fetchWeatherData(keyword: keyword),
                            type: ForecastResponse.self,
                            loadFromCache: false) { (response) in
                                switch response {
                                case .success(let data):
                                    forecasts = data.list
                                case .failure(let error):
                                    XCTFail("Fetching data errored: \(error)")
                                }
                                expect.fulfill()
        }
        
        waitForExpectations(timeout: limitTimeOut) { [unowned self] error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            } else {
                XCTAssertFalse(forecasts.isEmpty, "Should load all the data probably.")
                self.testFetchListMobileDataFromCache(retry: 0)
            }
        }
    }
    
    func testFetchListMobileDataFromCache(retry: Int) {
        if retry >= 15 {
            XCTFail("Fetching from cache errored, try to run testcases again because URL cached based on the params")
            return
        }
        networkClient.fetch(endPoint: WeatherEndpoint.fetchWeatherData(keyword: keyword),
                            type: ForecastResponse.self,
                            loadFromCache: true) { (response) in
                                switch response {
                                case .success(let data):
                                    XCTAssertFalse(data.list.isEmpty, "Should load all the records from cache probably.")
                                case .failure:
                                    self.testFetchListMobileDataFromCache(retry: retry + 1)
                                }
        }
    }
    
    func testNetworkErrorStatusCode() {
        
        let expect = expectation(description: "test_error_by_network")
        
        networkClient.fetch(endPoint: ErrorEndpoint.errorRequest,
                            type: ForecastResponse.self,
                            loadFromCache: false) { (response) in
                                switch response {
                                case .success:
                                    XCTFail("This request shoud be failed.")
                                case .failure(let error):
                                    XCTAssertTrue(error.localizedDescription == NetworkError.noSuccessResponse(code: "401").localizedDescription, "Should return invalid response.")
                                }
                                expect.fulfill()
        }
        
        waitForExpectations(timeout: limitTimeOut * 5) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }
}



