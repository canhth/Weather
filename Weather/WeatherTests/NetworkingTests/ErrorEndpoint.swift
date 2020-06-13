//
//  ErrorEndpoint.swift
//  WeatherTests
//
//  Created by Canh Tran Wizeline on 6/13/20.
//  Copyright © 2020 CanhTran. All rights reserved.
//

import Foundation
@testable import Weather

enum ErrorEndpoint {
    case errorRequest
}

// MARK: Confirm protocol Endpoint

extension ErrorEndpoint: APIEndpoint {
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        return "data/2.5/forecast/daily/error"
    }
    
    var parameters: Parameters? {
        return nil
    }
}
