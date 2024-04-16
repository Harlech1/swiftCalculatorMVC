//
//  ViewController+UI.swift
//  001-Calculator-MVC
//
//  Created by Yusuf Demirci on 4.01.2024.
//
// figma desktop / jitter / behance

import UIKit

extension ViewController {
    func setUpHorizontalStackViews() {
        horizontalStackViews = [UIStackView]()

        for _ in 1...numberOfStackViews {
            let stackView = createHorizontalStackView()
            horizontalStackViews.append(stackView)
            view.addSubview(stackView)
        }
    }

    func addSubviews() {
        view.addSubview(verticalStackView)
        view.addSubview(resultLabel)
    }

    func setUpButtons() {
        for (rowIndex, row) in rows.enumerated() {
            verticalStackView.addArrangedSubview(horizontalStackViews[rowIndex])
            for (itemIndex, item) in row.enumerated() {
                createButton(horizontalStackViewIndex: itemIndex, verticalStackViewIndex: rowIndex, color: item.backgroundColor)
            }
        }
    }

    func setUpConstraints() {
        NSLayoutConstraint.activate([
            verticalStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -24),
            verticalStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 8),
            verticalStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -8),

            resultLabel.bottomAnchor.constraint(equalTo: verticalStackView.topAnchor, constant: -8),
            resultLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            resultLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
        ])
    }


    func createButton(horizontalStackViewIndex: Int, verticalStackViewIndex: Int, color: UIColor) {
        var configuration = UIButton.Configuration.plain()
        let button = UIButton(configuration: configuration)
        let attributedString = NSAttributedString(string: "\(rows[verticalStackViewIndex][horizontalStackViewIndex].name)", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 40, weight: UIFont.Weight.semibold),
            NSAttributedString.Key.foregroundColor: UIColor.white
        ])
        button.heightAnchor.constraint(equalToConstant: 88).isActive = true
        button.tag = currentIndex
        /// for zero button && zero button is in the 5th horizontal stackview
        if horizontalStackViewIndex == Int(ButtonTitle.zero.stringValue) && verticalStackViewIndex == (numberOfStackViews)-1 {
            button.widthAnchor.constraint(equalToConstant: 196).isActive = true
            button.contentHorizontalAlignment = .left
            button.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 36, bottom: 0, trailing: 0)
        } else {
            button.widthAnchor.constraint(equalToConstant: 88).isActive = true
        }
        button.itemType = rows[verticalStackViewIndex][horizontalStackViewIndex].self
        button.setAttributedTitle(attributedString, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 40
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40, weight: UIFont.Weight.semibold)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = color

        horizontalStackViews[verticalStackViewIndex].addArrangedSubview(button)
        currentIndex += 1
    }

    func createHorizontalStackView() -> UIStackView {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.distribution = .equalSpacing
        view.axis = .horizontal
        return view
    }

    func configureButton(for button: UIButton, title: String) {
        button.backgroundColor = UIColor.white
        button.setTitleColor(UIColor.systemOrange, for: .normal)
        button.setTitle(title, for: .normal)
    }

    func resetBackgrounds(for horizontalStackViews: [UIStackView]) {
        for horizontalStackView in horizontalStackViews {
            for case let button as UIButton in horizontalStackView.arrangedSubviews {
                if let item = button.itemType {
                    switch item {
                    case .operationType(.plus), .operationType(.minus), .operationType(.multiply), .operationType(.divide), .operationType(.equal):
                            button.backgroundColor = UIColor.systemOrange
                            button.setTitleColor(UIColor.white, for: .normal)
                        default:
                            break
                    }
                }
            }
        }
    }
}


