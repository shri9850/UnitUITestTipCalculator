//
//  TipCalculatorUITests.swift
//  TipCalculatorUITests
//
//  Created by skotakal on 3/14/22.
//

import XCTest

class when_content_view_is_shown: XCTestCase {
    private var app: XCUIApplication!
    private var contentViewPage: ContentViewPage!
    override func setUp() {
        let app = XCUIApplication()
        contentViewPage = ContentViewPage(app: app)
        continueAfterFailure = false
        app.launch()
    }
    func test_textfield_should_shown_default_value(){
        XCTAssertEqual(contentViewPage.totalTextField.value as! String, "Enter total")
    }
    func test_should_default_20_percentage_option_is_selected(){
        let seggmeentedButton = contentViewPage.segmentedControl.buttons.element(boundBy: 1)
        XCTAssertEqual(seggmeentedButton.label, "20%")
        XCTAssertTrue(seggmeentedButton.isSelected)
    }
}
class when_calculate_tip_buttonn_pressed_valid_input: XCTestCase {
    private var app: XCUIApplication!
    private var contentVieewPage: ContentViewPage!
    override func setUp() {
        app = XCUIApplication()
        contentVieewPage = ContentViewPage(app: app)
        continueAfterFailure = false
        app.launch()
       
        let totalTextFields = contentVieewPage.totalTextField
        totalTextFields.tap()
        totalTextFields.typeText("100")
        
        contentVieewPage.calculateBtn.tap()
    }
    
    func test_should_make_sure_tip_displayed_on_button(){
        let tipText = contentVieewPage.tipText
        let _ = tipText.waitForExistence(timeout: 2.0)
        XCTAssertEqual(tipText.label, "$20.00")
    }
    
}

class when_calculate_tip_buttonn_pressed_invalid_input: XCTestCase {
    private var app: XCUIApplication!
    private var contentViewPage: ContentViewPage!
    override func setUp() {
        app = XCUIApplication()
        contentViewPage = ContentViewPage(app: app)
        continueAfterFailure = false
        app.launch()
       
        let totalTextFields = contentViewPage.totalTextField
        totalTextFields.tap()
        totalTextFields.typeText("-100")
        
        contentViewPage.calculateBtn.tap()
    }
    func test_should_display_error_message_for_invalid_input(){
       
        
        let messageText = contentViewPage.message
        let _ = messageText.waitForExistence(timeout: 0.5)
        XCTAssertEqual(messageText.label, "Invalid Input")
    }
    
    func test_should_clear_tip_for_invalid_input(){
       
        let tipText = contentViewPage.tipText
        let _ = tipText.waitForExistence(timeout: 0.5)
        
        XCTAssertEqual(tipText.label, "")
    }
}
