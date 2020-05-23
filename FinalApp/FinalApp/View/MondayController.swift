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
    @IBOutlet weak var MondayNoonView: UITableView!
    @IBOutlet weak var MondayNightView: UITableView!
    
    
    var morningList: [String] = []
    var noonList: [String] = []
    var nightList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MorningView.tableFooterView = UIView()
        MorningView.dataSource = self
        MorningView.delegate = self
        
        MondayNoonView.tableFooterView = UIView()
        MondayNoonView.dataSource = self
        MondayNoonView.delegate = self
        
        MondayNightView.tableFooterView = UIView()
        MondayNightView.dataSource = self
        MondayNightView.delegate = self
        
        //taken from https://stackoverflow.com/questions/38628803/how-to-set-background-image-in-swift
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Image")!)
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "Image")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)

    }
    
    @IBAction func addTextButton(_ sender: Any) {
        insertTask()
    }
    
    @IBAction func noonbutton(_ sender: Any) {
        insertNoonTask()
    }
    
    @IBAction func nightButton(_ sender: Any) {
        insertNightTask()
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
    
    func insertNoonTask() {
        if let txt = textField.text, !txt.isEmpty {
            self.noonList.insert(txt, at: 0)
        }

        MondayNoonView.beginUpdates()
        MondayNoonView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
        MondayNoonView.endUpdates()

        textField.text = ""
        view.endEditing(true)
    }
    
    func insertNightTask() {
        if let txt = textField.text, !txt.isEmpty {
            self.nightList.insert(txt, at: 0)
        }

        MondayNightView.beginUpdates()
        MondayNightView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
        MondayNightView.endUpdates()

        textField.text = ""
        view.endEditing(true)
    }
    
    @IBAction func exitMonday(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let mc = storyboard.instantiateViewController(withIdentifier: "MainMenu")as! MainMenu
        
        self.navigationController?.pushViewController(mc, animated: true)
    }
    
}
extension MondayController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var cell = 0
        
        if (tableView == MorningView)
        {
            cell = morningList.count
        } else if (tableView == MondayNoonView)
        {
            cell = noonList.count
        } else if (tableView == MondayNightView)
        {
            cell = nightList.count
        }
        
        return cell
    }
      
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (tableView == MorningView) {
          guard let cell = MorningView.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else {return UITableViewCell()}
          cell.morninglistmember.text = morningList[indexPath.row]
          return cell
        } else if (tableView == MondayNoonView) {
            guard let cell = MondayNoonView.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else {return UITableViewCell()}
            cell.noonlistmember.text = noonList[indexPath.row]
            return cell
        } else if (tableView == MondayNightView) {
            guard let cell = MondayNightView.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else {return UITableViewCell()}
            cell.nightlistmember.text = nightList[indexPath.row]
            return cell
        }
        
        return UITableViewCell()
    }
      
      
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        var b = false
        
        if (tableView == MorningView) {
            b = true
        } else if (tableView == MondayNoonView)
        {
            b = true
        } else if (tableView == MondayNightView)
        {
            b = true
        }
        
        return b
    }

      
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        if (tableView == MorningView) {
                if editingStyle == .delete {
                    morningList.remove(at: indexPath.row)

                    MorningView.beginUpdates()
                    MorningView.deleteRows(at: [indexPath], with: .automatic)
                    MorningView.endUpdates()
                }
        } else if (tableView == MondayNoonView){
                if editingStyle == .delete {
                    noonList.remove(at: indexPath.row)

                    MondayNoonView.beginUpdates()
                    MondayNoonView.deleteRows(at: [indexPath], with: .automatic)
                    MondayNoonView.endUpdates()
                }
        } else if (tableView == MondayNightView) {
                if editingStyle == .delete {
                    nightList.remove(at: indexPath.row)

                    MondayNightView.beginUpdates()
                    MondayNightView.deleteRows(at: [indexPath], with: .automatic)
                    MondayNightView.endUpdates()
            }
        }
    }
}
