//
//  SaturdayController.swift
//  FinalCSC690
//
//  Created by Karina Abad on 5/17/20.
//  Copyright © 2020 Karina Abad. All rights reserved.
//

import UIKit

class SaturdayController: UIViewController {

    @IBOutlet weak var satmorview: UITableView!
    @IBOutlet weak var satTextField: UITextField!
    
    var satmorlist : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        satmorview.tableFooterView = UIView()
        satmorview.dataSource = self
        satmorview.delegate = self
        
    }
    
    @IBAction func satbutton(_ sender: Any) {
        insertTask()
    }
    
   func insertTask() {
        
        if let txt = satTextField.text, !txt.isEmpty {
            self.satmorlist.insert(txt, at: 0)
        }

        satmorview.beginUpdates()
        satmorview.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
        satmorview.endUpdates()

        satTextField.text = ""
        view.endEditing(true)
    }

}

extension SaturdayController: UITableViewDelegate, UITableViewDataSource {

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return satmorlist.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
      guard let cell = satmorview.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else {return UITableViewCell()}
      cell.saturdaylistmember.text = satmorlist[indexPath.row]
      return cell
  }
  
  
  func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
      return true
  }

  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

      if editingStyle == .delete {
          satmorlist.remove(at: indexPath.row)

          satmorview.beginUpdates()
          satmorview.deleteRows(at: [indexPath], with: .automatic)
          satmorview.endUpdates()
      }
  }
}
