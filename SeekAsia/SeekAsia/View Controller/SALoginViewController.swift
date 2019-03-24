//
//  SALoginViewController.swift
//  SeekAsia
//
//  Created by Afnan Khan on 3/22/19.
//  Copyright © 2019 Afnan Khan. All rights reserved.
//

import UIKit

class SALoginViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var userNameField:   UITextField!
    @IBOutlet weak var emailField:      UITextField!
    @IBOutlet weak var passwordField:   UITextField!
    @IBOutlet weak var signupButton:    UIButton!
    
    @IBOutlet weak var nameErrorLabel:   UILabel!
    @IBOutlet weak var emailErrorLabel:   UILabel!
    @IBOutlet weak var passwordErrorLabel:UILabel!
    
    
    //MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameField.becomeFirstResponder()
        setVisibilityOfErrorLabels(isHiddel: true)
        
    }
    
    @IBAction func signupButtonClicked(_ sender: UIButton) {
        
        if validateData() ==  true {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {  [weak self ] in
                self?.present((self?.JobListViewController())!, animated: true, completion: nil)
            
            }
        }
    }
    
    
    func validateData() -> Bool{
        
        if userNameField.text == nil || (userNameField.text?.count )! < 5 {
            nameErrorLabel.isHidden = false
            nameErrorLabel.showWithShakeAnimation(withMessage: "User name must have minimum 5 letters")
            return false
        }
        
        if emailField.text ==  nil || emailField.text?.isValidEmail(emailString: emailField.text!) == false{
            emailErrorLabel.isHidden = false
            emailErrorLabel.showWithShakeAnimation(withMessage: "email is invalid")
            return false
        }
        
        if passwordField.text ==  nil || isPasswordValid(passwordField.text!) == false {
            passwordErrorLabel.isHidden = false
            passwordErrorLabel.showWithShakeAnimation(withMessage: "password must have 6 letter with atleast 1 number and 1 ")
            return false
        }
        
        return true
    }
    
    
    func setVisibilityOfErrorLabels(isHiddel _isHidden : Bool){
        nameErrorLabel.isHidden = _isHidden
        emailErrorLabel.isHidden = _isHidden
        passwordErrorLabel.isHidden = _isHidden
        
    }
}


extension  SALoginViewController  : UITextFieldDelegate {// TextField Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // Try to find next responder
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            signupButtonClicked(signupButton)
        }
        // Do not add a line break
        return false
        
    }
    
    @objc func textFieldDidChange(textField:UITextField) {
        setVisibilityOfErrorLabels(isHiddel: false)
    }
    
    func isPasswordValid(_ password : String) -> Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{6,}$")
        return passwordTest.evaluate(with: password)
    }
}


extension UILabel {
    
    func showWithShakeAnimation(withMessage message : String) {
        text = message
        isHidden = false
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: center.x - 10, y: center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: center.x + 10, y: center.y))
        layer.add(animation, forKey: "position")
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.isHidden = true
        }
    }
}


extension String {
    // check email is valid
    func isValidEmail(emailString:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: emailString)
    }
    
}
