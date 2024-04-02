//
//  FormulaTable.swift
//  PhySol
//
//  Created by SUJAL on 3/19/24.
//

import UIKit

@available(iOS 13.0, *)
class FormulaTable: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var Formulaname = ["Newton's Second Law", "Gravitational Force", "Kinetic Energy", "Potential Energy", "Power", "Ohm's Law", "Electric Power", "Frequency", "Wavelength", "Speed of Light", "Acceleration", "Force of Friction"]

    var formula = ["F = m * a", "F = (m1 * m2) / r^2", "KE = 0.5 * m * v^2", "PE = m * g * h", "P = W / t", "V = I * R", "P = V * I", "f = 1 / T", "λ = v / f", "c = λ * f", "a = Δv / t", "f = μ * N"]
    
    var formulaname = String()
    @IBOutlet weak var table_view_formula: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.table_view_formula.delegate = self
        self.table_view_formula.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btn_back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Formulaname.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellForm") as! TableViewCellForm

        cell.lbl_formula_name.text = Formulaname[indexPath.row]

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "FormInfo") as! FormInfo
        vc.formulaName = Formulaname[indexPath.row]
        vc.formulaText = "\(formula[indexPath.row])"
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
