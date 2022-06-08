//
//  CategoryListViewController+Extension.swift
//  Not Bored Alkemy
//
//  Created by Mariano Julian Allisio on 08/06/2022.
//

import UIKit

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
            coordinator.toSuggestionScreen(numOfPeople: numOfPeople, category: category)
        }
    }
}
