//
//  ItemStore.swift
//  Homepwner
//
//  Created by Michael Guay on 2/20/20.
//  Copyright © 2020 Michael Guay. All rights reserved.
//  186

import UIKit

class ItemStore {
    
    var allItems = [Item]()
    
    func removeitem(_ item: Item) {
        if let index = allItems.firstIndex(of: item) {
            allItems.remove(at: index)
        }
    }
    
    func moveItem(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        
        let movedItem = allItems[fromIndex]
        allItems.remove(at: fromIndex)
        allItems.insert(movedItem, at: toIndex)
    }
    
    @discardableResult func createItem() -> Item {
        let newItem = Item(name: "New ToDo", descriptionText: "Description", id: self.allItems.count + 1)
        
        allItems.append(newItem)
        
        return newItem
    }
}
