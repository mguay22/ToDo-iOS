//
//  ItemStore.swift
//  Homepwner
//
//  Created by Michael Guay on 2/20/20.
//  Copyright © 2020 Michael Guay. All rights reserved.
//  186

import UIKit

class ItemStore {
    
    let itemArchiveUrl: URL = {
        let documentDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentDirectories.first!
        return documentDirectory.appendingPathComponent("items.archive")
    }()
    
    var allItems = [Item]()
    
    init() {
        do {
            let data = try Data(contentsOf: itemArchiveUrl)
            if let archivedItems = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Item] {
                allItems = archivedItems
            } else {
                print("Unable to find archive.")
            }
        } catch {
            print("Couldn't read file.")
        }
    }
    
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
    
    func saveChanges() -> Bool {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: allItems, requiringSecureCoding: false)
            try data.write(to: itemArchiveUrl)
        } catch {
            print("Couldn't write to file.")
            return false
        }
        return true
    }
}
