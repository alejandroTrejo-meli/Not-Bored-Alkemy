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
    @IBOutlet weak var checkBoxButton: PrimaryCustomButton!
    
    var coordinator: HomeViewCoordinator!
    var didCheckTerms = false
    var numberOfParticipants: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    
    func setUp(){
        hideKeyboardWhenTappedAround()
        participantsTextfield.delegate = self
        startButton.isEnabled = false
    }
    
    
    @IBAction func `continue`(_ sender: Any) {
        coordinator.toCategories(numOfPeople: numberOfParticipants)
    }
    
    
    @IBAction func toTermsAndConditions(_ sender: Any) {
        coordinator.toTermsAndConditions()
    }
    
    
    @IBAction func checkButton(_ sender: Any) {
        var tintColor: UIColor
        
        didCheckTerms = !didCheckTerms
        
        switch didCheckTerms {
        case true:
            tintColor = UIColor.ColorPalette.PrimaryBlue
        case false:
            tintColor = .white
        }
        
        DispatchQueue.main.async {
            self.checkBoxButton.tintColor = tintColor
        }
        
        checkIfCanContinue()
    }
    
    
    func checkIfCanContinue(){
        
        if didCheckTerms{
            if numberOfParticipants != 0 || numberOfParticipants == nil{
                startButton.isEnabled = true
            } else {
                startButton.isEnabled = false
            }
        } else {
            startButton.isEnabled = false
        }
    }
    @IBAction func textChanged(_ sender: UITextField) {
        let userInsertedValue = sender.text
        
        numberOfParticipants = Int(userInsertedValue!)
        checkIfCanContinue()
    }
}


extension HomeViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
//
//    func textFieldDidEndEditing(_ textField: UITextField) {
//
//        let userInsertedValue = textField.text
//
//        numberOfParticipants = Int(userInsertedValue!)
//        //checkIfCanContinue()
//    }
    
}
