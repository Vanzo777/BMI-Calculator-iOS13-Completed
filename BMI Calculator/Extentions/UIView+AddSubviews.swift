//
//  UIView+AddSubviews.swift
//  BMI Calculator
//
//  Created by Иван Федосеев on 27.03.2024.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import UIKit

extension UIView {
     func addSubviews(_ views: UIView...){
        views.forEach({ addSubview($0) })
    }
}
