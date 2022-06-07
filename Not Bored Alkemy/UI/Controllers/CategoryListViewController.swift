//
//  CategoryListViewController.swift
//  Not Bored Alkemy
//
//  Created by Mariano Julian Allisio on 07/06/2022.
//

import UIKit

class CategoryListViewController: UITableViewController {
    
    var coordinator: CategoryListCoordinator!
    var numOfPeople: Int!
    
    var categoryList: [Category] {
        return Category.allCases
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI(){
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
        coordinator.toScreen(numOfPeople: numOfPeople, category: "Random")
    }
}

// MARK: Table functions
extension CategoryListViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier: String = categoryList[indexPath.row].rawValue
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! TableCell
        cell.title.text = identifier
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = self.tableView.cellForRow(at: indexPath) as? TableCell, let category = cell.title.text {
            coordinator.toScreen(numOfPeople: 1, category: category)
        }
    }
}
