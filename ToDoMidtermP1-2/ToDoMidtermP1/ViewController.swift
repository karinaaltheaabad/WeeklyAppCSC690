//
//  ViewController.swift
//  ToDoMidtermP1
//
//  Created by Karina Abad on 4/27/20.
//  Copyright © 2020 Karina Abad. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController, UITextFieldDelegate {
    /*UIVIEWCONTROLLER SUBCLASS OF VIEWCONTROLLER*/
    
    /*IBOutlet indicates property is on storyboard*/

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addText: UITextField!
    
    var todo: [String] = ["Watch Axel's Lectures", "Get some food", "Meet Larry at 3PM"]
    
    override func viewDidLoad() {
        /*SUPER GETS VIEWDIDLOAD METHOD FROM UIVIEWCONTROLLER CLASS*/
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        
        tableView.dataSource = self
        tableView.delegate = self

    }
    
    @IBAction func addContent(_ sender: Any) {
        insertToDo()
    }
    
    func insertToDo() {
        
        if let txt = addText.text, !txt.isEmpty {
            self.todo.insert(txt, at: 0)
        }

        tableView.beginUpdates()
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
        tableView.endUpdates()

        addText.text = ""
        view.endEditing(true)
    }
}
    
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else {return UITableViewCell()}
        cell.todolistmember.text = todo[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {
            todo.remove(at: indexPath.row)

            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }
    
}

