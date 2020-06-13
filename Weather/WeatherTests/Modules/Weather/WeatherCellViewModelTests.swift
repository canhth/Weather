//
//  WeatherCellViewModelTests.swift
//  WeatherTests
//
//  Created by Canh Tran Wizeline on 6/13/20.
//  Copyright © 2020 CanhTran. All rights reserved.
//

import XCTest
@testable import Weather

final class WeatherCellViewModelTests: WeatherTests {
    
    let forecast = Forecast(dateTime: 1592057102,
                            temp: Temperature(min: 26, max: 30),
                            pressure: 1020,
                            humidity: 67,
                            weather: [Weather(id: 001, main: "", description: "heavy rain", icon: "")],
                            speed: 300)
    
    func test_Weather_ViewModel() {
        let viewModel = WeatherCellViewModel(forecast: forecast)
        
        XCTAssertEqual(viewModel.dateTime, "Date: Sat, 13 June 2020")
        XCTAssertEqual(viewModel.avgTemp, "Average Temperature: 28°C")
        XCTAssertEqual(viewModel.pressure, "Pressure: 1020")
        XCTAssertEqual(viewModel.humidity, "Humidity: 67%")
        XCTAssertEqual(viewModel.description, "Description: heavy rain")
    }
    
}
