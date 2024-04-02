
import UIKit

class YourScore: UIViewController {

      @IBOutlet weak var tapButton: UIButton!
      @IBOutlet weak var timerLabel: UILabel!
      @IBOutlet weak var scoreLabel: UILabel!
      
      var timer = Timer()
      var timeLeft = 20
      var score = 0
      
      override func viewDidLoad() {
          super.viewDidLoad()
          updateUI()
          startTimer()
          updateTimer()
      }
      
      func updateUI() {
          scoreLabel.text = "Score: \(score)"
          timerLabel.text = "Time: \(timeLeft)"
      }
      
      func startTimer() {
          timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
      }
      
      @objc func updateTimer() {
          timeLeft -= 1
          timerLabel.text = "Time: \(timeLeft)"
          
          if timeLeft <= 0 {
              endGame()
          }
      }
      
      @IBAction func tapButtonTapped(_ sender: UIButton) {
          score += 1
          scoreLabel.text = "Score: \(score)"
          
              let randomColor = UIColor(red: CGFloat.random(in: 0...1),
                                        green: CGFloat.random(in: 0...1),
                                        blue: CGFloat.random(in: 0...1),
                                        alpha: 1.0)
          
              tapButton.backgroundColor = randomColor
      }
      
      func endGame() {
          timer.invalidate()
          
          let alert = UIAlertController(title: "Game Over", message: "Your score: \(score)", preferredStyle: .alert)
          self.scoreLabel.text = "Your score :- \(score)"
          let restartAction = UIAlertAction(title: "Restart", style: .default) { (_) in
              self.restartGame()
          }
          alert.addAction(restartAction)
          
          present(alert, animated: true, completion: nil)
      }
      
      func restartGame() {
          timeLeft = 10
          score = 0
          updateUI()
          startTimer()
      }

    @IBAction func btn_back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
