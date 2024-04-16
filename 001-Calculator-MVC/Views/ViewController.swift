//
//  ViewController.swift
//  001-Calculator-MVC
//
//  Created by Türker Kızılcık on 27.12.2023.
//

import UIKit

class ViewController: UIViewController {

    private var firstNumber: Double?
    private var currentOperation: ButtonTitle?
    private let buttonTitleArray: [ButtonTitle] = ButtonTitle.allCases
    var horizontalStackViews: [UIStackView] = []
    let numberOfStackViews = Constants.numberOfHorizontalStackViews
    var currentIndex = 0

    var verticalStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.spacing = 10
        view.distribution = .fillEqually
        view.axis = .vertical
        return view
    }()

    var resultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 60)
        /// initalization is necessary for appending numbers in resultLabel
        label.text = ""
        label.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return label
    }()

    let rows: [[ItemType]] = [
        [.operationType(.clear), .operationType(.plusMinus), .operationType(.percentage), .operationType(.divide),], // row 1
        [.numberType(.seven), .numberType(.eight), .numberType(.nine), .operationType(.multiply)], // row 2
        [.numberType(.four), .numberType(.five), .numberType(.six), .operationType(.minus)], // row 3
        [.numberType(.one), .numberType(.two), .numberType(.three), .operationType(.plus)], // row 4
        [.numberType(.zero), .numberType(.dot), .operationType(.equal)], // row 5
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setUpHorizontalStackViews()
        setUpButtons()
        setUpConstraints()
    }

    // MARK: Button Functions
    @objc func buttonTapped(_ sender: UIView) {
        guard let button = sender as? UIButton else { return }
        resetBackgrounds(for: horizontalStackViews)

        let buttonTitle = buttonTitleArray[button.tag]

        /// ask here
        guard
            let currentText = resultLabel.text
        else { return }

        switch buttonTitle {
        case .dot:
            if !currentText.contains(buttonTitle.stringValue) {
                StringManager.shared.appendString(label: resultLabel, append: buttonTitle.stringValue)
            }
        case .zero:
            if currentText != buttonTitle.stringValue {
                StringManager.shared.appendString(label: resultLabel, append: buttonTitle.stringValue)
            }
        case .one, .two, .three, .four , .five, .six, .seven, .eight, .nine:
            guard
                let number = Int(buttonTitle.stringValue)
            else { return }

            CalculationManager.shared.appendNumber(number, label: resultLabel)

        case .plus, .minus, .multiply, .divide:
            performOperation(buttonTitle, for: button)
        case .equal:
            guard
                let operation = currentOperation,
                let first = firstNumber,
                let second = Double(currentText)
            else { return }

            var result: Double = 0.0
            
            switch operation {
            case .plus:
                result = CalculationManager.shared.addition(first, second)
            case .minus:
                result = CalculationManager.shared.subtraction(first, second)
            case .multiply:
                result = CalculationManager.shared.multiplication(first, second)
            case .divide:
                result = CalculationManager.shared.division(first, second)
            default:
                break
            }
            /// If a number has truncating numbers show it as it is an integer.
            if CalculationManager.shared.isConvertibleToInt(input: result) {
                resultLabel.text = String(Int(result))
            } else {
                resultLabel.text = String(result)
            }

            currentOperation = nil
            firstNumber = nil

        case .plusMinus:
            if !currentText.contains(ButtonTitle.minus.stringValue) {
                resultLabel.text = ButtonTitle.minus.stringValue + currentText
            } else {
                guard
                    let range = currentText.range(of: ButtonTitle.minus.stringValue)
                else { return }

                let updatedText = currentText.replacingCharacters(in: range, with: "")
                resultLabel.text = updatedText
            }
        case .percentage:
            guard
                let currentValue = Double(currentText)
            else { return }

            let result = currentValue / 100.0

            if CalculationManager.shared.isConvertibleToInt(input: result) {
                resultLabel.text = String(Int(result))
            } else {
                resultLabel.text = String(result)
            }
        case .clear:
            resultLabel.text = ""
        }
    }

    private func performOperation(_ operation: ButtonTitle, for button: UIButton) {
        configureButton(for: button, title: operation.stringValue)

        switch operation {
        case .plus, .minus, .multiply, .divide:
            currentOperation = operation
        default:
            break
        }

        guard
            let currentText = resultLabel.text,
            let number = Double(currentText)
        else { return }

        firstNumber = number
        resultLabel.text = ""
    }

    
}
