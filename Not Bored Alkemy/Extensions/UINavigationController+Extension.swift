//
//  UINavigationController+Extension.swift
//  Not Bored Alkemy
//
//  Created by Alejandro Alejandro Trejo Rodriguez on 07/06/22.
//

import UIKit

extension UINavigationController {
    func setBackButtonTitle(_ title: String) {
        if self.navigationBar.topItem != nil {
            let leftBarButtonItem: UIBarButtonItem = UIBarButtonItem(title: title, style: UIBarButtonItem.Style.plain, target: self, action: nil)
            self.navigationBar.topItem?.backBarButtonItem = leftBarButtonItem
        } else {
            if self.navigationBar.backItem != nil {
                self.navigationBar.backItem?.title = title
            }
        }
    }
    
    func configureAppareance() {
        self.navigationBar.tintColor = UIColor.black
        self.navigationBar.backgroundColor = UIColor(white: 1, alpha: 0.0)
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black,
                                                                        NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 25)]
    }
}
