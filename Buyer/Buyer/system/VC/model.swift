//
//  model.swift
//  Buyer
//
//  Created by yugansh on 20/02/24.
//

import Foundation
import UIKit
import FirebaseFirestore

let db = Firestore.firestore()

func userinfo(email : String, password : String)
{
    let user = db.collection("user")
    
    user.document(email).setData ([
        "email" : email,
        "password" : password
        
    ])
}

func userinfo1(Mobile : String, City : String, Name : String)
{
    let user = db.collection("user")
    
    user.document(Name).setData ([
        "mobile" : Mobile,
        "city" : City,
        "name" : Name
        
    ])
}


func userinfo2()
{
    let doc = db.collection("user")
    
    doc.whereField("email", notIn: ["hyy@gmail.com"]).getDocuments { querySnapshot, err in
        if  let error = err as? NSError
        {
            
        }
        else
        {
            let arr = querySnapshot?.documents
            
            for i in arr!
            {
                i.data()
                print(i.data()) 
            }
        }
    }
}

struct chat_List
{
    
    var name = ""
    var Email = ""
    var Id = ""
    var city = ""
    init(dic: [String: Any]) 
    {
        self.name = dic["name"] as? String ?? ""
        self.Email = dic["Email"] as? String ?? ""
        self.Id = dic["Id"] as? String ?? ""
        self.city = dic["city"] as? String ?? "0"
    }
}

func massage(Id : String, Massages : String, Reciver : String)
{
    let db = Firestore.firestore()
    
    let collection = db.collection("Massages")
    collection.document().setData([

        "Massages": Massages,
        CurrentUserUid: Id,
        "senderId": Id,
        "Reciver":Reciver,
        Reciver : Reciver
    ])
}

struct Massages 
{
    
    var Massages = ""
    var senderId = ""
    var Reciver = ""
    
    init(dic: [String:Any]) 
    {
        self.Massages = dic["Massages"] as? String ?? ""
        self.senderId = dic["senderId"] as? String ?? ""
        self.Reciver = dic["Reciver"] as? String ?? ""
    }
    
}
