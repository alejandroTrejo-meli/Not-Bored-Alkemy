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
    @IBOutlet weak var tryAnotherButton: PrimaryCustomButton!
    
    var coordinator: SuggestionViewCoordinator!
    var category: String
    var numOfPeople: Int?
    var minPrice: Float
    var maxPrice: Float
    
    // MARK: - Initialization
    
    init(category: String, numOfPeople: Int?, minPrice: Float, maxPrice: Float) {
        self.category = category.lowercased()
        self.numOfPeople = numOfPeople
        self.minPrice = minPrice
        self.maxPrice = maxPrice
        super.init(nibName: "SuggestionViewController", bundle: Bundle.main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationController()
        configureStackView()
        getActivity()
    }
    
    @IBAction func tryAnotherButtonAction(_ sender: Any) {
        getActivity()
    }
    func configureNavigationController() {
        self.navigationController?.configureAppareance()
        self.navigationController?.setBackButtonTitle("")
    }
    
    func configureItems(activity: Activity) {
        activityTitleLbl.text = activity.activity
        self.title = category.firstCapitalized
        priceLbl.text = getActivityRange(with: activity).rawValue
        categoryLbl.text = String(activity.type.firstCapitalized)
        numberOfParticipantsLbl.text = String(activity.participants)
    }
    
    func configureStackView() {
        categoryStackView.isHidden = category == "random" ? false : true
    }
    
    func getActivity() {
        
        NetworkManager.shared.performRequest(with: category, numOfPeople: numOfPeople, minPrice: minPrice, maxPrice: maxPrice) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
                
            case .success(let activity):
                print(activity)
                self.configureItems(activity: activity)
                
            case .failure(let error):
                self.createAlertView(error: error.errorDescription ?? "Sorry, we could not find any activity.")
            }
        }
    }
    
    func createAlertView(error: String){
        DispatchQueue.main.async {
            self.presentAlertWithTitleAndMessage(title: "Could Not Find Activity", message: error) { [self] stylePressed in
                if stylePressed == "Default" {
                    self.coordinator.toCategoryScreen()
                }
            }
        }
    }
    
    func getActivityRange(with activity: Activity) -> PriceRange {
        if activity.price == 0 {
            return .free
        } else if activity.price > 0 && activity.price <= 0.3 {
            return .low
        } else if activity.price > 0.3 && activity.price <= 0.6 {
            return .medium
        } else {
            return .high
        }
    }
    
}
