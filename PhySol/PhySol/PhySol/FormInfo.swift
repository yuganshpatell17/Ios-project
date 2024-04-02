import UIKit

@available(iOS 13.0, *)
class FormInfo: UIViewController {

    @IBOutlet weak var lbl_formulaname: UILabel!
    @IBOutlet weak var lbl_formula: UILabel!
    
    var formulaName = String()
    var formulaText = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.lbl_formulaname.text = formulaName
        self.lbl_formula.text = formulaText
    }
    
    @IBAction func btn_back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btn_enter_value(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "FormulaInfo") as! FormulaInfo
        vc.formulaName = self.formulaName
        vc.formulaText = self.formulaText
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
