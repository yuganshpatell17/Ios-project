 

import UIKit
import IQKeyboardManagerSwift

class FUNDReport_VC: UIViewController {

    @IBOutlet weak var lblll: UILabel!
    
    let notesKey = "savedNotes"
    var notesData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadNotes()
    
    }

    
    @IBAction func addNotes(_ sender: Any) {
        self.showAddNoteAlert()
    }
    
    func showAddNoteAlert() {
           let alertController = UIAlertController(title: "Add Report", message: nil, preferredStyle: .alert)

           alertController.addTextField { textField in
               textField.placeholder = "Enter your Report"
           }

        let addAction = UIAlertAction(title: "Add", style: .default) { [weak self] _ in
            guard let noteText = alertController.textFields?.first?.text else {
                return
            }
            var notesArray = self?.loadNotes() ?? []
            notesArray.append(noteText)
            self?.saveNotes(notesArray)
            self?.updateTextView()
        }

           let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

           alertController.addAction(addAction)
           alertController.addAction(cancelAction)

           present(alertController, animated: true, completion: nil)
       }

    
      func saveNotes(_ notes: [String]) {
          UserDefaults.standard.set(notes, forKey: notesKey)
      }

      // Load notes from UserDefaults
      func loadNotes() -> [String] {
          return UserDefaults.standard.stringArray(forKey: notesKey) ?? []
      }

      // Update UITextView with loaded notes
      func updateTextView() {
          let notesArray = loadNotes()
          lblll.text = notesArray.joined(separator: "\n")
      }


    
    
    @IBAction func onClickBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
