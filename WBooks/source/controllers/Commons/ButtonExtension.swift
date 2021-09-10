//
//  ButtonExtension.swift
//  WBooks
//
//  Created by noelia.nieres on 10/09/2021.
//
import UIKit

extension UIButton {
        
    func blueGradientBackground() {
        let blueColors = [
            UIColor.blueFirstGradient().cgColor,
            UIColor.blueSecondGradient().cgColor]
        applyGradient(with: blueColors)
    }
    
    func applyGradient(with colors: [CGColor]) {
        self.backgroundColor = nil
        self.layoutIfNeeded()
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0.06, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        //gradientLayer.locations = [0,1]
        gradientLayer.frame = self.bounds

        self.layer.insertSublayer(gradientLayer, at: 0)
        self.contentVerticalAlignment = .center
        self.setTitleColor(UIColor.white, for: .normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17.0)
        self.titleLabel?.textColor = UIColor.white
    }
}
