//
//  GreenViewController.swift
//  MyUIKit
//
//  Created by 이로운 on 4/16/25.
//

import UIKit

class GreenViewController: UIViewController {

    @IBOutlet weak var insertNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    
    // 화면간 데이터 전달해주는 함수(미리 정의되어 있고 구현만 하면됨)
    // 이 함수는 segue가 작동 될때 호출됨
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goNext" { // identifier은 스토리보드에서 정의해놨음
            // 데이터가 가야할 곳 view를 불러와서 담아줌
            let viewController = segue.destination as! IndigoViewController
            
            // 현재 뷰 (green)의 textField에 담겨있는 내용을 전달할 뷰의 지정된 변수로 넘겨줌
            // 만약 스토리보드에서 가져온 아이템에 그대로 넘겨지면 터짐!!(화면이 아직 안그려졌음!)
            viewController.inputName = insertNameTextField.text!
        }
    }
}
