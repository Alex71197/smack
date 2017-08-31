//
//  GradientView.swift
//  smack
//
//  Created by Alex Villacres on 8/30/17.
//  Copyright © 2017 Alex Villacres. All rights reserved.
//

import UIKit

// IBDesignable allows you to work in Storyboard
@IBDesignable
class GradientView: UIView {

    // Inspectable variables of topColor and bottomColor to be able to manipulate colors
    @IBInspectable var topColor: UIColor = #colorLiteral(red: 0.2901960784, green: 0.3019607843, blue: 0.8470588235, alpha: 1) {
        didSet {
            self.setNeedsLayout()
        }
    }
    // Inspectable variables of topColor and bottomColor to be able to manipulate colors
    @IBInspectable var bottomColor: UIColor = #colorLiteral(red: 0.1725490196, green: 0.831372549, blue: 0.8470588235, alpha: 1) {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    // Called whenever we change a variable ^
    override func layoutSubviews() {
        let gradientLayer = CAGradientLayer()
        
        // Set layer colors to our dynamic color variables
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        // Need to select a start point being top left of (0,0)
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        // Need to select a start point being bottom right of (1,1)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        // set the subView layer (gradientLayer) to the same size as the UIView
        gradientLayer.frame = self.bounds
        // Create that layer
        self.layer.insertSublayer(gradientLayer, at: 0)
        
    }

}
