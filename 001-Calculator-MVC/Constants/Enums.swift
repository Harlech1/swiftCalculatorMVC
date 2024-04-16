//
//  Enums.swift
//  001-Calculator-MVC
//
//  Created by Yusuf Demirci on 4.01.2024.
//

// operation == systemOrange
// greyOperation == systemGray
// button == systemGray4

import UIKit

enum ItemType {
    case operationType(OperationItemType)
    case numberType(NumberItemType)

    var backgroundColor: UIColor {
        switch self {
        case .operationType(let type):
            return type.backgroundColor
        case .numberType(let type):
            return type.backgroundColor
        }
    }

    var name: String {
        switch self {
        case .operationType(let type):
            return type.name
        case .numberType(let type):
            return type.name
        }
    }
}

enum OperationItemType {
    case plus, minus, multiply, divide, equal // operation = orange
    case clear, plusMinus, percentage // operation == gray

    var backgroundColor: UIColor {
        switch self {
        case .clear, .plusMinus, .percentage: return .systemGray
        case .plus, .minus, .multiply, .divide, .equal: return .systemOrange
        }
    }

    var name: String {
        switch self {
        case .plus: return ButtonTitle.plus.stringValue
        case .minus: return ButtonTitle.minus.stringValue
        case .multiply: return ButtonTitle.multiply.stringValue
        case .divide: return ButtonTitle.divide.stringValue
        case .equal: return ButtonTitle.equal.stringValue
        case .clear: return ButtonTitle.clear.stringValue
        case .plusMinus: return ButtonTitle.plusMinus.stringValue
        case .percentage: return ButtonTitle.percentage.stringValue
        }
    }
}

enum NumberItemType {
    case dot, zero, one, two, three, four, five, six, seven, eight, nine

    var backgroundColor: UIColor {
        .systemGray4
    }

    var name: String {
        switch self {
        case .dot: return ButtonTitle.dot.stringValue
        case .zero: return ButtonTitle.zero.stringValue
        case .one: return ButtonTitle.one.stringValue
        case .two: return ButtonTitle.two.stringValue
        case .three: return ButtonTitle.three.stringValue
        case .four: return ButtonTitle.four.stringValue
        case .five: return ButtonTitle.five.stringValue
        case .six: return ButtonTitle.six.stringValue
        case .seven: return ButtonTitle.seven.stringValue
        case .eight: return ButtonTitle.eight.stringValue
        case .nine: return ButtonTitle.nine.stringValue
        }
    }
}

enum ButtonTitle: Int, CaseIterable {

    case clear = 0
    case plusMinus = 1
    case percentage = 2
    case divide = 3
    case seven = 4
    case eight = 5
    case nine = 6
    case multiply = 7
    case four = 8
    case five = 9
    case six = 10
    case minus = 11
    case one = 12
    case two = 13
    case three = 14
    case plus = 15
    case zero = 16
    case dot = 17
    case equal = 18

    var stringValue: String {
        switch self {
        case .zero:
            return "0"
        case .one:
            return "1"
        case .two:
            return "2"
        case .dot:
            return "."
        case .three:
            return "3"
        case .four:
            return "4"
        case .five:
            return "5"
        case .six:
            return "6"
        case .seven:
            return "7"
        case .eight:
            return "8"
        case .nine:
            return "9"
        case .plus:
            return "+"
        case .minus:
            return "-"
        case .divide:
            return "/"
        case .multiply:
            return "x"
        case .equal:
            return "="
        case .percentage:
            return "%"
        case .clear:
            return "AC"
        case .plusMinus:
            return "+/-"
        }
    }
}
