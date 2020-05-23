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
    @IBOutlet weak var weveview: UITableView!
    @IBOutlet weak var wnoonview: UITableView!
    
    var wedmorlist : [String] = []
    var wednoonlist : [String] = []
    var wedevelist : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wmortv.tableFooterView = UIView()
        wmortv.dataSource = self
        wmortv.delegate = self
        
        weveview.tableFooterView = UIView()
        weveview.dataSource = self
        weveview.delegate = self
        
        wnoonview.tableFooterView = UIView()
        wnoonview.dataSource = self
        wnoonview.delegate = self

        //taken from https://stackoverflow.com/questions/38628803/how-to-set-background-image-in-swift
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Image")!)
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "Image")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
    }
    

    @IBAction func wedButton(_ sender: Any) {
        insertTask()
    }
    
    @IBAction func wedNoonButton(_ sender: Any) {
        insertNoonTask()
    }
    
    @IBAction func wedEveButton(_ sender: Any) {
        insertNightTask()
    }
    
    @IBAction func exitWednesday(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let mc = storyboard.instantiateViewController(withIdentifier: "MainMenu")as! MainMenu
        
        self.navigationController?.pushViewController(mc, animated: true)
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
    
    func insertNoonTask() {
        if let txt = wtextfield.text, !txt.isEmpty {
            self.wednoonlist.insert(txt, at: 0)
        }

        wnoonview.beginUpdates()
        wnoonview.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
        wnoonview.endUpdates()

        wtextfield.text = ""
        view.endEditing(true)
    }
    
    func insertNightTask() {
        if let txt = wtextfield.text, !txt.isEmpty {
            self.wedevelist.insert(txt, at: 0)
        }

        weveview.beginUpdates()
        weveview.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
        weveview.endUpdates()

        wtextfield.text = ""
        view.endEditing(true)
    }

}

extension WednesdayController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          var cell = 0
          
          if (tableView == wmortv)
          {
              cell = wedmorlist.count
          } else if (tableView == wnoonview)
          {
              cell = wednoonlist.count
          } else if (tableView == weveview)
          {
              cell = wedevelist.count
          }
          
          return cell
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
            if (tableView == wmortv) {
            guard let cell = wmortv.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else {return UITableViewCell()}
            cell.wednesdaylistmember.text = wedmorlist[indexPath.row]
            return cell
          } else if (tableView == wnoonview) {
              guard let cell = wnoonview.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else {return UITableViewCell()}
              cell.wednoonmember.text = wednoonlist[indexPath.row]
              return cell
          } else if (tableView == weveview) {
              guard let cell = weveview.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else {return UITableViewCell()}
              cell.wednightmember.text = wedevelist[indexPath.row]
              return cell
          }
          
          return UITableViewCell()
      }
      
      
      func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
          var b = false
          
          if (tableView == wmortv) {
              b = true
          } else if (tableView == wnoonview)
          {
              b = true
          } else if (tableView == weveview)
          {
              b = true
          }
          
          return b
      }

      
      func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

      
          if (tableView == wmortv) {
                  if editingStyle == .delete {
                      wedmorlist.remove(at: indexPath.row)

                      wmortv.beginUpdates()
                      wmortv.deleteRows(at: [indexPath], with: .automatic)
                      wmortv.endUpdates()
                  }
          } else if (tableView == wnoonview){
                  if editingStyle == .delete {
                      wednoonlist.remove(at: indexPath.row)

                      wnoonview.beginUpdates()
                      wnoonview.deleteRows(at: [indexPath], with: .automatic)
                      wnoonview.endUpdates()
                  }
          } else if (tableView == weveview) {
                  if editingStyle == .delete {
                      wedevelist.remove(at: indexPath.row)

                      weveview.beginUpdates()
                      weveview.deleteRows(at: [indexPath], with: .automatic)
                      weveview.endUpdates()
              }
          }
      }
}

