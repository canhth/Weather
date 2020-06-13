//
//  WeatherCellTests.swift
//  WeatherTests
//
//  Created by Canh Tran Wizeline on 6/13/20.
//  Copyright © 2020 CanhTran. All rights reserved.
//

import XCTest
@testable import Weather

final class WeatherCellTests: WeatherTests {
    
    let forecast = Forecast(dateTime: 1592057102,
                            temp: Temperature(min: 26, max: 30),
                            pressure: 1020,
                            humidity: 67,
                            weather: [Weather(id: 001, main: "", description: "heavy rain", icon: "")],
                            speed: 300)
    
    func test_Weather_Cell() {
        let cell = WeatherCell(style: .default, reuseIdentifier: WeatherCell.typeName)
        cell.configCell(with: forecast)
        
        XCTAssertEqual(cell.contentView.subviews.count, 6)
    }
    
}
