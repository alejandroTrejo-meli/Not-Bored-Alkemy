//
//  HomeViewController.swift
//  Not Bored Alkemy
//
//  Created by Alejandro Alejandro Trejo Rodriguez on 06/06/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var participantsTextfield: UITextField!
    @IBOutlet weak var startButton: PrimaryCustomButton!
    
    var coordinator: HomeViewCoordinator!
    
    var numberOfParticipants: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    func setUp(){
        hideKeyboardWhenTappedAround()
        participantsTextfield.delegate = self
    }
    
    
    @IBAction func `continue`(_ sender: Any) {
        coordinator.toActivities(numOfParticipants: numberOfParticipants)
    }
    
    @IBAction func toTermsAndConditions(_ sender: Any) {
        coordinator.toTermsAndConditions()
    }
    
}


extension HomeViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        let userInsertedValue = textField.text
        
        if userInsertedValue == "0" {
            startButton.isEnabled = false
        } else {
            startButton.isEnabled = true
            numberOfParticipants = Int(userInsertedValue!)
        }
        print(numberOfParticipants)
    }
}
