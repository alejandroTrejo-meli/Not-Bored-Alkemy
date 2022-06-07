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

        let vc = HomeViewController.instance()
        vc.coordinator = HomeViewCoordinator(navigationController: navigationController)

        //let vc = CategoryListViewController.instance()
        //vc.coordinator = CategoryListCoordinator(navigationController: navigationController)
        navigationController.pushViewController(vc, animated: true)
    }
}
