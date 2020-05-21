//
//  MainMenu.swift
//  FinalCSC690
//
//  Created by Karina Abad on 5/17/20.
//  Copyright © 2020 Karina Abad. All rights reserved.
//

import UIKit

class MainMenu: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self.title = "Main Menu"
        self.navigationController?.isNavigationBarHidden = true
    }
    
    /**MONDAY BUTTON*/
    @IBAction func clickedMondayButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let MondayControl = storyboard.instantiateViewController(withIdentifier: "MondayController")as! MondayController
        
        self.navigationController?.pushViewController(MondayControl, animated: true)
    }

    /**TUESDAY BUTTON*/
    @IBAction func clickedTuesdayButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let TuesdayControl = storyboard.instantiateViewController(withIdentifier: "TuesdayController")as! TuesdayController
        
        self.navigationController?.pushViewController(TuesdayControl, animated: true)
    }
    
    /**WEDNESDAY BUTTON*/
    @IBAction func clickedWednesdayButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let WednesdayControl = storyboard.instantiateViewController(withIdentifier: "WednesdayController")as! WednesdayController
        
        self.navigationController?.pushViewController(WednesdayControl, animated: true)
    }
    
    /**THURSDAY BUTTON*/
    @IBAction func clickedThursdayButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let ThursdayControl = storyboard.instantiateViewController(withIdentifier: "ThursdayController")as! ThursdayController
        
        self.navigationController?.pushViewController(ThursdayControl, animated: true)
    }
    
    /**FRIDAY BUTTON*/
    @IBAction func clickedFridayButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let FridayControl = storyboard.instantiateViewController(withIdentifier: "FridayController")as! FridayController
        
        self.navigationController?.pushViewController(FridayControl, animated: true)
    }
    
    /**SATURDAY BUTTON*/
    @IBAction func clickedSaturdayButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let SaturdayControl = storyboard.instantiateViewController(withIdentifier: "SaturdayController")as! SaturdayController
        
        self.navigationController?.pushViewController(SaturdayControl, animated: true)
    }
    
    /**SUNDAY BUTTON*/
    @IBAction func clickedSundayButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let SundayControl = storyboard.instantiateViewController(withIdentifier: "SundayController")as! SundayController
        
        self.navigationController?.pushViewController(SundayControl, animated: true)
    }
}

extension UIViewController
{
}
