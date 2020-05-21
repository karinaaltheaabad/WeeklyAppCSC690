//
//  TuesdayController.swift
//  FinalCSC690
//
//  Created by Karina Abad on 5/17/20.
//  Copyright © 2020 Karina Abad. All rights reserved.
//

import UIKit

class TuesdayController: UIViewController {

    @IBOutlet weak var tuesmorview: UITableView!
    @IBOutlet weak var ttextfield: UITextField!
    
    var tuesmorninglist : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tuesmorview.tableFooterView = UIView()
        tuesmorview.dataSource = self
        tuesmorview.delegate = self

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tuesButton(_ sender: Any) {
        insertTask()
    }
    
    func insertTask() {
        
        if let txt = ttextfield.text, !txt.isEmpty {
            self.tuesmorninglist.insert(txt, at: 0)
        }

        tuesmorview.beginUpdates()
        tuesmorview.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
        tuesmorview.endUpdates()

        ttextfield.text = ""
        view.endEditing(true)
    }

}

extension TuesdayController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return tuesmorninglist.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
          guard let cell = tuesmorview.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else {return UITableViewCell()}
          cell.tuesdaylistmember.text = tuesmorninglist[indexPath.row]
          return cell
      }
      
      
      func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
          return true
      }

      
      func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

          if editingStyle == .delete {
              tuesmorninglist.remove(at: indexPath.row)

              tuesmorview.beginUpdates()
              tuesmorview.deleteRows(at: [indexPath], with: .automatic)
              tuesmorview.endUpdates()
          }
      }
}
