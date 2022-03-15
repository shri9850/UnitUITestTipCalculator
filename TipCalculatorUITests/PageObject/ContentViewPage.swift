//
//  ContentViewPage.swift
//  TipCalculatorUITests
//
//  Created by skotakal on 3/14/22.
//

import Foundation
import XCTest
import SwiftUI

class ContentViewPage{
    
    let app: XCUIApplication
    
    init(app: XCUIApplication){
        self.app = app
    }
    var totalTextField: XCUIElement {
        app.textFields["totalTextfield"]
    }
    var segmentedControl: XCUIElement{
        app.segmentedControls["tipPercentageSegmentedController"]
    }
    var calculateBtn: XCUIElement{
        app.buttons["calculateTipButton"]
    }
    var tipText:XCUIElement{
        app.staticTexts["TipText"]
    }
    
    var message: XCUIElement{
        app.staticTexts["messageText"]
    }
}
