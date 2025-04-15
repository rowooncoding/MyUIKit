//
//  MyViewController.swift
//  MyUIKit
//
//  Created by 이로운 on 4/15/25.
//

import UIKit

class MyViewController: UIViewController {

    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var helloLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTabButton(_ sender: Any) {
        if let name = nameTextField.text {
            helloLabel.text = "Hello \(name)!"
        }
    }
}
