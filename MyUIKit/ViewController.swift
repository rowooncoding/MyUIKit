//
//  ViewController.swift
//  MyUIKit
//
//  Created by 이로운 on 4/14/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var MyButton: UIButton!
    @IBOutlet weak var MyLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }

    @IBAction func didMyButtonTapped(_ sender: Any) {
        print("Hello Rowoon!!!")
        MyLable.text = "Hello Mango!!!"
    }
    
}

