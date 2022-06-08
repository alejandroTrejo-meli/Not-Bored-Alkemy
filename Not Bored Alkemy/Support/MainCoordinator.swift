//
//  MainCoordinator.swift
//  Not Bored Alkemy
//
//  Created by Alejandro Alejandro Trejo Rodriguez on 06/06/22.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
<<<<<<< HEAD
            
        let vc = SuggestionViewController.init(category: "Random", numOfPeople: 2)
        vc.coordinator = SuggestionViewCoordinator(navigationController: navigationController)
        
=======

        //let vc = HomeViewController.instance()
        //vc.coordinator = HomeViewCoordinator(navigationController: navigationController)

        let vc = CategoryListViewController(numOfPeople: nil)
        vc.coordinator = CategoryListCoordinator(navigationController: navigationController)
>>>>>>> main
        navigationController.pushViewController(vc, animated: true)
    }
}
