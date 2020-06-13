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
        dateTime = "Date: " + Date.convertDateToString(timeStamp: forecast.dateTime)
        let avgTemperature = Int((forecast.temp.min + forecast.temp.max) / 2)
        avgTemp = "Average Temperature: \(avgTemperature)°C"
        pressure = "Pressure: \(forecast.pressure)"
        humidity = "Humidity: \(forecast.humidity)%"
        
        // Let's select the first value as the default one first.
        if let weather = forecast.weather.first {
            description = "Description: \(weather.description)"
        } else {
            description = "Description: Updating"
        }
    }
}
