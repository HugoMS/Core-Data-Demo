//
//  ViewController.swift
//  Core Data Demo
//
//  Created by Hugo Morelli on 10/14/16.
//  Copyright © 2016 Hugo Morelli. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
      /*
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        
        newUser.setValue("Bambam", forKey: "username")
        newUser.setValue("myPass", forKey: "password")
        newUser.setValue(21, forKey: "age")
        
        do{
            
            try context.save()
            
            print("Saved")
            
        }catch{
            print("Error")
        } */
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        //request.predicate = NSPredicate(format: "username = %@", "Falco")
        
        request.returnsObjectsAsFaults = false
        
        do{
    
            let results = try context.fetch(request)
            
            if results.count > 0 {
                
                for result in results as! [NSManagedObject] {
                    
                    if let username = result.value(forKey: "username") as? String {
                    
                        /*
                        context.delete(result)
                        
                        do{
                            
                            try context.save()
                            
                            
                        }catch{
                            print("Delete Failed")
                        }
                         
                         */

                        
                       /* result.setValue("Falco", forKey: "username")
                        
                        do{
                            
                            try context.save()
                            
                            print("Saved")
                            
                        }catch{
                            print("Rename Failed")
                        }
                    */
                        
                        print(username)
                    }
                    
                    
                
                }
            
            }else {
            
                print("No results")
            }
            
        }catch{
        
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

