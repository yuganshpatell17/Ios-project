//
//  HomeVC.swift
//  Buyer
//
//  Created by yugansh on 31/01/24.
//

import UIKit

var isLogin = UserDefaults.standard

class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    
    @IBOutlet weak var Table_View: UITableView!
    
    @IBOutlet weak var btn_Post: UIButton!
    
    @IBOutlet weak var txt_Search: UITextField!
    
    @IBOutlet weak var btn_Sell: UIButton!
    
    var name = ["Nemade Motors","Nemade Motors","Nemade Motors"]
    
    var carname = ["Hyundai Creata","KIA","Hyundai Creata"]
    
    var carprice = ["10,00,000","40,00,000","10,00,000"]
    
    var cardistance = ["20000kms to 50000 kms","50000kms to 70000 kms","20000kms to 50000 kms"]
    
    var cargeartype = ["Manual","Manual","Manual"]
    
    var carfueltype = ["Diesel","Diesel","Diesel"]
    
    var carmodelyear = ["2019 to 2022","2020 to 2022","2019 to 2022"]
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.btn_Post.layer.cornerRadius = 10
        
        self.Table_View.delegate = self
        self.Table_View.dataSource = self
        
        let em = UIImage(named: "Search")
        addleftimage(textFlied : txt_Search , andimage : em!)
    
        UserDefaults.standard.set(true, forKey: "isLogin")
    }
    
    @IBAction func btn_Sell(_ sender: UIButton) 
    {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "HomeVC2")
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func   addleftimage(textFlied : UITextField , andimage img : UIImage)
    {
        let leftimageview = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: 20, height: 20))
        leftimageview.image = img
        textFlied.leftView = leftimageview
        textFlied.leftViewMode = .always
    }
    
    @IBAction func btn_Back(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carname.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell 
    {
        let cell = Table_View.dequeueReusableCell(withIdentifier: "Home1") as! Home1
        
        cell.Name.text = name[indexPath.row]
        
        cell.CarName.text = carname[indexPath.row]
        
        cell.CarPrice.text = carprice[indexPath.row]
        
        cell.CarDistance.text = cardistance[indexPath.row]
        
        cell.CarGearType.text = cargeartype[indexPath.row]
        
        cell.CarFuelType.text = carfueltype[indexPath.row]
        
        cell.CarModelYear.text = carmodelyear[indexPath.row]

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) 
    {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "HomeVC3")
    
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func ChatBtn(_ sender: UIButton)
    {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ChatListVC")
    
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
