//
//  ViewController.swift
//  LabTestFinal
//
//  Created by user187972 on 2/8/21.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    
    @IBOutlet weak var firstname: UITextField!
    @IBOutlet weak var lastname: UITextField!
    @IBOutlet weak var dob: UITextField!
    @IBOutlet weak var gender: UITextField!
    @IBOutlet weak var contact: UITextField!
    @IBOutlet weak var diseasetype: UITextField!
    @IBOutlet weak var descrip: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func save(_ sender: Any) {
        
        
        guard
                let appDelegate = UIApplication.shared.delegate as? AppDelegate
                else {
                    return
                }
                let managedContext = appDelegate.persistentContainer.viewContext
                //2
                let entity = NSEntityDescription.entity(forEntityName: "Details", in : managedContext) !
                    //3
                let record = NSManagedObject(entity: entity, insertInto: managedContext)
                //4
        record.setValue(firstname.text, forKey: "fullName")
    
        record.setValue(lastname.text, forKey: "lastName")
        
        record.setValue(dob.text, forKey: "dob")
        
        record.setValue(gender.text, forKey: "gender")
        
        record.setValue(contact.text, forKey: "contact")
        
        record.setValue(diseasetype.text, forKey: "diseasetype")
        
        record.setValue(descrip.text, forKey: "describe")
        
        
        
        do {
                    try managedContext.save()
                    print("Record Added!")
                    //To display an alert box
                    let alertController = UIAlertController(title: "Message", message: "Record Added!", preferredStyle: .alert)
                    let OKAction = UIAlertAction(title: "OK", style: .default) {
                        (action: UIAlertAction!) in
                    }
                    alertController.addAction(OKAction)
                    self.present(alertController, animated: true, completion: nil)
                } catch
                let error as NSError {
                    print("Could not save. \(error),\(error.userInfo)")
                }
            }
        
        
        
    }
    
    @IBAction func fetch(_ sender: Any) {
        
        let fetchRequest = NSFetchRequest<Details>(entityName: "Details")
            do {
                let fetchedResults = try managedObjectContext!.fetch(fetchRequest)
                for item in fetchedResults {
                    print(item.value(forKey: "fullName")!)
                    print(item.value(forKey: "lastName")!)
                    print(item.value(forKey: "dob")!)
                    print(item.value(forKey: "gender")!)
                    print(item.value(forKey: "contact")!)
                    print(item.value(forKey: "diseasetype")!)
                    print(item.value(forKey: "describe")!)
                    
                }
            } catch let error as NSError {
                // something went wrong, print the error.
                print(error.description)
            }
        
        
        
    }
    
    
    
    
    
    	

}
			
