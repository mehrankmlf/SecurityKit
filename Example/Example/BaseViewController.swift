//
//  BaseViewController.swift
//  Example
//
//  Created by Mehran on 5/6/1401 AP.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func showAlert(message : String) {
        // create the alert
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)

        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
}
