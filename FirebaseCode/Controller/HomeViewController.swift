//
//  HomeViewController.swift
//  FirebaseCode
//
//  Created by Mohamad Shawal Sapuan Bin Mohamad on 17/01/2025.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(logoutAction))
    }
    
    @objc func logoutAction() {
        let alertVC = UIAlertController(title: "Log Out", message: "Are you sure?", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default) { alert in
            self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
        })
        alertVC.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        self.present(alertVC, animated: true)
    }

}
