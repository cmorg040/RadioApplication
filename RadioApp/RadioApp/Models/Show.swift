//
//  Show.swift
//  RadioApp
//
//  Created by Carrel on 4/16/20.
//  Copyright © 2020 Carrel. All rights reserved.
//

import UIKit
import Foundation

class Show {
    var title: String
    var date: Date
    var description: String
    //Show's length in hours
    var length: Int
    
    init?(title: String, date: Date, description: String, length: Int) {
        
//        if title.isEmpty {
//            return nil
//        }
        
        self.title = title
        self.date = date
        self.description = description
        self.length = length
    }
}


