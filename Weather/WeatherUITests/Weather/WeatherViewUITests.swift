//
//  WeatherUITests.swift
//  WeatherUITests
//
//  Created by Canh Tran Wizeline on 6/13/20.
//  Copyright © 2020 CanhTran. All rights reserved.
//

import XCTest

final class WeatherViewUITests: BaseUITest {
    
    // MARK: - Test cases
    
    func test_Input_Correct_Keyword_Success() {
        
        let tableView = app.tables.firstMatch
        waitUntilElementExists(tableView)
        
        let searchField = app.searchFields.element(boundBy: 0)
        waitUntilElementExists(searchField)
        searchField.clearAndEnterText("saigon")
        
        sleep(3)
        tableView.swipeUp()
        XCTAssertTrue(tableView.cells.count >= 5, "Number of cell should be more than 5")
    }
    
    func test_Input_Correct_Keyword_Success_And_Refresh() {
        
        test_Input_Correct_Keyword_Success()
        refreshControl()
    }
    
    func test_Input_Wrong_Keyword_Failed() {
        
        let searchField = app.searchFields.element(boundBy: 0)
        waitUntilElementExists(searchField)
        searchField.clearAndEnterText("abcdef")
        
        
        let tableView = app.tables.firstMatch
        waitUntilElementExists(tableView)
        sleep(3)
        tableView.swipeUp()
        
        XCTAssertTrue(tableView.cells.count == 0, "Number of cell should be empty")
    }
    
    func refreshControl() {
        let tableView = app.tables.firstMatch
        let firstCell = tableView.cells.firstMatch
        
        let coordinate = firstCell.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
        let bottom = firstCell.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 10))
        coordinate.press(forDuration: 0, thenDragTo: bottom)
        
        sleep(3)
        
        XCTAssertTrue(tableView.cells.count >= 1, "Should reload list data.")
    }
}
