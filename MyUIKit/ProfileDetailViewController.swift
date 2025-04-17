//
//  ProfileDetailViewController.swift
//  MyUIKit
//
//  Created by 이로운 on 4/17/25.
//

import UIKit

class ProfileDetailViewController: UIViewController {
    @IBOutlet weak var textLabel: UILabel!
    
    var inputText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = inputText
    }
}
