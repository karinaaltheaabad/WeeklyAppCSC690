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
    @IBOutlet weak var thafv: UITableView!
    @IBOutlet weak var thevv: UITableView!
    
    
    var thmorlist : [String] = []
    var thnoonlist : [String] = []
    var thevelist : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        thmorview.tableFooterView = UIView()
        thmorview.dataSource = self
        thmorview.delegate = self
        
        thafv.tableFooterView = UIView()
        thafv.dataSource = self
        thafv.delegate = self
               
        thevv.tableFooterView = UIView()
        thevv.dataSource = self
        thevv.delegate = self

        //taken from https://stackoverflow.com/questions/38628803/how-to-set-background-image-in-swift
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Image")!)
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "Image")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
    }
    

    @IBAction func thButton(_ sender: Any) {
        insertTask()
    }
    
    @IBAction func thnonbutton(_ sender: Any) {
        insertNoonTask()
    }
    @IBAction func thevebutton(_ sender: Any) {
        insertNightTask()
    }
    
    @IBAction func exitThursday(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let mc = storyboard.instantiateViewController(withIdentifier: "MainMenu")as! MainMenu
        
        self.navigationController?.pushViewController(mc, animated: true)
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
    
    func insertNoonTask() {
           if let txt = thtextfield.text, !txt.isEmpty {
               self.thnoonlist.insert(txt, at: 0)
           }

           thafv.beginUpdates()
           thafv.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
           thafv.endUpdates()

           thtextfield.text = ""
           view.endEditing(true)
       }
       
       func insertNightTask() {
           if let txt = thtextfield.text, !txt.isEmpty {
               self.thevelist.insert(txt, at: 0)
           }

           thevv.beginUpdates()
           thevv.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
           thevv.endUpdates()

           thtextfield.text = ""
           view.endEditing(true)
       }
    

}

extension ThursdayController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          var cell = 0
          
          if (tableView == thmorview)
          {
              cell = thmorlist.count
          } else if (tableView == thafv)
          {
              cell = thnoonlist.count
          } else if (tableView == thevv)
          {
              cell = thevelist.count
          }
          
          return cell
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
           if (tableView == thmorview) {
            
                  guard let cell = thmorview.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else {return UITableViewCell()}
                  cell.thursdaylistmember.text = thmorlist[indexPath.row]
                  return cell
            
                } else if (tableView == thafv) {
            
                  guard let cell = thafv.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else {return UITableViewCell()}
                  cell.thnoonmember.text = thnoonlist[indexPath.row]
                  return cell
            
                } else if (tableView == thevv) {
            
                  guard let cell = thevv.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else {return UITableViewCell()}
                  cell.thevemember.text = thevelist[indexPath.row]
                  return cell
              }
              return UITableViewCell()
      }
      
      
      func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
           var b = false
               
               if (tableView == thmorview) {
                   b = true
               } else if (tableView == thafv)
               {
                   b = true
               } else if (tableView == thevv)
               {
                   b = true
               }
               
               return b
      }

      
      func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        if (tableView == thmorview) {
                if editingStyle == .delete {
                thmorlist.remove(at: indexPath.row)
                
                thmorview.beginUpdates()
                thmorview.deleteRows(at: [indexPath], with: .automatic)
                thmorview.endUpdates()
            }
            } else if (tableView == thafv){
                if editingStyle == .delete {
                thnoonlist.remove(at: indexPath.row)
                    
                thafv.beginUpdates()
                thafv.deleteRows(at: [indexPath], with: .automatic)
                thafv.endUpdates()
            }
            } else if (tableView == thevv) {
                if editingStyle == .delete {
                thevelist.remove(at: indexPath.row)

                thevv.beginUpdates()
                thevv.deleteRows(at: [indexPath], with: .automatic)
                thevv.endUpdates()
            }
          }
      }
}
