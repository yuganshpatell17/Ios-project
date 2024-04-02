 
import UIKit

@available(iOS 13.0, *)
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationItem.title = "VortexVeru"
        arrQuiz.shuffle()
        arrTravel.shuffle()
        print(arrTravel.count)
    }

    
    
    @IBAction func onClickLandmark(_ sender: UIButton){
        let vc: QUIZVC_CV = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "QUIZVC_CV") as! QUIZVC_CV
        vc.arrQuestion = arrQuiz
        vc.titleeee = "Landmarks Quiz"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func onClickTravel(_ sender: UIButton){
        let vc: QUIZVC_CV = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "QUIZVC_CV") as! QUIZVC_CV
        vc.titleeee = "Travel Quiz"
        vc.arrQuestion = arrTravel
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

