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
    
    @IBOutlet weak var minPriceStepper: UIStepper!
    @IBOutlet weak var minPriceLabel: UILabel!
    
    @IBOutlet weak var maxPriceLabel: UILabel!
    @IBOutlet weak var maxPriceStepper: UIStepper!
    
    
    var coordinator: HomeViewCoordinator!
    var didCheckTerms = false
    var numberOfParticipants: Int?
    var defaults = UserDefaults.standard
    var minPriceValue: Float = 0.0
    var maxPriceValue: Float = 0.0
    
    
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
        minPriceStepper.wraps = true
        minPriceStepper.autorepeat = true
        minPriceStepper.stepValue = 0.1
        minPriceStepper.minimumValue = 0
        minPriceLabel.text = String(minPriceStepper.value)
        
        maxPriceStepper.wraps = true
        maxPriceStepper.autorepeat = true
        maxPriceStepper.stepValue = 0.1
        maxPriceStepper.minimumValue = 0
        maxPriceLabel.text = String(maxPriceStepper.value)
    }
    
    
    func checkUserPreferences(){
        didCheckTerms = defaults.bool(forKey: "DidCheckTerms")
        startButton.isEnabled = didCheckTerms
        changeCheckButtonAppearence()
    }
    
    
    @IBAction func `continue`(_ sender: Any) {
        if validateStepperInfo(){
            defaults.set(didCheckTerms, forKey: "DidCheckTerms")
            coordinator.toCategories(numOfPeople: numberOfParticipants, minPriceValue: minPriceValue, maxPriceValue: maxPriceValue)
        } else {
            showAlert()
        }
    }
    
    
    @IBAction func toTermsAndConditions(_ sender: Any) {
        coordinator.toTermsAndConditions()
    }
    
    
    @IBAction func minStepperValueChanged(_ sender: UIStepper) {
        let value = Float(sender.value)
        // To avoid floating point errors (i.e show 1....^-16 instead of 0)
        let roundedValue = Float(round(100 * value) / 100)
        minPriceLabel.text = String(roundedValue)
        minPriceValue = roundedValue
        print(sender)
    }
    
    
    @IBAction func maxStepperValueChanged(_ sender: UIStepper) {
        let value = Float(sender.value)
        // To avoid floating point errors (i.e show 1....^-16 instead of 0)
        let roundedValue = Float(round(100 * value) / 100)
        maxPriceLabel.text = String(roundedValue)
        maxPriceValue = roundedValue
        print(roundedValue)
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
    
    
    func validateStepperInfo() -> Bool{
        
        if String(minPriceValue).count != 3 || String(maxPriceValue).count != 3{
            return false
        } else {
            
            if minPriceValue > maxPriceValue {
                (minPriceValue, maxPriceValue) = (maxPriceValue, minPriceValue)
            }
            
            return true
        }
    }
    
    
    func showAlert(){
        let alert = UIAlertController(title: "Error", message: "Price range is not valid. Try again.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { alert in
            return
        }))
        
        self.present(alert, animated: true)
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
