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
