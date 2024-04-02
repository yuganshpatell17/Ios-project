//
//  picViewController.swift
//  demo
//
//  Created by yugansh on 12/01/24.
//

import UIKit

class PicViewController: UIViewController/*, UIPickerViewDelegate, UIPickerViewDataSource*/ {
    
    

    @IBOutlet weak var picview: UIPickerView!
    
    @IBOutlet weak var lbl: UILabel!
    
    var arr : [Any] = [1,"demo",1.11,false]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
//        self.picview.delegate = self
//        self.picview.dataSource = self
//        
        // Do any additional setup after loading the view.
        
        print(arr)
    }
    
    
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return self.arr.count
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
////        if component == 0 {
//        return self.arr[row]
////        } else {
////            return "\(self.arr2[row])"
////        }
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        self.lbl.text = self.arr[row]
//    }
    

}
