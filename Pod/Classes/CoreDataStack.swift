import CoreData
import Foundation

////////////////////////////////////////////////////////////////////////////////////////////////////
public class CoreDataStack {

  var errorHandler: (Error) -> Void = {_ in}

  lazy var persistentContainer: NSPersistentContainer = {

    let container = NSPersistentContainer(name: "harusame")
    container.loadPersistentStores(completionHandler: { [weak self](storeDescription, error) in

      if let error = error {

        print("Unable to load persistent store.")
        self?.errorHandler(error)
      }
    })
    return container
  }()

  lazy var viewContext: NSManagedObjectContext = {

    return self.persistentContainer.viewContext
  }()

  lazy var backgroundContext: NSManagedObjectContext = {
    
    return self.persistentContainer.newBackgroundContext()
  }()

  func performForegroundTask(_ block: @escaping (NSManagedObjectContext) -> Void) {

    self.viewContext.perform {
      block(self.viewContext)
    }
  }

  func performBackgroundTask(_ block: @escaping (NSManagedObjectContext) -> Void) {

    self.persistentContainer.performBackgroundTask(block)
  }
}
////////////////////////////////////////////////////////////////////////////////////////////////////

