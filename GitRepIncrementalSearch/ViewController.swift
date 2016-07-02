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

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

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
  
  

  @IBOutlet weak var SearchInType: UISearchBar!
  //getJson()

}

