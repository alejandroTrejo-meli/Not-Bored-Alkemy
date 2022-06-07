//
//  SuggestionViewController.swift
//  Not Bored Alkemy
//
//  Created by Alejandro Alejandro Trejo Rodriguez on 07/06/22.
//

import UIKit

class SuggestionViewController: UIViewController {

    
    var coordinator: SuggestionViewCoordinator!
    var mode: String
    
    // MARK: - Initialization

    init(mode: String) {
        // Set Notes
        self.mode = mode

        super.init(nibName: "SuggestionViewController", bundle: Bundle.main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getActivity()
    }
    
    func getActivity() {
        NetworkManager.shared.performRequest(with: "http://www.boredapi.com/api/activity/") { [weak self] result in
            guard let self = self else { return }
            
            switch result {
                
            case .success(let activity):
                print(activity)
            case .failure(let error):
                print(error)
            }
        }
    }

}
