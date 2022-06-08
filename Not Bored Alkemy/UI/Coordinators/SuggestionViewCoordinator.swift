//
//  SuggestionViewCoordinator.swift
//  Not Bored Alkemy
//
//  Created by Alejandro Alejandro Trejo Rodriguez on 07/06/22.
//

import UIKit


class SuggestionViewCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func toCategoryScreen(numOfPeople: Int?){
        self.navigationController.popViewController(animated: true)
    }
}
