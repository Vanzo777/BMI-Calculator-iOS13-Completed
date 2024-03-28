//
//  UICalculation.swift
//  BMI Calculator
//
//  Created by Иван Федосеев on 28.03.2024.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import UIKit


extension UIColor {
    convenience init(hex: String) {
        let hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)

        if hexString.hasPrefix("#") {
            scanner.currentIndex = hexString.index(after: hexString.startIndex)
        }

        var color: UInt64 = 0
        scanner.scanHexInt64(&color)

        let mask = 0x000000FF
        let redMask = Int(color >> 16) & mask
        let greenMask = Int(color >> 8) & mask
        let blueMask = Int(color) & mask

        let red = CGFloat(redMask) / 255.0
        let green = CGFloat(greenMask) / 255.0
        let blue = CGFloat(blueMask) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: 1)
    }
}
