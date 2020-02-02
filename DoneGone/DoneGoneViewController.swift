//
//  ViewController.swift
//  DoneGone
//
//  Created by Shahzod Buriev on 2/2/20.
//  Copyright © 2020 Shahzod Buriev. All rights reserved.
//

import UIKit

class DoneGoneViewController: UITableViewController {
    
    let itemArray = ["Hello" , "Myfriend" , "fromTashkent"]

    override func viewDidLoad() {
        
        super.viewDidLoad()
       
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoListItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
      
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                    
        
    
        
        if  tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark
        {
        print(itemArray[indexPath.row])
        
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
        
       
          
        }
        
        else
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
                   
                   tableView.deselectRow(at: indexPath, animated: true)
          
                      
        }
         tableView.deselectRow(at: indexPath, animated: true)
        
        
        
    }
    
    
    
    
    
    }




