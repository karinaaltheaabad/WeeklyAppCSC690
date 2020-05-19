//
//  MainMenu.swift
//  FinalCSC690
//
//  Created by Karina Abad on 5/17/20.
//  Copyright © 2020 Karina Abad. All rights reserved.
//

import UIKit


class MainMenu: UIViewController {

    @IBAction func clickedMondayButton(_ sender: Any) {
    
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let MondayControl = storyboard.instantiateViewController(withIdentifier: "MondayController")as! MondayController
        
        self.navigationController?.pushViewController(MondayControl, animated: true)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Monday"
    }


}
