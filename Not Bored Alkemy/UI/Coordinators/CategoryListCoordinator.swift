//
//  CategoryListCoordinator.swift
//  Not Bored Alkemy
//
//  Created by Mariano Julian Allisio on 07/06/2022.
//

import UIKit


class CategoryListCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func toSuggestionScreen(numOfPeople: Int?, category: String){
        //let vc = SuggestionViewController.init(category: category, numOfPeople: numOfPeople)
        //vc.coordinator = SuggestionViewCoordinator(navigationController: navigationController)
        //self.navigationController.pushViewController(controller, animated: true)
    }
}
