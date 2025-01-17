//
//  ViewController.swift
//  FirebaseCode
//
//  Created by Mohamad Shawal Sapuan Bin Mohamad on 17/01/2025.
//

import UIKit

class LandingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginAction(_ sender: UIButton) {
        if let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
            self.present(loginVC, animated: true)
        }
    }
    
    @IBAction func registerAction(_ sender: UIButton) {
        if let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController {
            self.present(loginVC, animated: true)
        }
    }
    
}

