//
//  SundayController.swift
//  FinalCSC690
//
//  Created by Karina Abad on 5/17/20.
//  Copyright © 2020 Karina Abad. All rights reserved.
//

import UIKit

class SundayController: UIViewController {

    @IBOutlet weak var sunview: UITableView!
    @IBOutlet weak var suntfield: UITextField!
    
    var sunmorlist : [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sunview.tableFooterView = UIView()
        sunview.dataSource = self
        sunview.delegate = self
    }
    
    
    @IBAction func sunButton(_ sender: Any) {
        insertTask()
    }
    

    func insertTask() {
         
         if let txt = suntfield.text, !txt.isEmpty {
             self.sunmorlist.insert(txt, at: 0)
         }

         sunview.beginUpdates()
         sunview.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
         sunview.endUpdates()

         suntfield.text = ""
         view.endEditing(true)
     }

}

extension SundayController: UITableViewDelegate, UITableViewDataSource {

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return sunmorlist.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
      guard let cell = sunview.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else {return UITableViewCell()}
      cell.sundaylistmember.text = sunmorlist[indexPath.row]
      return cell
  }
  
  
  func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
      return true
  }

  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

      if editingStyle == .delete {
          sunmorlist.remove(at: indexPath.row)

          sunview.beginUpdates()
          sunview.deleteRows(at: [indexPath], with: .automatic)
          sunview.endUpdates()
      }
  }
}
