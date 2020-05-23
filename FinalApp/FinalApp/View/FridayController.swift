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
    @IBOutlet weak var fafv: UITableView!
    @IBOutlet weak var fevv: UITableView!
    
    var fmorlist : [String] = []
    var fnonlist : [String] = []
    var fevelist : [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fmv.tableFooterView = UIView()
        fmv.dataSource = self
        fmv.delegate = self
        
        fafv.tableFooterView = UIView()
        fafv.dataSource = self
        fafv.delegate = self
        
        fevv.tableFooterView = UIView()
        fevv.dataSource = self
        fevv.delegate = self

        //taken from https://stackoverflow.com/questions/38628803/how-to-set-background-image-in-swift
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Image")!)
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "Image")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
    }
    
    @IBAction func fButton(_ sender: Any) {
        insertTask()
    }
    
    @IBAction func fnonb(_ sender: Any) {
        insertNoonTask()
    }
    
    @IBAction func feveb(_ sender: Any) {
        insertNightTask()
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
    
    func insertNoonTask() {
        if let txt = ftextfield.text, !txt.isEmpty {
            self.fnonlist.insert(txt, at: 0)
        }

        fafv.beginUpdates()
        fafv.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
        fafv.endUpdates()

        ftextfield.text = ""
        view.endEditing(true)
    }
    
    func insertNightTask() {
        if let txt = ftextfield.text, !txt.isEmpty {
            self.fevelist.insert(txt, at: 0)
        }

        fevv.beginUpdates()
        fevv.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
        fevv.endUpdates()

        ftextfield.text = ""
        view.endEditing(true)
    }
    
    @IBAction func exitFriday(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let mc = storyboard.instantiateViewController(withIdentifier: "MainMenu")as! MainMenu
        
        self.navigationController?.pushViewController(mc, animated: true)
    }

}

extension FridayController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                  
          var cell = 0
          
          if (tableView == fmv)
          {
              cell = fmorlist.count
          } else if (tableView == fafv)
          {
              cell = fnonlist.count
          } else if (tableView == fevv)
          {
              cell = fevelist.count
          }
          
          return cell
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

          if (tableView == fmv) {
            guard let cell = fmv.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else {return UITableViewCell()}
            cell.fridaylistmember.text = fmorlist[indexPath.row]
            return cell
          } else if (tableView == fafv) {
              guard let cell = fafv.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else {return UITableViewCell()}
              cell.fnm.text = fnonlist[indexPath.row]
              return cell
          } else if (tableView == fevv) {
              guard let cell = fevv.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else {return UITableViewCell()}
              cell.fem.text = fevelist[indexPath.row]
              return cell
          }
          
          return UITableViewCell()
      }
      
      
      func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        var b = false
        
        if (tableView == fmv) {
            b = true
        } else if (tableView == fafv)
        {
            b = true
        } else if (tableView == fevv)
        {
            b = true
        }
        
        return b
      }

      
      func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

          if (tableView == fmv) {
                if editingStyle == .delete {
                    fmorlist.remove(at: indexPath.row)
                    
                        fmv.beginUpdates()
                        fmv.deleteRows(at: [indexPath], with: .automatic)
                        fmv.endUpdates()
                    }
            } else if (tableView == fafv){
                if editingStyle == .delete {
                    fnonlist.remove(at: indexPath.row)

                    fafv.beginUpdates()
                    fafv.deleteRows(at: [indexPath], with: .automatic)
                    fafv.endUpdates()
            }
            } else if (tableView == fevv) {
                if editingStyle == .delete {
                    fevelist.remove(at: indexPath.row)

                    fevv.beginUpdates()
                    fevv.deleteRows(at: [indexPath], with: .automatic)
                    fevv.endUpdates()
            }
        }
    }
}
