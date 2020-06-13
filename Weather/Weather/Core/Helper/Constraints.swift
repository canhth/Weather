//
//  Constraints.swift
//  Weather
//
//  Created by Canh Tran Wizeline on 4/10/20.
//  Copyright © 2020 CanhTran. All rights reserved.
//

import UIKit

enum Constraints {
    static let lineHeight: CGFloat = 0.5
    
    static let basePadding: CGFloat = 10
    
    static let paddingX2 = basePadding * 2
    
    static let paddingX3 = basePadding * 3
}

enum AppUserDefault {
    
    static let kLastKeyword = "lastKeyword"
    static let kFontScale = "fontScale"
    
    /// Last keyword
    @UserDefault(kLastKeyword, defaultValue: "")
    static var lastKeyword: String
    
    /// Font scale
    @UserDefault(kFontScale, defaultValue: 1)
    static var fontScale: Float
}
