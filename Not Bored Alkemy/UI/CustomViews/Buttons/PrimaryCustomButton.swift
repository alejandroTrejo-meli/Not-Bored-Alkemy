//
//  PrimaryCustomButton.swift
//  Not Bored Alkemy
//
//  Created by Anahi Rojas Quintero on 07/06/22.
//

import UIKit

@IBDesignable class PrimaryCustomButton: UIButton{
    
    var backColor: UIColor?
    
    @IBInspectable var cornerRad: CGFloat = 8 {
        didSet {
           self.layer.cornerRadius = cornerRad
        }
    }
    
    
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                backgroundColor = UIColor.systemBlue
            } else {
                backgroundColor = UIColor.systemGray4
            }
            backColor = backgroundColor
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override func prepareForInterfaceBuilder() {
        setup()
    }
    
    private func setup(){
        backgroundColor = UIColor.systemBlue
        layer.cornerRadius = cornerRad
        tintColor = UIColor.white
        
        heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
}
