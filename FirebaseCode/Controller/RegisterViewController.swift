//
//  RegisterViewController.swift
//  FirebaseCode
//
//  Created by Mohamad Shawal Sapuan Bin Mohamad on 17/01/2025.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func isValidEmail(emailStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: emailStr)
    }
    
    @IBAction func registerAction(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text, !email.isEmpty, !password.isEmpty {
            print("Register email:\(email), password:\(password)")
            
            if !isValidEmail(emailStr: email) {
                let alertVC = UIAlertController(title: "Error", message: "Invalid email address!", preferredStyle: .alert)
                alertVC.addAction(UIAlertAction(title: "OK", style: .cancel))
                self.present(alertVC, animated: true)
            } else {
                Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                    if let e = error {
                        let alertVC = UIAlertController(title: "Error", message: e.localizedDescription, preferredStyle: .alert)
                        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel))
                        self.present(alertVC, animated: true)
                    } else {
                        let alertVC = UIAlertController(title: "Success", message: "Registration Successful!", preferredStyle: .alert)
                        let action = UIAlertAction(title: "OK", style: .cancel) { alert in
                            self.dismiss(animated: true)
                        }
                        alertVC.addAction(action)
                        self.present(alertVC, animated: true)
                    }
                }
            }
        } else {
            let alertVC = UIAlertController(title: "Error", message: "Please enter Email/Password!", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel))
            self.present(alertVC, animated: true)
        }
    }
    

}
