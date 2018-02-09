//
//  ViewController.swift
//  Techpod
//
//  Created by 曽根大輔 on 2018/02/09.
//  Copyright © 2018年 曽根大輔. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController , UITableViewDataSource,UITableViewDelegate{
    
    //storyboardで使うtableviewを宣言
    @IBOutlet var table: UITableView!
    
    //曲名を入れるための配列
    var songNameArray = [String]()
    //曲のファイル名を入れるための配列
    var fileNameArray = [String]()
    //音楽家の画像を入れるための配列
    var imageNameArray = [String]()
    
    //音楽を再生するための変数
    var audioPlayer: AVAudioPlayer!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //テーブルビューのデータソースメソッドはviewcontrollerクラスに書くよ、という設定
        table.dataSource = self
        
        //テーブルビューのデリケードメソッドはviewcontrollerクラスに書くよ、という設定
        table.delegate = self
        //songNameArrayに曲名を入れていく
        songNameArray = ["カノン","エリーゼのために","G線上のアリア"]
        
        //fileNameArrayに曲名を入れていく
        fileNameArray = ["cannon","elise","aria"]
        
        //imageNameArrayに曲の画像の名前を入れていく
        imageNameArray = ["Beethoven.jpg","Pachelbel.jpg","Bach.jpg"]
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //セルの数を設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //セルの数をsongNameArrayの数にする
        return songNameArray.count
        
        
    }
    
    //ID付きのセルを取得して、セル付属のtextLabelに「テスト」と表示してみる
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        //セルにsongNameArrayの曲名を表示する
        cell?.textLabel?.text = songNameArray[indexPath.row]
        
        //セルに音楽家の画像を表示する
        cell?.imageView?.image = UIImage(named:imageNameArray[indexPath.row])
        
        return cell!
    }
    
    //セルが押された時に呼ばれるデリケードメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(songNameArray[indexPath.row])が選ばれました！")
        
        //音楽ファイルの設定
        let audioPath = URL(fileURLWithPath: Bundle.main.path(forResource: fileNameArray[indexPath.row], ofType: "mp3")!)
        
        //再生の準備
        audioPlayer = try? AVAudioPlayer(contentsOf: audioPath)
        
        //音楽を再生
        audioPlayer.play()
    


}

}
