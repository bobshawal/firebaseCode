//
//  LoginViewController.swift
//  FirebaseCode
//
//  Created by Mohamad Shawal Sapuan Bin Mohamad on 17/01/2025.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text, !email.isEmpty, !password.isEmpty {
            print("Login email:\(email), password:\(password)")
            
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e.localizedDescription)
                    let alertVC = UIAlertController(title: "Error", message: e.localizedDescription, preferredStyle: .alert)
                    alertVC.addAction(UIAlertAction(title: "OK", style: .cancel))
                    self.present(alertVC, animated: true)
                } else {
                    if let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController {
                        let navController = UINavigationController(rootViewController: homeVC)
                        navController.modalPresentationStyle = .fullScreen
                        self.present(navController, animated: true)
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
