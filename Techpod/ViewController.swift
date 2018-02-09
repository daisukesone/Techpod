//
//  ViewController.swift
//  Techpod
//
//  Created by 曽根大輔 on 2018/02/09.
//  Copyright © 2018年 曽根大輔. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource{
    
    //storyboardで使うtableviewを宣言
    @IBOutlet var table: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //テーブルビューのデータソースメソッドはviewcontrollerクラスに書くよ、という設定
        table.dataSource = self    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //セルの数を設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 10
    }
    
    //ID付きのセルを取得して、セル付属のtextLabelに「テスト」と表示してみる
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = "テスト"
        
        return cell!
    }


}

