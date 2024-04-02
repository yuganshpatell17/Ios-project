
import UIKit

class QuizTest: UIViewController {
    
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
    
    let answers = [
        ["Swift", "Objective-C", "Java", "C++"],
        ["Xcode", "Android", "Visual", "Eclipse"],
        ["Connect", "Constant", "Function", "Type"],
        ["Layout", "Model", "Networking", "User"],
        ["Concurrency", "Storage", "Animation", "Interface"],
        ["Function", "Data", "Variable", "Class"],
        ["Storage", "Networking", "User", "Animation"],
        ["Interface", "Layout", "Constraints", "Navigation"],
        ["Action", "Constant", "Type", "Function"],
        ["Contract", "User", "Data", "Class"],
        ["Safety", "Speed", "Interoperability", "Ease"],
        ["Nullable", "Constant", "Variable", "Function"],
        ["Fragile", "Strong", "Nullable", "Constant"],
        ["Access", "Variable", "Optional", "Data"],
        ["Validation", "Loop", "Unwrapping", "Assignment"],
        ["Variables", "List", "Function", "Conditions"],
        ["Interface", "Storage", "Networking", "User"],
        ["Communication", "Navigation", "Animation", "Interface"],
        ["Safety", "Speed", "Interoperability", "Ease"],
        ["Animations", "Networking", "User", "Storage"],
        ["Concurrency", "Layout", "Interface", "Animations"],
        ["Design", "Communication", "Storage", "Networking"],
        ["Memory", "Animation", "Networking", "Interface"]
    ]
    
    let correctResponses = ["Swift","Xcode","Connect","Layout","Concurrency","Function","Storage","Interface","Constraints","Action","Contract","Nullable","Fragile","Access","Validation","Variables","Interface","Communication","Safety","Animations","Concurrency","Design","Memory"]
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var btn_try: UIButton!
    @IBOutlet var answerButtons: [UIButton]!
    
    var currentQuestionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btn_try.isHidden = true
        displayQuestion()
        // Do any additional setup after loading the view.
    }
    
    
    func displayQuestion() {
        questionLabel.text = questions[currentQuestionIndex]
        for i in 0..<answerButtons.count {
            answerButtons[i].setTitle(answers[currentQuestionIndex][i], for: .normal)
        }
    }
    
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        let selectedAnswer = sender.title(for: .normal)!
            let correctAnswer = correctResponses[currentQuestionIndex]
            
            let isCorrectAnswer = selectedAnswer == correctAnswer
            
            currentQuestionIndex += 1
            
            if currentQuestionIndex < questions.count {
                displayQuestion()
            } else {
                questionLabel.text = "Quiz completed!"
                self.btn_try.isHidden = false
                for button in answerButtons {
                    button.isHidden = true
                }
            }
    }
    
    @IBAction func btn_back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func quizCompleted() {
            questionLabel.text = "Quiz completed!"
            answerButtons.forEach { $0.isHidden = true }
        }
    
    @IBAction func btn_tryagain(_ sender: Any) {
        currentQuestionIndex = 0
               answerButtons.forEach { $0.isHidden = false }
               displayQuestion()
    }
}
