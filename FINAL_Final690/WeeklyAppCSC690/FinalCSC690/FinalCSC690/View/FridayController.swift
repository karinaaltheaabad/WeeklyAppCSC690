//
//  FridayController.swift
//  FinalCSC690
//
//  Created by Karina Abad on 5/17/20.
//  Copyright © 2020 Karina Abad. All rights reserved.
//

import UIKit

class FridayController: UIViewController {

    @IBOutlet weak var fmv: UITableView!
    @IBOutlet weak var ftextfield: UITextField!
    
    var fmorlist : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fmv.tableFooterView = UIView()
        fmv.dataSource = self
        fmv.delegate = self

        // Do any additional setup after loading the view.
    }
    
    @IBAction func fButton(_ sender: Any) {
        insertTask()
    }
    
    func insertTask() {
        
        if let txt = ftextfield.text, !txt.isEmpty {
            self.fmorlist.insert(txt, at: 0)
        }

        fmv.beginUpdates()
        fmv.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
        fmv.endUpdates()

        ftextfield.text = ""
        view.endEditing(true)
    }

}

extension FridayController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return fmorlist.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
          guard let cell = fmv.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else {return UITableViewCell()}
          cell.fridaylistmember.text = fmorlist[indexPath.row]
          return cell
      }
      
      
      func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
          return true
      }

      
      func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

          if editingStyle == .delete {
              fmorlist.remove(at: indexPath.row)

              fmv.beginUpdates()
              fmv.deleteRows(at: [indexPath], with: .automatic)
              fmv.endUpdates()
          }
      }
}
