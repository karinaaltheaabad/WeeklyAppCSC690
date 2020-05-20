//
//  Task.swift
//  FinalCSC690
//
//  Created by Fif Gallagher on 5/19/20.
//  Copyright © 2020 Karina Abad. All rights reserved.
//

import Foundation


class Task {
    
    var title: String?
    var timeofday: String?
    var isFinished: Bool?
    
    
    init(title: String, timeofday: String, isFinished: Bool = false) {
        self.title = title;
        self.timeofday = timeofday;
        self.isFinished = isFinished;
    }
}

/*
 import Foundation

 class Task: NSObject, NSCoding {
     
     var name: String?
     var isDone: Bool?
     
     private let nameKey = "name"
     private let isDoneKey = "isDone"
     
     init(name: String, isDone: Bool = false) {
         self.name = name;
         self.isDone = isDone;
     }
     
     func encode(with aCoder: NSCoder) {
         aCoder.encode(name, forKey: nameKey)
         aCoder.encode(isDone, forKey: isDoneKey)
     }
     
     required init?(coder aDecoder: NSCoder) {
         guard let name = aDecoder.decodeObject(forKey: nameKey) as? String,
               let isDone = aDecoder.decodeObject(forKey: isDoneKey) as? Bool
               else { return }
         
         self.name = name
         self.isDone = isDone
     }
 }

 */
