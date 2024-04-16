//
//  StringManager.swift
//  001-Calculator-MVC
//
//  Created by Türker Kızılcık on 14.01.2024.
//

import Foundation
import UIKit

class StringManager {

    static let shared: StringManager = .init()

    func appendString(label: UILabel, append: String) {
        label.text?.append(append)
    }
}
