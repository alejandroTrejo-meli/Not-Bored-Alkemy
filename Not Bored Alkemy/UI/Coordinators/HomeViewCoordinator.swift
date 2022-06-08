//
//  HomeViewCoordinator.swift
//  Not Bored Alkemy
//
//  Created by Alejandro Alejandro Trejo Rodriguez on 06/06/22.
//

import UIKit


class HomeViewCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func toCategories(numOfPeople: Int?){
        var vc = CategoryListViewController(numOfPeople: numOfPeople)
        vc.numOfPeople = numOfPeople
        navigationController.pushViewController(vc, animated: true)
        
    }

    
    func toTermsAndConditions(){
        let vc = TermsAndConditionsVC.instance()
        vc.modalPresentationStyle = .overFullScreen
        navigationController.present(vc, animated: true)
    }
}
