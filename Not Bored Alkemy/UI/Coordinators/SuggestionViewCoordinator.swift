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
        let vc = CategoryListViewController.init(numOfPeople: numOfPeople)
        vc.coordinator = CategoryListCoordinator(navigationController: navigationController)
        self.navigationController.pushViewController(vc, animated: true)
    }
}
