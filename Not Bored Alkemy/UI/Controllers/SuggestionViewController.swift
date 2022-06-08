//
//  SuggestionViewController.swift
//  Not Bored Alkemy
//
//  Created by Alejandro Alejandro Trejo Rodriguez on 07/06/22.
//

import UIKit

class SuggestionViewController: UIViewController {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var activityTitleLbl: UILabel!
    @IBOutlet weak var numberOfParticipantsLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var categoryStackView: UIStackView!
    @IBOutlet weak var categoryLbl: UILabel!
    
    var coordinator: SuggestionViewCoordinator!
    var category: String
    var numOfPeople: Int
    
    // MARK: - Initialization
    
    init(category: String, numOfPeople: Int) {
        self.category = category
        self.numOfPeople = numOfPeople
        
        super.init(nibName: "SuggestionViewController", bundle: Bundle.main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getActivity()
        configureNavigationController()
        configureStackView()
    }
    
    func configureNavigationController() {
        self.navigationController?.configureAppareance()
        self.navigationController?.setBackButtonTitle("")
    }
    
    func configureItems(activity: Activity) {
        activityTitleLbl.text = activity.activity
        self.title = category
        priceLbl.text = getActivityRange(with: activity)
        categoryLbl.text = String(activity.type.firstCapitalized)
    }
    
    func configureStackView() {
        categoryStackView.isHidden = category == "Random" ? false : true
    }
    
    func getActivity() {
        NetworkManager.shared.performRequest(with: category, numOfPeople: numOfPeople) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
                
            case .success(let activity):
                print(activity)
                self.configureItems(activity: activity)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getActivityRange(with activity: Activity) -> String {
        if activity.price == 0 {
            return "Free"
        } else if activity.price > 0 && activity.price <= 0.3 {
            return "Low"
        } else if activity.price > 0.3 && activity.price <= 0.6 {
            return "Medium"
        } else {
            return "High"
        }
    }
    
}
