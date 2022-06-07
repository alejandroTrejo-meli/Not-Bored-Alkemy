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
    
    func toScreen(numOfPeople: Int, category: String){
        let controller = CategoryListViewController.instance()
        controller.coordinator = CategoryListCoordinator(navigationController: navigationController)
        controller.numOfPeople = numOfPeople
        self.navigationController.pushViewController(controller, animated: true)
    }
}
