//
//  ViewController.swift
//  FinalCSC690
//
//  Created by Karina Abad on 5/16/20.
//  Copyright © 2020 Karina Abad. All rights reserved.
//

import UIKit

class MondayController: UIViewController, UITextFieldDelegate {

    


    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var MorningView: UITableView!

    
    var morningList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MorningView.tableFooterView = UIView()
        MorningView.dataSource = self
        MorningView.delegate = self

    }
    
    @IBAction func addTextButton(_ sender: Any) {
        insertTask()
    }
    
    func insertTask() {
        
        if let txt = textField.text, !txt.isEmpty {
            self.morningList.insert(txt, at: 0)
        }

        MorningView.beginUpdates()
        MorningView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
        MorningView.endUpdates()

        textField.text = ""
        view.endEditing(true)
    }
}

extension MondayController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return morningList.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
          guard let cell = MorningView.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else {return UITableViewCell()}
          cell.morninglistmember.text = morningList[indexPath.row]
          return cell
      }
      
      
      func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
          return true
      }

      
      func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

          if editingStyle == .delete {
              morningList.remove(at: indexPath.row)

              MorningView.beginUpdates()
              MorningView.deleteRows(at: [indexPath], with: .automatic)
              MorningView.endUpdates()
          }
      }
}

