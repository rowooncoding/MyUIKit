//
//  ProfileViewController.swift
//  MyUIKit
//
//  Created by 이로운 on 4/17/25.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var profileData = ["아이디", "이메일", "전화번호"]

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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "profileSegue" {
            let vc = segue.destination as! ProfileDetailViewController
            
            vc.inputText = profileData[0]
        }
    }
}
