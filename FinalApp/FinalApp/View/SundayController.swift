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
    @IBOutlet weak var sunafv: UITableView!
    @IBOutlet weak var sunevv: UITableView!
    
    var sunmorlist : [String] = []
    var sunnoonlist : [String] = []
    var sunevelist : [String] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()

        sunview.tableFooterView = UIView()
        sunview.dataSource = self
        sunview.delegate = self
        
        sunafv.tableFooterView = UIView()
        sunafv.dataSource = self
        sunafv.delegate = self
        
        sunevv.tableFooterView = UIView()
        sunevv.dataSource = self
        sunevv.delegate = self
        
        //taken from https://stackoverflow.com/questions/38628803/how-to-set-background-image-in-swift
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Image")!)
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "Image")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
    }
    
    
    @IBAction func sunButton(_ sender: Any) {
        insertTask()
    }
    
    @IBAction func sunaftBut(_ sender: Any) {
        insertNoonTask()
    }
    
    @IBAction func sunevebutton(_ sender: Any) {
        insertNightTask()
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
    
    func insertNoonTask() {
        if let txt = suntfield.text, !txt.isEmpty {
            self.sunnoonlist.insert(txt, at: 0)
        }

        sunafv.beginUpdates()
        sunafv.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
        sunafv.endUpdates()

        suntfield.text = ""
        view.endEditing(true)
    }
    
    func insertNightTask() {
        if let txt = suntfield.text, !txt.isEmpty {
            self.sunevelist.insert(txt, at: 0)
        }

        sunevv.beginUpdates()
        sunevv.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
        sunevv.endUpdates()

        suntfield.text = ""
        view.endEditing(true)
    }
    
    @IBAction func exitSunday(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let mc = storyboard.instantiateViewController(withIdentifier: "MainMenu")as! MainMenu
        
        self.navigationController?.pushViewController(mc, animated: true)
    }

}

extension SundayController: UITableViewDelegate, UITableViewDataSource {

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      var cell = 0
      
      if (tableView == sunview)
      {
          cell = sunmorlist.count
      } else if (tableView == sunafv)
      {
          cell = sunnoonlist.count
      } else if (tableView == sunevv)
      {
          cell = sunevelist.count
      }
      
      return cell
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
      if (tableView == sunview) {
          guard let cell = sunview.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else {return UITableViewCell()}
          cell.sundaylistmember.text = sunmorlist[indexPath.row]
          return cell
        } else if (tableView == sunafv) {
          guard let cell = sunafv.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else {return UITableViewCell()}
          cell.sunnoonmember.text = sunnoonlist[indexPath.row]
          return cell
        } else if (tableView == sunevv) {
          guard let cell = sunevv.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else {return UITableViewCell()}
          cell.sunevemember.text = sunevelist[indexPath.row]
          return cell
      }
      return UITableViewCell()
  }
  
  
  func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
      var b = false
      
      if (tableView == sunview) {
          b = true
      } else if (tableView == sunafv)
      {
          b = true
      } else if (tableView == sunevv)
      {
          b = true
      }
      
      return b
  }

  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

      if (tableView == sunview) {
              if editingStyle == .delete {
              sunmorlist.remove(at: indexPath.row)
              
              sunview.beginUpdates()
              sunview.deleteRows(at: [indexPath], with: .automatic)
              sunview.endUpdates()
          }
          } else if (tableView == sunafv){
              if editingStyle == .delete {
              sunnoonlist.remove(at: indexPath.row)
                  
              sunafv.beginUpdates()
              sunafv.deleteRows(at: [indexPath], with: .automatic)
              sunafv.endUpdates()
          }
          } else if (tableView == sunevv) {
              if editingStyle == .delete {
              sunevelist.remove(at: indexPath.row)

              sunevv.beginUpdates()
              sunevv.deleteRows(at: [indexPath], with: .automatic)
              sunevv.endUpdates()
          }
        }
    }
}
