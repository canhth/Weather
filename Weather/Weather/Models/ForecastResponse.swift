//
//  WeatherResponse.swift
//  Weather
//
//  Created by Canh Tran Wizeline on 6/11/20.
//  Copyright © 2020 CanhTran. All rights reserved.
//

import Foundation

struct ForecastResponse: Decodable {
    let city: City
    let cnt: Int
    let list: [Forecast]
}
