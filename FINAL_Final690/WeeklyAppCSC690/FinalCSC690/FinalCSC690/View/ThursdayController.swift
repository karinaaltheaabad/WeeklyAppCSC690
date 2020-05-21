//
//  ThursdayController.swift
//  FinalCSC690
//
//  Created by Karina Abad on 5/17/20.
//  Copyright © 2020 Karina Abad. All rights reserved.
//

import UIKit

class ThursdayController: UIViewController {

    @IBOutlet weak var thmorview: UITableView!
    @IBOutlet weak var thtextfield: UITextField!
    
    
    var thmorlist : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        thmorview.tableFooterView = UIView()
        thmorview.dataSource = self
        thmorview.delegate = self

        // Do any additional setup after loading the view.
    }
    

    @IBAction func thButton(_ sender: Any) {
        insertTask()
    }
    
    func insertTask() {
             
             if let txt = thtextfield.text, !txt.isEmpty {
                 self.thmorlist.insert(txt, at: 0)
             }

             thmorview.beginUpdates()
             thmorview.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
             thmorview.endUpdates()

             thtextfield.text = ""
             view.endEditing(true)
         }
    

}

extension ThursdayController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return thmorlist.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
          guard let cell = thmorview.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else {return UITableViewCell()}
          cell.thursdaylistmember.text = thmorlist[indexPath.row]
          return cell
      }
      
      
      func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
          return true
      }

      
      func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

          if editingStyle == .delete {
              thmorlist.remove(at: indexPath.row)

              thmorview.beginUpdates()
              thmorview.deleteRows(at: [indexPath], with: .automatic)
              thmorview.endUpdates()
          }
      }
}
