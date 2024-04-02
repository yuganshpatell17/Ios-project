//
//  Car_Detail_vc.swift
//  Buyer
//
//  Created by yugansh on 05/02/24.
//

import UIKit

class Car_Detail_vc: UIViewController, UITableViewDataSource, UITableViewDelegate 
{
    @IBOutlet weak var Table_View: UITableView!
    
    var car_image = ["Car 1","Car 2","Car 3"]
    
    var owner_name = ["Denish Patel","Denish Patel","Denish Patel"]
    
    var car_name = ["Hyundai Creata","Mustang GT","Mustang GT"]
    
    var car_price = ["10,00,000","40,00,000","10,00,000"]
    
    var car_distance = ["20000kms to 50000 kms","50000kms to 70000 kms","20000kms to 50000 kms"]
    
    var car_gear_type = ["Manual","Manual","Manual"]
    
    var car_fuel_type = ["Diesel","Diesel","Diesel"]
    
    var car_model_year = ["2019 to 2022","2020 to 2022","2019 to 2022"]
    
    var register_number = ["85698UIH4585","85698UIH4586","85698UIH4587"]
    
    var car_description = ["Lorem ipsum dolor sit amet consectetur. Enim egestas nunc sed suspendisse augue scelerisque risus. Nec senectus risus enim malesuada fermentum. Sed risus sociis et purus vitae congue ipsum nibh. Commodo egestas ac egestas phasellus at fringilla faucibus.","Lorem ipsum dolor sit amet consectetur. Enim egestas nunc sed suspendisse augue scelerisque risus. Nec senectus risus enim malesuada fermentum. Sed risus sociis et purus vitae congue ipsum nibh. Commodo egestas ac egestas phasellus at fringilla faucibus.","Lorem ipsum dolor sit amet consectetur. Enim egestas nunc sed suspendisse augue scelerisque risus. Nec senectus risus enim malesuada fermentum. Sed risus sociis et purus vitae congue ipsum nibh. Commodo egestas ac egestas phasellus at fringilla faucibus."]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.Table_View.dataSource = self
        self.Table_View.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int 
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell 
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Car_Detail_cell" ) as! Car_Detail_cell
        
        cell.Car_Image.image = UIImage(named: "\(car_image[indexPath.row])")
    
        cell.Car_Owner_lbl.text = owner_name[indexPath.row]
        
        cell.Car_Name_lbl.text = car_name[indexPath.row]
        
        cell.Car_Price_lbl.text = car_price[indexPath.row]
        
        cell.Car_Distance_lbl.text = car_distance[indexPath.row]
        
        cell.Car_Gear_type_lbl.text = car_gear_type[indexPath.row]
        
        cell.Car_Fuel_type.text = car_fuel_type[indexPath.row]
        
        cell.Car_Date_lbl.text = car_model_year[indexPath.row]
        
        cell.Register_Number_lbl.text = register_number[indexPath.row]
        
        cell.Car_Description_lbl.text = car_description[indexPath.row]
        
        return cell
    }
    
    @IBAction func Make_Sold(_ sender: UIButton) 
    {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Add_Inventory_vc")
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }

    @IBAction func Back_btn(_ sender: UIButton) 
    {
        self.popVC()
    }
}
