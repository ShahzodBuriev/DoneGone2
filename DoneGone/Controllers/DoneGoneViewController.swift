//
//  ViewController.swift
//  DoneGone
//
//  Created by Shahzod Buriev on 2/2/20.
//  Copyright © 2020 Shahzod Buriev. All rights reserved.
//

import UIKit

class DoneGoneViewController: UITableViewController {
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    var itemArray = [Item]()
    
       
  

    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        
                
        let newItem = Item()
        newItem.title = "Mike Posner"
        itemArray.append(newItem)
        
             let newItem1 = Item()
               newItem1.title = "Otash"
               itemArray.append(newItem1)
               
        
        let newItem2 = Item()
               newItem2.title = "Bahti"
               itemArray.append(newItem2)
               
        
        let newItem3 = Item()
               newItem3.title = "Shams"
               itemArray.append(newItem3)
               
        
        super.viewDidLoad()
        
//     if let items = defults.array(forKey: "ToDoListArray") as? [String]
//     {
//      itemArray = items
//       }
//
    }
    
    
       override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
   
      override  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoListItemCell", for: indexPath)
        
            cell.textLabel?.text = itemArray[indexPath.row].title
        
        if itemArray[indexPath.row].done == true
        {
            cell.accessoryType  =  .checkmark
        }
        else
        {
            cell.accessoryType = .none
        }
        return cell
    }
    
      
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            
            if itemArray[indexPath.row].done == false
            {
                itemArray[indexPath.row].done = true
                
            }
            
            else
            {
                itemArray[indexPath.row].done = false
            }
                    
            tableView.reloadData()
         tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
     func addNewItem(_ sender: UIBarButtonItem) {
        
        
        var textField = UITextField()
        let alert = UIAlertController(title: "New Item", message: "", preferredStyle: .alert)
          let action = UIAlertAction(title: "Add", style: .default) { (action) in
            
            let newItem = Item()
            newItem.title = textField.text!
            self.itemArray.append(newItem)
       let encoder = PropertyListEncoder()
            
            do{
                let data = try encoder.encode(self.itemArray)
                try data.write(to: self.dataFilePath!)
            }
            
            catch
            {
                print("Error encoding item array")
            }
            self.tableView.reloadData()
              
    }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create a new item"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
      override  func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            itemArray.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }

    
    }





