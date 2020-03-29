//
//  Item.swift
//  Homepwner
//
//  Created by Michael Guay on 2/20/20.
//  Copyright © 2020 Michael Guay. All rights reserved.
//

import UIKit

class Item : NSObject {
    var name: String
    var descriptionText: String
    var id: Int
    let dateCreated: Date
    
    init(name: String, descriptionText: String, id: Int) {
        self.name = name
        self.id = id
        self.descriptionText = descriptionText
        self.dateCreated = Date()
        
        super.init()
    }
}
