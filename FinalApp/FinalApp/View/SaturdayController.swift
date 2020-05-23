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
    @IBOutlet weak var safv: UITableView!
    @IBOutlet weak var sevv: UITableView!
    
    var satmorlist : [String] = []
    var satnoonlist : [String] = []
    var satevelist : [String] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()

        satmorview.tableFooterView = UIView()
        satmorview.dataSource = self
        satmorview.delegate = self
        
        safv.tableFooterView = UIView()
        safv.dataSource = self
        safv.delegate = self
        
        sevv.tableFooterView = UIView()
        sevv.dataSource = self
        sevv.delegate = self
        
        //taken from https://stackoverflow.com/questions/38628803/how-to-set-background-image-in-swift
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Image")!)
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "Image")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
        
    }
    
    @IBAction func satbutton(_ sender: Any) {
        insertTask()
    }
    
    
    @IBAction func satnoonB(_ sender: Any) {
        insertNoonTask()
    }
    
    @IBAction func satevebutton(_ sender: Any) {
        insertNightTask()
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
    
    func insertNoonTask() {
           if let txt = satTextField.text, !txt.isEmpty {
               self.satnoonlist.insert(txt, at: 0)
           }

           safv.beginUpdates()
           safv.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
           safv.endUpdates()

           satTextField.text = ""
           view.endEditing(true)
       }
       
       func insertNightTask() {
           if let txt = satTextField.text, !txt.isEmpty {
               self.satevelist.insert(txt, at: 0)
           }

           sevv.beginUpdates()
           sevv.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
           sevv.endUpdates()

           satTextField.text = ""
           view.endEditing(true)
       }
    
    @IBAction func exitSaturday(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let mc = storyboard.instantiateViewController(withIdentifier: "MainMenu")as! MainMenu
        
        self.navigationController?.pushViewController(mc, animated: true)
    }
    
   

}

extension SaturdayController: UITableViewDelegate, UITableViewDataSource {

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      var cell = 0
      
      if (tableView == satmorview)
      {
          cell = satmorlist.count
      } else if (tableView == safv)
      {
          cell = satnoonlist.count
      } else if (tableView == sevv)
      {
          cell = satevelist.count
      }
      
      return cell
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
      if (tableView == satmorview) {
        guard let cell = satmorview.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else {return UITableViewCell()}
        cell.saturdaylistmember.text = satmorlist[indexPath.row]
        return cell
      } else if (tableView == safv) {
        guard let cell = safv.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else {return UITableViewCell()}
        cell.satnoonmember.text = satnoonlist[indexPath.row]
        return cell
      } else if (tableView == sevv) {
        guard let cell = sevv.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else {return UITableViewCell()}
        cell.satevemember.text = satevelist[indexPath.row]
        return cell
    }
    return UITableViewCell()
  }
  
  
  func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
      var b = false
      
      if (tableView == satmorview) {
          b = true
      } else if (tableView == safv)
      {
          b = true
      } else if (tableView == sevv)
      {
          b = true
      }
      
      return b
  }

  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

      if (tableView == satmorview) {
            if editingStyle == .delete {
            satmorlist.remove(at: indexPath.row)
            
            satmorview.beginUpdates()
            satmorview.deleteRows(at: [indexPath], with: .automatic)
            satmorview.endUpdates()
        }
        } else if (tableView == safv){
            if editingStyle == .delete {
            satnoonlist.remove(at: indexPath.row)
                
            safv.beginUpdates()
            safv.deleteRows(at: [indexPath], with: .automatic)
            safv.endUpdates()
        }
        } else if (tableView == sevv) {
            if editingStyle == .delete {
            satevelist.remove(at: indexPath.row)

            sevv.beginUpdates()
            sevv.deleteRows(at: [indexPath], with: .automatic)
            sevv.endUpdates()
        }
    }
  }
}
