//
//  ArctiveUtility.swift
//  Amazing GK
//
//  Created by Ashish Mandaliya on 14/11/19.
//  Copyright © 2019 Bhavin godhani. All rights reserved.
//

import UIKit

class ArctiveUtility: NSObject {

    private static func archiveArray(withArrayData arr: NSMutableArray) -> NSData
        {
            return NSKeyedArchiver.archivedData(withRootObject: arr) as NSData
        }
        
        static func loadLocalArray(withKey key: String) -> NSMutableArray?
        {
            if let unarchivedObject = UserDefaults.standard.object(forKey: key) as? Data {
                
                return NSKeyedUnarchiver.unarchiveObject(with: unarchivedObject as Data) as? NSMutableArray
            }
            
            return nil
        }
        
        static func saveLocalArray(withArray arr: NSMutableArray, forKey key: String)
        {
            let archivedObject = archiveArray(withArrayData: arr)
            
            UserDefaults.standard.set(archivedObject, forKey: key)
            UserDefaults.standard.synchronize()
        }
        
        static func removeLocalArray(forKey key: String)
        {
            UserDefaults.standard.removeObject(forKey: key)
            UserDefaults.standard.synchronize()
        }
    }

