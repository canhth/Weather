//
//  Forecast.swift
//  Weather
//
//  Created by Canh Tran Wizeline on 6/11/20.
//  Copyright © 2020 CanhTran. All rights reserved.
//

import Foundation

struct Forecast: Decodable {
    let dateTime: Double
    let temp: Temperature
    let pressure: Int
    let humidity: Int
    let weather: [Weather]
    let speed: Float
    
    private enum CodingKeys: String, CodingKey {
        case dateTime = "dt", temp, pressure, humidity, weather, speed
    }
}
