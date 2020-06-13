//
//  Weather.swift
//  Weather
//
//  Created by Canh Tran Wizeline on 6/11/20.
//  Copyright © 2020 CanhTran. All rights reserved.
//

import Foundation

struct Weather: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}
