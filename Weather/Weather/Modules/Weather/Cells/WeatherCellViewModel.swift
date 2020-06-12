//
//  WeatherCellViewModel.swift
//  Weather
//
//  Created by Canh Tran Wizeline on 6/11/20.
//  Copyright © 2020 CanhTran. All rights reserved.
//

import Foundation

struct WeatherCellViewModel {
    let dateTime: String
    let avgTemp: String
    let pressure: String
    let humidity: String
    let description: String
    
    init(forecast: Forecast) {
        dateTime = ""
        avgTemp = ""
        pressure = ""
        humidity = ""
        description = ""
    }
}
