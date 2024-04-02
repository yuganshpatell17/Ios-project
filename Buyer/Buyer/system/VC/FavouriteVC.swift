//
//  FavouriteVC.swift
//  
//
//  Created by yugansh on 14/02/24.
//

import UIKit

class FavouriteVC: UIViewController, UITableViewDelegate, UITableViewDataSource 
{
    @IBOutlet weak var btn_Back: UIButton!
    
    @IBOutlet weak var Table_view: UITableView!
    
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

        self.Table_view.delegate = self
        self.Table_view.dataSource = self
        
        // Do any additional setup after loading the view.
    }

    
    @IBAction func btn_Back(_ sender: UIButton) 
    {
        self.popVC()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int 
    {
        return carname.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell 
    {
        let cell = Table_view.dequeueReusableCell(withIdentifier: "Favourite1") as! Favourite1
        
        cell.Name.text = name[indexPath.row]
        
        cell.CarName.text = carname[indexPath.row]
        
        cell.CarPrice.text = carprice[indexPath.row]
        
        cell.CarDistance.text = cardistance[indexPath.row]
        
        cell.CarGearType.text = cargeartype[indexPath.row]
        
        cell.CarFuelType.text = carfueltype[indexPath.row]
        
        cell.CarModelYear.text = carmodelyear[indexPath.row]

        return cell
    }
}
