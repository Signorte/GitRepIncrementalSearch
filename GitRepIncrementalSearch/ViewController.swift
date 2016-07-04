//
//  ViewController.swift
//  GitRepIncrementalSearch
//
//  Created by Shingo Tsukuda on 2016/07/01.
//  Copyright © 2016年 Shingo Tsukuda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  private var json:NSDictionary!
  @IBOutlet weak var MySearchBar: UISearchBar!
  @IBOutlet weak var ResTableView: UITableView!
  var myLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
/*    //ラベル（出力管理用）
    myLabel = UILabel(frame: CGRectMake(10,180,300,30))
    myLabel.layer.borderWidth = 1.0
    myLabel.layer.borderColor = UIColor.grayColor().CGColor
    self.view.addSubview(myLabel)
*/  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  func getJson() {
    
    let URL:NSURL = NSURL(string: "https://api.github.com/search/repositories?q=deep&order=desc")!
    //  let URL:NSURL = NSURL(string: "http://express.heartrails.com/api/json?method=getStations&name=%E6%96%B0%E5%AE%BF")!
    let jsonData :NSData = NSData(contentsOfURL: URL)!
    
    do {
      json = try NSJSONSerialization.JSONObjectWithData(jsonData, options: .MutableContainers) as! NSDictionary
    } catch  {
      // エラー処理
    }
    //  print(json)
    let station:NSArray = json.objectForKey("items") as! NSArray
    
    //  let response:NSDictionary = json.objectForKey("response") as! NSDictionary
    //  let station:NSArray = response.objectForKey("items") as! NSArray
    
    print(station[1])
    //  for var i=0 ; i < station.count ; i++ {
    //    print(station[i].objectForKey("prefecture") as! NSString)
    //  }
  }
  
  
  // MARK: UISearchBarDelegate
  //サーチバー更新時(UISearchBarDelegateを関連づけておく必要があります）
/*  func MySearchBar(searchBar: UISearchBar, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
    // 確定前の文字入力を検知します
    // return trueして文字入力が確定した後にsearchBarの文字を取得する処理を遅延実行します
    let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(100 * Double(NSEC_PER_MSEC)))
    dispatch_after(delayTime, dispatch_get_main_queue()) {
      self.searchBySearchBarText()
    }
    return true
  }
*/  
  func searchBySearchBarText() {
    // 検索バーから検索ワードを取り出す
    let searchText = searchDisplayController!.searchBar.text!
    if searchText.isEmpty {
      // 検索ワードが空のとき
      return
    }
    search(searchText)
  }
  
  // 検索ワードを受け取ってサーバ通信 or ローカルのデータを絞り込む処理を行う
  func search(text: String) {}

  
  //キャンセルクリック時(UISearchBarDelegateを関連づけておく必要があります）
  func MySearchBarCancelButtonClicked(searchBar: UISearchBar) {
    myLabel.text = ""
    MySearchBar.text = ""
  }
  
  //サーチボタンクリック時(UISearchBarDelegateを関連づけておく必要があります）
  func MySearchBarSearchButtonClicked(searchBar: UISearchBar) {
    myLabel.text = "社内に同じ意見があるか検索中..."
    MySearchBar.text = ""
    self.view.endEditing(true)
  }
  


  //getJson()

}

