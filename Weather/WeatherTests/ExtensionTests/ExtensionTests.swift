//
//  ExtensionTests.swift
//  WeatherTests
//
//  Created by Canh Tran Wizeline on 6/13/20.
//  Copyright © 2020 CanhTran. All rights reserved.
//

import XCTest
@testable import Weather

final class ExtensionTests: WeatherTests {
    
    func test_dateConverter_Success() {
        let timestamp1: Double = 1592057102
        let timestamp2: Double = 1591970702
        let expectedString1 = "Sat, 13 June 2020"
        let expectedString2 = "Fri, 12 June 2020"
        
        XCTAssertEqual(expectedString1, Date.convertDateToString(timeStamp: timestamp1), "Time converter should be correct as expected value.")
        XCTAssertEqual(expectedString2, Date.convertDateToString(timeStamp: timestamp2), "Time converter should be correct as expected value.")
    }
    
    func test_Collection_Index() {
        let array = [1, 2, 3]
        XCTAssertEqual(array[safe: 0], 1, "Should be valid.")
    }
    
    func test_Collection_Index_Out_Of_Range() {
        let array = [1, 2, 3]
        XCTAssertEqual(array[safe: 3], nil, "Should be nil if index out of range.")
    }
    
    func test_Dequeue_Reusable_Cell() {
        let tableView = UITableView()
        tableView.register(WeatherCell.self)
        let indexPath = IndexPath(row: 0, section: 0)
        let cell: WeatherCell? = tableView.dequeueReusableCell(for: indexPath)
        
        XCTAssertTrue(cell != nil, "Should generate with the correct type")
        XCTAssertTrue(cell?.typeName == "WeatherCell", "Should generate with the correct type")
    }
}
