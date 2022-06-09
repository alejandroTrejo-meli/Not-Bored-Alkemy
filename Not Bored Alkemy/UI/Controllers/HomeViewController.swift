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
    
    @IBOutlet weak var priceStepper: UIStepper!
    @IBOutlet weak var priceLabel: UILabel!
    
    var coordinator: HomeViewCoordinator!
    var didCheckTerms = false
    var numberOfParticipants: Int?
    var defaults = UserDefaults.standard
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    
    func setUp(){
        hideKeyboardWhenTappedAround()
        participantsTextfield.delegate = self
        stepperSetUp()
        checkUserPreferences()
    }
    
    
    func stepperSetUp(){
        priceStepper.wraps = true
        priceStepper.autorepeat = true
        priceStepper.stepValue = 0.1
        priceStepper.minimumValue = 0.0
    }
    
    
    func checkUserPreferences(){
        didCheckTerms = defaults.bool(forKey: "DidCheckTerms")
        startButton.isEnabled = didCheckTerms
        changeCheckButtonAppearence()
    }
    
    
    @IBAction func `continue`(_ sender: Any) {
        defaults.set(didCheckTerms, forKey: "DidCheckTerms")
        coordinator.toCategories(numOfPeople: numberOfParticipants)
    }
    
    
    @IBAction func toTermsAndConditions(_ sender: Any) {
        coordinator.toTermsAndConditions()
    }
    

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        priceLabel.text = Float(sender.value).description
    }
    
    @IBAction func checkButton(_ sender: Any) {
        didCheckTerms = !didCheckTerms
        changeCheckButtonAppearence()
    }
    
    
    func changeCheckButtonAppearence(){
        var tintColor: UIColor
        
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
}
