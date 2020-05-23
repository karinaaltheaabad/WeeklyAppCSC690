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
    @IBOutlet weak var tnoonview: UITableView!
    @IBOutlet weak var teveview: UITableView!
    
    var tuesmorninglist : [String] = []
    var tuesnoonlist : [String] = []
    var tuesevelist : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tuesmorview.tableFooterView = UIView()
        tuesmorview.dataSource = self
        tuesmorview.delegate = self
        
        tnoonview.tableFooterView = UIView()
        tnoonview.dataSource = self
        tnoonview.delegate = self
        
        teveview.tableFooterView = UIView()
        teveview.dataSource = self
        teveview.delegate = self

        //taken from https://stackoverflow.com/questions/38628803/how-to-set-background-image-in-swift
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Image")!)
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "Image")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
    }
    
    @IBAction func tuesButton(_ sender: Any) {
        insertTask()
    }
    
    @IBAction func taftbutton(_ sender: Any) {
        insertNoonTask()
    }
    
    @IBAction func tevebutton(_ sender: Any) {
        insertNightTask()
    }
    
    @IBAction func exitTuesday(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let mc = storyboard.instantiateViewController(withIdentifier: "MainMenu")as! MainMenu
        
        self.navigationController?.pushViewController(mc, animated: true)
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
    
    func insertNoonTask() {
          if let txt = ttextfield.text, !txt.isEmpty {
              self.tuesnoonlist.insert(txt, at: 0)
          }

          tnoonview.beginUpdates()
          tnoonview.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
          tnoonview.endUpdates()

          ttextfield.text = ""
          view.endEditing(true)
      }
      
      func insertNightTask() {
          if let txt = ttextfield.text, !txt.isEmpty {
              self.tuesevelist.insert(txt, at: 0)
          }

          teveview.beginUpdates()
          teveview.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
          teveview.endUpdates()

          ttextfield.text = ""
          view.endEditing(true)
      }
    
    

}

extension TuesdayController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          
        var cell = 0
        
        if (tableView == tuesmorview)
        {
            cell = tuesmorninglist.count
        } else if (tableView == tnoonview)
        {
            cell = tuesnoonlist.count
        } else if (tableView == teveview)
        {
            cell = tuesevelist.count
        }
        
        return cell
        
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
         if (tableView == tuesmorview) {
            guard let cell = tuesmorview.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else {return UITableViewCell()}
            cell.tuesdaylistmember.text = tuesmorninglist[indexPath.row]
            return cell
          } else if (tableView == tnoonview) {
              guard let cell = tnoonview.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else {return UITableViewCell()}
              cell.tuesnoonmember.text = tuesnoonlist[indexPath.row]
              return cell
          } else if (tableView == teveview) {
              guard let cell = teveview.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else {return UITableViewCell()}
              cell.tuesnightmember.text = tuesevelist[indexPath.row]
              return cell
          }
          
          return UITableViewCell()
        
      }
      
      
      func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
           var b = false
                
                if (tableView == tuesmorview) {
                    b = true
                } else if (tableView == tnoonview)
                {
                    b = true
                } else if (tableView == teveview)
                {
                    b = true
                }
                
                return b
      }

      
      func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

       if (tableView == tuesmorview) {
                  if editingStyle == .delete {
                      tuesmorninglist.remove(at: indexPath.row)

                      tuesmorview.beginUpdates()
                      tuesmorview.deleteRows(at: [indexPath], with: .automatic)
                      tuesmorview.endUpdates()
                  }
          } else if (tableView == tnoonview){
                  if editingStyle == .delete {
                      tuesnoonlist.remove(at: indexPath.row)

                      tnoonview.beginUpdates()
                      tnoonview.deleteRows(at: [indexPath], with: .automatic)
                      tnoonview.endUpdates()
                  }
          } else if (tableView == teveview) {
                  if editingStyle == .delete {
                      tuesevelist.remove(at: indexPath.row)

                      teveview.beginUpdates()
                      teveview.deleteRows(at: [indexPath], with: .automatic)
                      teveview.endUpdates()
              }
          }
      }
}
