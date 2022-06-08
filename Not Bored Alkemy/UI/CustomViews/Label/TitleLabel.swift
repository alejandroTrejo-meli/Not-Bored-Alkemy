//
//  TitleLabel.swift
//  Not Bored Alkemy
//
//  Created by Anahi Rojas Quintero on 07/06/22.
//

import UIKit

@IBDesignable class TitleLabel: UILabel{
    
    var label: UILabel?
    
    @IBInspectable var labelTextColor: UIColor = UIColor.ColorPalette.PrimaryBlue{
        didSet{
            customLabelText()
        }
    }
    
    @IBInspectable var textSize: CGFloat = 32{
        didSet{
            customLabelText()
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customLabelText()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customLabelText()
    }
    
    override func prepareForInterfaceBuilder() {
        customLabelText()
    }
    
    func customLabelText() {
        self.textColor = labelTextColor
        self.font = UIFont.systemFont(ofSize: textSize, weight: .bold)
    }
}
