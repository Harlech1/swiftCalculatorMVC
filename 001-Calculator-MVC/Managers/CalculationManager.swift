//
//  CalculationManager.swift
//  001-Calculator-MVC
//
//  Created by Yusuf Demirci on 7.01.2024.
//

import Foundation
import UIKit

class CalculationManager {

    static let shared: CalculationManager = .init()

    func appendNumber(_ number: Int, label: UILabel) {
        label.text?.append("\(number)")
    }

    func addition(_ first: Double, _ second: Double) -> Double {
        return first + second
    }

    func subtraction(_ first: Double, _ second: Double) -> Double {
        return first - second
    }

    func multiplication(_ first: Double, _ second: Double) -> Double {
        return first * second
    }

    func division(_ first: Double, _ second: Double) -> Double {
        return first / second
    }

    func isConvertibleToInt(input: Double) -> Bool {
        if input.truncatingRemainder(dividingBy: 1) == 0 {
            return true
        } else {
            return false
        }
    }
}
