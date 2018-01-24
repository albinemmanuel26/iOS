//
//  ViewController.swift
//  CoreDataSample1
//
//  Created by CCS on 11/01/18.
//  Copyright © 2018 Albin Emmanuel. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import CoreData

class ViewController: UIViewController {

    var contact:BaseContacts?
    var contactArray:[NSManagedObject]?
    var phoneArray:[NSManagedObject]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        Alamofire.request(URL).responseJSON(queue: DispatchQueue.global(), options: JSONSerialization.ReadingOptions., completionHandler: { (response) in
//            self.contact = (response.result as! BaseContacts)
//            })
        
        Alamofire.request(URL).responseJSON { (response) in
            self.contact = BaseContacts(JSON:response.result.value as! Dictionary)
            for eachPerson in (self.contact?.contacts)!{
                self.saveDataToCoreData(oneData: eachPerson)
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        fetchDataFromCoreData()
    }

    func saveDataToCoreData(oneData:SubContact) {
        print(oneData)
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        // 1
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        // 2
        let entityContact =
            NSEntityDescription.entity(forEntityName: "Contact",
                                       in: managedContext)!
        let entityPhone =
            NSEntityDescription.entity(forEntityName: "Phone",
                                       in: managedContext)!
        
        let contactAttribute = NSManagedObject(entity: entityContact,
                                     insertInto: managedContext)
        let phoneAttribute = NSManagedObject(entity: entityPhone,
                                               insertInto: managedContext)
        
        // 3
        contactAttribute.setValue(oneData.id, forKey: "id")
        contactAttribute.setValue(oneData.name, forKey: "name")
        contactAttribute.setValue(oneData.email, forKey: "email")
        contactAttribute.setValue(oneData.address, forKey: "address")
        contactAttribute.setValue(oneData.gender, forKey: "gender")
        //contactAttribute.setValue(oneData.phone, forKey: "phone")
        
        phoneAttribute.setValue(oneData.phone?.home, forKey: "home")
        phoneAttribute.setValue(oneData.phone?.mobile, forKey: "mobile")
        phoneAttribute.setValue(oneData.phone?.office, forKey: "office")
        
        // 4
        do {
            try managedContext.save()
            //people.append(person)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func fetchDataFromCoreData() {
        //1
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        //2
        let contactFetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Contact")
        let phoneFetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Phone")
        
        //3
        do {
            contactArray = try managedContext.fetch(contactFetchRequest)
            phoneArray = try managedContext.fetch(phoneFetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        let a = contactArray![0]
        let b = phoneArray![0]
        print(b.value(forKeyPath: "mobile") as? String)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

