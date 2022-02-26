//
//  CoreDataHandler.swift
//  stud_CRUD_prac
//
//  Created by DCS on 25/02/22.
//  Copyright © 2022 DCS. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataHandler {
    static let shared = CoreDataHandler()
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let managedObjectContext : NSManagedObjectContext?
    
    private init(){
        managedObjectContext = appDelegate.persistentContainer.viewContext
    }
    
    func save(){
        appDelegate.saveContext()
    }
    
    func inserLog(usernm:String,pass:String)
    {
        let user = SLogin(context:managedObjectContext!)
        user.username = usernm
        user.password = pass
        save()
    }
    
    func auth(email:String,pass:String)->SLogin
    {
        let fetchreq:NSFetchRequest =  SLogin.fetchRequest()
        let predict = NSPredicate(format: "username contains %@ AND password contains %@", email,pass)
        fetchreq.predicate = predict
        do{
            let userarr = try(managedObjectContext?.fetch(fetchreq))!
            if userarr.count == 1{
                return userarr[0]
            }else{
                return SLogin()
            }
        }catch{
            print("Error")
            return SLogin()
        }
    }
    
    func addNote(title:String,desc:String,job:String)
    {
        let da = SNotes(context:managedObjectContext!)
        da.title = title
        da.desc = desc
        da.job = job
        da.ndate = Date()
        save()
    }
    
    func fetchNote()->[SNotes]{
        let fetchReq:NSFetchRequest = SNotes.fetchRequest()
        do{
            return try (managedObjectContext?.fetch(fetchReq))!
        }catch{
            return [SNotes]()
        }
    }
    
    func delNote(e:SNotes)
    {
        managedObjectContext?.delete(e)
        save()
    }
    func upNote(n:SNotes,title:String,desc:String,job:String)
    {
        n.title = title
        n.desc = desc
        n.job = job
        save()
    }
}
