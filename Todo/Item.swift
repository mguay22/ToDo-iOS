//
//  Item.swift
//  Homepwner
//
//  Created by Michael Guay on 2/20/20.
//  Copyright © 2020 Michael Guay. All rights reserved.
//

import UIKit

class Item : NSObject, NSCoding {
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
    
    required init(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as! String
        dateCreated = aDecoder.decodeObject(forKey: "dateCreated") as! Date
        id = aDecoder.decodeInteger(forKey: "id") as! Int
        descriptionText = aDecoder.decodeObject(forKey: "descriptionText") as! String
                
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(dateCreated, forKey: "dateCreated")
        aCoder.encode(descriptionText, forKey: "descriptionText")
        print("Here is the id", id)
        aCoder.encode(id, forKey: "id")
    }
}
