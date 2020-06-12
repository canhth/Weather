//
//  WeatherEndpoint.swift
//  Weather
//
//  Created by Canh Tran Wizeline on 6/11/20.
//  Copyright © 2020 CanhTran. All rights reserved.
//

import Foundation

enum WeatherEndpoint {
    case fetchWeatherData(keyword: String)
}

// MARK: Confirm protocol Endpoint

extension WeatherEndpoint: APIEndpoint {
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        return "data/2.5/forecast/daily"
    }
    
    var parameters: Parameters? {
        switch self {
        case .fetchWeatherData(let keyword):
            // TODO: Consider to make the parameter as a Codable object.
            return [
                "appid": DefaultNetworkConfiguration.networkConfiguration.appId,
                "q": keyword,
                "units": "metric", // Support metric temporary
                "cnt": 7, // Support 7 days for now.
            ]
        }
    }
}
