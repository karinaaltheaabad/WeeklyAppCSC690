//
//  WednesdayController.swift
//  FinalCSC690
//
//  Created by Karina Abad on 5/17/20.
//  Copyright © 2020 Karina Abad. All rights reserved.
//

import UIKit

class WednesdayController: UIViewController {

    
    @IBOutlet weak var wmortv: UITableView!
    @IBOutlet weak var wtextfield: UITextField!
    
    var wedmorlist : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wmortv.tableFooterView = UIView()
        wmortv.dataSource = self
        wmortv.delegate = self

        // Do any additional setup after loading the view.
    }
    

    @IBAction func wedButton(_ sender: Any) {
        insertTask()
    }
    
    func insertTask() {
           
           if let txt = wtextfield.text, !txt.isEmpty {
               self.wedmorlist.insert(txt, at: 0)
           }

           wmortv.beginUpdates()
           wmortv.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
           wmortv.endUpdates()

           wtextfield.text = ""
           view.endEditing(true)
       }

}

extension WednesdayController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return wedmorlist.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
          guard let cell = wmortv.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else {return UITableViewCell()}
          cell.wednesdaylistmember.text = wedmorlist[indexPath.row]
          return cell
      }
      
      
      func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
          return true
      }

      
      func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

          if editingStyle == .delete {
              wedmorlist.remove(at: indexPath.row)

              wmortv.beginUpdates()
              wmortv.deleteRows(at: [indexPath], with: .automatic)
              wmortv.endUpdates()
          }
      }
}

