//
//  ViewController.swift
//  QandA
//
//  Created by SUJAL on 3/8/24.
//

import UIKit

class ViewController: UIViewController {
    
    // Trivia questions and answers
    let questions = [
        "What does MVC stand for in iOS development?",
        "What is the primary programming language used for iOS app development?",
        "What is the name of Apple's integrated development environment (IDE) for iOS app development?",
        "What is the purpose of the 'IBOutlet' keyword in Swift?",
        "What is the purpose of the 'IBAction' keyword in Swift?",
        "What is Auto Layout in iOS development used for?",
        "What is a storyboard in iOS development?",
        "What is the delegate pattern commonly used for in iOS development?",
        "What is a closure in Swift?",
        "What is a protocol in Swift?",
        "What is the Swift programming language's primary advantage over Objective-C?",
           "What does 'optional' mean in Swift?",
           "What is a 'guard' statement used for in Swift?",
           "What is the purpose of 'unwrapping' an optional in Swift?",
           "What is a 'closure capture list' in Swift?",
           "What is a 'weak reference' in Swift?",
           "What is 'Grand Central Dispatch' (GCD) used for in iOS development?",
           "What is 'Core Data' used for in iOS development?",
           "What is 'UIKit' in iOS development?",
           "What is 'Auto Layout Constraints' in iOS development?"
    ]

    let answers = [
        ["Model-View-Controller", "Model-View-Data", "Model-View-Component", "Model-View-Configuration"],
        ["Swift", "Objective-C", "Java", "C++"],
        ["Xcode", "Android Studio", "Visual Studio", "Eclipse"],
        ["To connect a user interface element with code", "To define a constant", "To declare a function", "To specify a data type"],
        ["To create an action triggered by a user interface element", "To define a class", "To manage memory", "To handle errors"],
        ["To create user interfaces that adapt to different screen sizes and orientations", "To manage data models", "To handle networking tasks", "To process user input"],
        ["A visual representation of an app's user interface and navigation flow", "A data model", "A file containing code", "A design pattern"],
        ["To handle events and customize behavior of objects", "To define constants", "To create user interfaces", "To manage navigation"],
        ["A self-contained block of functionality that can be passed around and used in your code", "A type of data structure", "A graphical user interface element", "A file containing Swift code"],
        ["A set of methods and properties that define a particular functionality or behavior", "A user interface element", "A design pattern", "A data type"], ["Safety", "Speed", "Ease of use", "Interoperability"],
        ["A value that may or may not be present", "A constant value", "A variable with a default value", "A function that returns nil"],
        ["To require that a condition must be true, or exit the current scope", "To check for nil values", "To define a constant", "To perform a loop"],
        ["To access the underlying value of an optional", "To create a new optional value", "To assign a default value to an optional", "To unwrap a non-optional value"],
        ["A list of variables and constants from the enclosing scope captured by a closure", "A list of parameters passed to a function", "A list of conditions in a guard statement", "A list of classes conforming to a protocol"],
        ["A reference that does not keep a strong hold on the instance it refers to", "A reference that keeps a strong hold on the instance it refers to", "A reference that retains ownership of the instance it refers to", "A reference that is automatically unwrapped"],
        ["To manage concurrent execution and asynchronous tasks", "To handle user interface interactions", "To store and manage data persistently", "To define user interface layouts"],
        ["A framework for managing object graphs and persisting data on Apple platforms", "A framework for creating user interfaces", "A framework for handling networking tasks", "A framework for animation and graphics rendering"],
        ["A framework containing classes and functions for building user interfaces", "A framework for handling data models and storage", "A framework for concurrency and asynchronous programming", "A framework for accessing device hardware and sensors"],
        ["A system for defining the position and size of views relative to each other", "A framework for handling user input", "A design pattern for organizing code", "A framework for managing navigation and transitions"]
    ]

    let correctResponses = ["Model-View-Controller", "Swift", "Xcode", "To connect a user interface element with code", "To create an action triggered by a user interface element", "To create user interfaces that adapt to different screen sizes and orientations", "A visual representation of an app's user interface and navigation flow", "To handle events and customize behavior of objects", "A self-contained block of functionality that can be passed around and used in your code", "A set of methods and properties that define a particular functionality or behavior","Safety", "A value that may or may not be present", "To require that a condition must be true, or exit the current scope", "To access the underlying value of an optional", "A list of variables and constants from the enclosing scope captured by a closure", "A reference that does not keep a strong hold on the instance it refers to", "To manage concurrent execution and asynchronous tasks", "A framework for managing object graphs and persisting data on Apple platforms", "A framework containing classes and functions for building user interfaces", "A system for defining the position and size of views relative to each other"]

    // UI Outlets
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var answerButtons: [UIButton]!
    @IBOutlet weak var resultLabel: UILabel!
    
    // Current question index
    var currentQuestionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Display the first question
        displayQuestion()
    }
    
    // Method to display the current question
    func displayQuestion() {
        questionLabel.text = questions[currentQuestionIndex]
        for i in 0..<answerButtons.count {
            answerButtons[i].setTitle(answers[currentQuestionIndex][i], for: .normal)
        }
        resultLabel.text = ""
    }
    
    // Method to handle button tap
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        // Check if the answer is correct
        let selectedAnswer = sender.title(for: .normal)!
        let correctAnswer = correctResponses[currentQuestionIndex]
        
        if selectedAnswer == correctAnswer {
            resultLabel.text = "Correct!"
            // Move to the next question
            currentQuestionIndex += 1
            
            // Check if all questions have been answered
            if currentQuestionIndex < questions.count {
                // Display the next question
                displayQuestion()
            } else {
                // Display quiz completion message
                questionLabel.text = "Quiz completed!"
                for button in answerButtons {
                    button.isHidden = true
                }
            }

        } else {
            resultLabel.text = "Wrong! The correct answer is \(correctAnswer)"
            
        }
        
        
    }
    
}
