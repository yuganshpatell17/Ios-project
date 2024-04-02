 

import UIKit
import AVKit

@available(iOS 13.0, *)
class QUIZVC_CV: UIViewController {

    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var btnAnswer1: UIButton!
    @IBOutlet weak var btnAnswer2: UIButton!
    @IBOutlet weak var btnAnswer3: UIButton!
    @IBOutlet weak var btnAnswer4: UIButton!
    
    var index = 0
    var arrQuestion = [Quiz]()
    var titleeee = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = self.titleeee
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        setQuestion()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func setQuestion(){
        if arrQuestion.count == index {
            Utility.showAlertWithTitleFromVC(vc: self, title: "Game Over", andMessage: "Your game is over try again for more fun.", buttons: ["OK"]) { index in
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
        self.lblQuestion.text = arrQuestion[index].question
        
//        answer = arrQuestion[index].CORRECT
        var arr = [arrQuestion[index].Wronganswer1, arrQuestion[index].Wronganswer2, arrQuestion[index].Wronganswer3, arrQuestion[index].CORRECT]
        
        arr.shuffle()
        
        btnAnswer1.setTitle(arr[0], for: .normal)
        btnAnswer2.setTitle(arr[1], for: .normal)
        btnAnswer3.setTitle(arr[2], for: .normal)
        btnAnswer4.setTitle(arr[3], for: .normal)
        
        index += 1
    }
    
    @IBAction func onClickAnswer(_ sender: UIButton){
        if sender.title(for: .normal) == arrQuestion[index-1].CORRECT{
            RightAnswerPlaySound()
            RightAnswerAnimation(view: sender)
            incrementScore()
            setQuestion()
        }else{
            WrongAnswerVibrate()
            WrongAnswerPlaySound()
            vibrateAnimation(view: sender)
        }
        
    }
    
    func incrementScore()
    {
        var k : Int = USER_SCORE
        k = k + 1
        USER_SCORE = k
        UserDefaults.standard.set(USER_SCORE, forKey: "UserScore")
    }
    
    // Animation and Vibrate
    func vibrateAnimation(view : UIView)
    {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: view.center.x - 10, y: view.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: view.center.x + 10, y: view.center.y))

        view.layer.add(animation, forKey: "position")
    }
    
    func RightAnswerAnimation(view : UIView)
    {
        UIView.animate(withDuration: 0.5, animations: {
            view.alpha = 0.2
        }) { _ in
            view.alpha = 1
        }
    }
    
    func WrongAnswerVibrate()
    {
        AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
    }
    
    func RightAnswerPlaySound()
    {
//        AudioServicesPlaySystemSound(SystemSoundID(1388))
        AudioServicesPlaySystemSound(SystemSoundID(1057))
    }
    
    func WrongAnswerPlaySound()
    {
        AudioServicesPlaySystemSound(SystemSoundID(1391))
        
    }

}
