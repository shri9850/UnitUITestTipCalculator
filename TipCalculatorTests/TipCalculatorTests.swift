//
//  TipCalculatorTests.swift
//  TipCalculatorTests
//
//  Created by skotakal on 3/14/22.
//

import XCTest

class When_Calculating_Tip_Based_On_Total_Amount: XCTestCase {

    func test_should_calculate_tip_successfully(){
        let tipcalculator = TipCalculator()
        let result = try! tipcalculator.calculate(total: 100, tipPercentae: 0.1)
        XCTAssertEqual(result, 10)
    }

}
class when_calculating_tip_based_on_negative_total_amount:XCTestCase{
    
    func test_should_throw_invalid_input_exception(){
        let tipcalculator = TipCalculator()
        XCTAssertThrowsError(try tipcalculator.calculate(total: -100, tipPercentae: 0.1)){ error in
            XCTAssertEqual(error as! TipCalculateError, .invalidInput)
        }
    }
}
