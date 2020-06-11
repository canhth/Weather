//
//  Forecast.swift
//  Weather
//
//  Created by Canh Tran Wizeline on 6/11/20.
//  Copyright © 2020 CanhTran. All rights reserved.
//

import Foundation

struct Forecast: Decodable {
    let dateTime: Int
    let temp: Temperature
    let pressure: Int
    let humidity: Int
    let weather: [Weather]
    let speed: Float
}
