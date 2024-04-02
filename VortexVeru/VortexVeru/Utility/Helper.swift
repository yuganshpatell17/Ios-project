 
import Foundation
import CoreData


class Model {
    
    static let Shared = Model()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "TourNote")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    
    
    func saveTravelData(des:String,placeName:String, date:String, stayDays:String, costThisPlace:String) {
        let context = persistentContainer.viewContext
        let entity = NSEntityDescription.insertNewObject(forEntityName: "TravelNote", into: context) as! TravelNote
        entity.aboutPlace = des
        entity.placeName = placeName
        entity.date = date
        entity.costThisPlace = costThisPlace
        entity.stayDays = stayDays
        do {
            try context.save()
        } catch { }
    }
    
    func getTravelData() -> [TravelNote] {
        let context = persistentContainer.viewContext
        var request = [TravelNote]()
        do {
            request = try context.fetch(TravelNote.fetchRequest())
        } catch let error {
            print(error.localizedDescription)
        }
        return request
    }
    
    func deleteTravelData() {
        let context = persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "TravelNote")
        do {
            let data = try context.fetch(request) as? [NSManagedObject]
            for i in data ?? [] {
                context.delete(i)
            }
            print("Delete All")
            try context.save()
        } catch {}
    }
    
}
