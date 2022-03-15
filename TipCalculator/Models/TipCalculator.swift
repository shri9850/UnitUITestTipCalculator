//
//  TipCalculator.swift
//  TipCalculator
//
//  Created by skotakal on 3/14/22.
//

import Foundation
import SwiftUI

enum TipCalculateError: Error{
    case invalidInput
}
class TipCalculator {
    func calculate(total:Double, tipPercentae: Double) throws -> Double{
        if total < 0{
           throw TipCalculateError.invalidInput
        }
        return total * tipPercentae
    }
    
}
