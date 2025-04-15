//
//  MyTableViewController.swift
//  MyUIKit
//
//  Created by 이로운 on 4/15/25.
//

import UIKit

class MyTableViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    let cellData = ["Hello TableView!", "UIKit 드럽게 어렵네;;", "스위프트 ui 만세"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        myTableView.backgroundColor = .green
        
        // MyTableViewController에게 동작을 위임함
        /*
         UITableView ────┐
                         │
                   (delegate & dataSource 설정 필요)
                         │
                  ┌──────▼──────┐
                  │ numberOfRowsInSection → 몇 줄? (cellData.count)
                  │ cellForRowAt → 무슨 내용? (cellData[indexPath.row])
                  └─────────────┘
         */
        // 쉽게 설명하면 특정 작업을 다 하면 나한테 보고해라!
        myTableView.dataSource = self
    }
}

// 위에 바로 작성해도 되지만 아래쪽에 작성하는게 보기가 쉬울 수 있다.
extension MyTableViewController: UITableViewDataSource {
    
    // 섹션에 로우가 몇개 들어가는가
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 우리가 가진 데이터 개수만큼만 돈다
        // 숫자를 5라고 하고 나의 데이터는 3이라면 0,1,2 까진 찾다가 3인덱스를 못찾아서 out of range 로 터진다!
        return cellData.count
    }
    
    // 로우에 들어가는 셀은 뭐냐
    /**
     dequeueReusableCell -> 재사용 가능한 셀 꺼내온다
     cellForRowAt -> 셀의 모양과 내용을 정한다, 테이블 뷰가 화면에 셀을 보여줄때마다 호출된다.
     indexPath: IndexPath -> 같은 셀을 재사용하지만 어느 위치에서 쓰이는 셀인지 알아야한다.
    */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        cell.textLabel?.text = cellData[indexPath.row]
        
        return cell
    }
}
