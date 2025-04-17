//
//  ProfileViewController.swift
//  MyUIKit
//
//  Created by 이로운 on 4/17/25.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var profileData = ["아이디", "이메일", "전화번호"]
    var selectedText: String? // 전달 데이터 저장용

    @IBOutlet weak var profileTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileTableView.delegate = self
        profileTableView.dataSource = self
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = profileTableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath)
        
        cell.textLabel?.text = profileData[indexPath.row]
        
        return cell
    }
    
    // 셀 클릭시 데이터 저장하고 segue 실행 -> prepare 실행
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedText = profileData[indexPath.row]
        performSegue(withIdentifier: "showDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            // 타입캐스팅 as?에 대한 안전한 처리
            if let destination = segue.destination as? ProfileDetailViewController {
                destination.inputText = self.selectedText ?? ""
            }
        }
    }
}
