//
//  HomeVC2.swift
//  Buyer
//
//  Created by yugansh on 03/02/24.
//

import UIKit

class HomeVC2: UIViewController, UITableViewDelegate, UITableViewDataSource 
{
    
    @IBOutlet weak var btn_Post: UIButton!
    
    @IBOutlet weak var txt_Search: UITextField!
    
    @IBOutlet weak var btn_Buy: UIButton!
    
    @IBOutlet weak var Table_View: UITableView!
    
    
    
    var carimage = ["Car 1","Car 2","Car 3"]
    var carname = ["Hyundai Creata","Mustang GT","Mustang GT"]
    var carprice = ["10,00,000","40,00,000","10,00,000"]
    var cardistance = ["20000kms to 50000 kms","50000kms to 70000 kms","20000kms to 50000 kms"]
    var cargeartype = ["Manual","Manual","Manual"]
    var carfueltype = ["Diesel","Diesel","Diesel"]
    var carmodelyear = ["2019 to 2022","2020 to 2022","2019 to 2022"]
    var time = ["25, august 2022","25, august 2022","25, august 2022"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.btn_Post.layer.cornerRadius = 10
        
        self.Table_View.delegate = self
        
        self.Table_View.dataSource = self
        
        let em = UIImage(named: "Search")
        addleftimage(textFlied : txt_Search , andimage : em!)
    }
    
    
    func   addleftimage(textFlied : UITextField , andimage img : UIImage)
    {
        let leftimageview = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: 20, height: 20))
        leftimageview.image = img
        textFlied.leftView = leftimageview
        textFlied.leftViewMode = .always
    }
    
    
    @IBAction func btn_Buy(_ sender: UIButton)
    {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "HomeVC")
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int 
    {
        return carname.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell 
    {
        let cell = Table_View.dequeueReusableCell(withIdentifier: "Home2") as! Home2
        
        cell.CarName.text = carname[indexPath.row]
        
        cell.CarImage.image = UIImage(named: "\(carimage[indexPath.row])")
        
        cell.CarPrice.text = carprice[indexPath.row]
        
        cell.CarDistance.text = cardistance[indexPath.row]
        
        cell.CarGearType.text = cargeartype[indexPath.row]
        
        cell.CarType.text = carfueltype[indexPath.row]
        
        cell.CarDate.text = carmodelyear[indexPath.row]
        
        cell.Time.text = "\(time[indexPath.row])"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) 
    {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "HomeVC3")
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
