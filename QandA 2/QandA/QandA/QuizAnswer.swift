
import UIKit

class QuizAnswer: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    let questions = [
        "What is the primary programming language used for iOS app development?",
        "What is the name of Apple's integrated development environment (IDE) for iOS app development?",
        "What is the purpose of the 'IBOutlet' keyword in Swift?",
        "What is Auto Layout in iOS development used for?",
        "What is 'Grand Central Dispatch' (GCD) used for in iOS development?",
        "What is a closure in Swift?",
        "What is 'Core Data' used for in iOS development?",
        "What is 'UIKit' in iOS development?",
        "What is 'Auto Layout Constraints' in iOS development?",
        "What is the purpose of the 'IBAction' keyword in Swift?",
        "What is a protocol in Swift?",
        "What does 'optional' mean in Swift?",
        "What is a 'weak reference' in Swift?",
        "What is the purpose of 'unwrapping' an optional in Swift?",
        "What is a 'guard' statement used for in Swift?",
        "What is a 'closure capture list' in Swift?",
        "What is 'UIKit' primarily used for in iOS development?",
        "What is the delegate pattern commonly used for in iOS development?",
        "What is the primary advantage of using Swift over Objective-C?",
        "What is 'Core Animation' used for in iOS development?",
        "What is the main purpose of 'Grand Central Dispatch' (GCD) in iOS development?",
        "What is 'Interface Builder' used for in iOS development?",
        "What is 'ARC' (Automatic Reference Counting) used for in Swift?"
    ]
    
    
    let correctResponses = ["Swift","Xcode","Connect","Layout","Concurrency","Function","Storage","Interface","Constraints","Action","Contract","Nullable","Fragile","Access","Validation","Variables","Interface","Communication","Safety","Animations","Concurrency","Design","Memory"]
    
    @IBOutlet weak var table_view_answer: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.table_view_answer.dataSource = self
        self.table_view_answer.delegate = self
        self.table_view_answer.register(UINib(nibName: "TableViewCellAnswer", bundle: nil), forCellReuseIdentifier: "TableViewCellAnswer")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btn_back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellAnswer") as! TableViewCellAnswer
        let ques = questions[indexPath.row]
        let ans = correctResponses[indexPath.row]
        
        cell.configure(question: ques, correctAnswer: ans)
        return cell
    }
    
    
}
