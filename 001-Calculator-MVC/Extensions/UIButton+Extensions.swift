//
//  UIButton+Extensions.swift
//  001-Calculator-MVC
//
//  Created by Türker Kızılcık on 5.01.2024.
//

import UIKit

extension UIButton {
    private struct AssociatedKeys {
        static var itemType = "itemType"
    }

    var itemType: ItemType? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.itemType) as? ItemType
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.itemType, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
