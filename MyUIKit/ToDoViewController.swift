//
//  ToDoViewController.swift
//  MyUIKit
//
//  Created by 이로운 on 4/16/25.
//

import UIKit

struct TodoItem {
    let title: String
    var isCompleted: Bool
}

class ToDoViewController: UIViewController {
    // todoCell

    @IBOutlet weak var todoTableView: UITableView!
    var data: [TodoItem] = [
        TodoItem(title: "커밋하기", isCompleted: false),
        TodoItem(title: "운동하기", isCompleted: true),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        todoTableView.backgroundColor = .brown
        
        todoTableView.dataSource = self
        todoTableView.delegate = self
    }
}

extension ToDoViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let myAction = UIContextualAction(style: .normal, title: "완료") { action, view, completionHandler in
            self.data[indexPath.row].isCompleted.toggle()
            self.todoTableView.reloadData()
            completionHandler(true)
        }
        return UISwipeActionsConfiguration(actions: [myAction])
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = todoTableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
        
        let item = data[indexPath.row]
        cell.textLabel?.text = data[indexPath.row].title
        
        // 강의 자료
//        if data[indexPath.row].isCompleted {
//            cell.textLabel?.textColor = .green
//        } else {
//            cell.textLabel?.textColor = .red
//        }
       
        // 내가 만든거
        // 완료 여부에 따른 텍스트 색상 설정
        cell.textLabel?.textColor = item.isCompleted ? .green : .red
        
        // 완료여부에 따른 체크마크 표시
        cell.accessoryType = item.isCompleted ? .checkmark : .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        todoTableView.deselectRow(at: indexPath, animated: true)
    }
}
