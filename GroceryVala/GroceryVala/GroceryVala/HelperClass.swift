

import Foundation
import CoreData


class HelperClass {
   
   static let shared = HelperClass()
   
   lazy var persistentContainer: NSPersistentContainer = {
       let container = NSPersistentContainer(name: "GroceryVala")
       container.loadPersistentStores(completionHandler: { (storeDescription, error) in
           if let error = error as NSError? {
               fatalError("Unresolved error \(error), \(error.userInfo)")
           }
       })
       return container
   }()
   
   // MARK: - Core Data Saving support
   
    func saveData(contectNum:String, customerName:String, startDate:String, paymentdate:String, literNum:String, literPrice:String) {
        let context = persistentContainer.viewContext
        let entity = NSEntityDescription.insertNewObject(forEntityName: "GrocerData", into: context) as! GrocerData
        entity.contectNum = contectNum
        entity.customerName = customerName
        entity.startDate = startDate
        entity.paymentDate = paymentdate
        entity.literNum = literNum
        entity.literPrice = literPrice
       do {
           try context.save()
       } catch { }
   }
    
   func getData() -> [GrocerData] {
       let context = persistentContainer.viewContext
       var request = [GrocerData]()
       do {
           request = try context.fetch(GrocerData.fetchRequest())
       } catch let error {
           print(error.localizedDescription)
       }
       return request
   }
   
   func deleteData() {
       let context = persistentContainer.viewContext
       do {
           let data = try context.fetch(GrocerData.fetchRequest()) as? [GrocerData]
           for i in data ?? [] {
               context.delete(i)
           }
           print("Delete All")
           try context.save()
       } catch {}
   }
   
   
   
}

