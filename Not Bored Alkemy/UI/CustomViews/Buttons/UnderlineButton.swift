//
//  UnderlineButton.swift
//  Not Bored Alkemy
//
//  Created by Anahi Rojas Quintero on 07/06/22.
//

import UIKit

@IBDesignable class UnderlineButton: UIButton {
    
    @IBInspectable var titleColor: UIColor = UIColor.black {
        didSet {
            setup()
        }
    }
    
    @IBInspectable var size: CGFloat = 16.0 {
        didSet {
            setup()
        }
    }
    
    @IBInspectable var title: String = "Title" {
        didSet {
            setup()
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
        backgroundColor = UIColor.clear
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: size),
            .foregroundColor: titleColor,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        
        let attributeString = NSMutableAttributedString(
            string: title ,
            attributes: attributes
        )
        setAttributedTitle(attributeString, for: .normal)
        heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
}

