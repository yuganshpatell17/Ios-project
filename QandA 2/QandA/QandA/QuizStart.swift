
import UIKit

@available(iOS 13.0, *)
class QuizStart: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btn_setting(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "QuizSetting")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func btn_quiz(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "QuizTest")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func btn_score(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "YourScore")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func btn_answer(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "QuizAnswer")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func btn_question(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "QuizQuestion")
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
