//
//  City.swift
//  Weather
//
//  Created by Canh Tran Wizeline on 6/11/20.
//  Copyright © 2020 CanhTran. All rights reserved.
//

import Foundation

struct City: Decodable {
    let id: Int
    let name: String
    let country: String
    let timezone: Int
    let population: Int
}
