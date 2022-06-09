//
//  CategoryListViewController.swift
//  Not Bored Alkemy
//
//  Created by Mariano Julian Allisio on 07/06/2022.
//

import UIKit

class CategoryListViewController: UITableViewController {
    
    var coordinator: CategoryListCoordinator!
    var numOfPeople: Int?
    var priceValue: Float
    
    init(numOfPeople: Int?, priceValue: Float) {
        self.numOfPeople = numOfPeople
        self.priceValue = priceValue
        
        super.init(nibName: "CategoryListViewController", bundle: Bundle.main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var categoryList: [Category] {
        return Category.allCases
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        self.navigationController?.configureAppareance()
        self.navigationController?.setBackButtonTitle("")
        self.title = "Activities"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "🔀", style: .plain, target: self, action: #selector(randomPressed))
        registerCells()
    }
    
    func registerCells(){
        // Instanciar los nibs de TableCell
        for category in categoryList {
            tableView.register(UINib(nibName: "TableCell", bundle: nil), forCellReuseIdentifier: category.rawValue)
        }
    }
    
    @objc func randomPressed(){
        coordinator.toSuggestionScreen(numOfPeople: numOfPeople, category: "Random")
    }
}
