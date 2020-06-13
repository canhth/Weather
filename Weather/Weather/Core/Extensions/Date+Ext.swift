//
//  Date+Ext.swift
//  Weather
//
//  Created by Canh Tran Wizeline on 6/12/20.
//  Copyright © 2020 CanhTran. All rights reserved.
//

import Foundation

enum DateConverterType: String {
    case prettyDateTime = "EE, dd MMMM yyyy"
}

extension Date {
    
    static func convertDateToString(timeStamp: Double) -> String {
        let date = Date(timeIntervalSince1970: timeStamp)
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.calendar = .current
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = DateConverterType.prettyDateTime.rawValue
        return formatter.string(from: date)
    }
}
