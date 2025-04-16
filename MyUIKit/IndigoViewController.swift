//
//  IndigoViewController.swift
//  MyUIKit
//
//  Created by 이로운 on 4/16/25.
//

import UIKit

class IndigoViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    // 데이터를 받을 변수
    var inputName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // (중요) 화면이 모두 그려지고 나서 label에 들어감!
        // 안그러면 터진다!
        name.text = inputName
    }
}
