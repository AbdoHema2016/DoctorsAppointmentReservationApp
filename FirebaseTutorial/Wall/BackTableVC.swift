//
//  BackTableVC.swift
//  Doc
//
//  Created by Abdelrhman on 1/5/18.
//  Copyright © 2018 bigNerdeo. All rights reserved.
//

import UIKit
var selectedRow = Int()
class BackTableVC: UITableViewController {
    
    var TableArray = [String]()
    
    override func viewDidLoad() {
        
        TableArray = ["All","Cavities","Teeth health"]
    /*
         // filter menu array items in arabic
        TableArray = ["All             ",
                      "             زراعة الاسنان",
                      "              التقويم",
                      "             تركيب الاسنان"
    ,"             تركيبات الاسنان(الثابت)"
            ,"             عدسات الاسنان"
            ,"             تركيبات الاسنان (المتحرك)"
            ,"             الليزر في الاسنان"
            ,"             تبييض الاسنان"
            ,"             تنظيف الاسنان"
            ,"             تأثير الحمل"
            ,"             قرح الفم واللثه"
            ,"             التهابات الفم و اللثه"
            ,"             حساسية الاسنان"
            ,"             تسوس الاسنان"
            ,"             تجميل الاسنان"
            ,"             حشوات الاسنان(التجميليه)"
            ,"             جراحات الاسنان"
            ,"             فراغات الاسنان"
            ,"             الام الاسنان"
            ,"             مواعيد تبديل الاسنان"
            ,"             اسباب اصفرار الاسنان"
            ,"             مرضى القلب والاسنان"
            ,"             السكر والضغط و الاسنان"
            ,"             التهابات الفك",
             "             التقويم الشفاف",
             "             احدث اجهزة علاج الاسنان",
        ]
       */
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return TableArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "filterCell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = TableArray[indexPath.row]
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            selectedRow = indexPath.row
        print(selectedRow)
         performSegue(withIdentifier: "backHame", sender: self)
    }
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let DestVC = segue.destination as! HomeVC
        
        DestVC.filterChoice = selectedRow
    }
 */
}
