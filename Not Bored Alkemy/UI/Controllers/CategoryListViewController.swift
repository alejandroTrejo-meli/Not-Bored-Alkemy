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
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    @objc func randomPressed(){
        print("Random")
        coordinator.toScreen(numOfPeople: numOfPeople, category: nil)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier: String = categoryList[indexPath.row].rawValue
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! TableCell
        cell.title.text = identifier
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = self.tableView.cellForRow(at: indexPath) as? TableCell {
            print(cell.title.text ?? "")
            coordinator.toScreen(numOfPeople: 1, category: cell.title.text)
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}
