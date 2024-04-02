//
//  ApiCallingVC.swift
//  abc
//
//  Created by yugansh on 02/02/24.
//

import UIKit
import Alamofire

struct UserData
{
    var id = 0
    
    var name = ""
    
    var username = ""
    
    var email = ""
    
    var address : Address
    
    var phone = ""
    
    var website = ""
    
    var company : Company
        
    struct Address
    {
        var street = ""
    
        var suite = ""
        
        var city = ""
        
        var zipcode = ""
        
        var geo : Geo
            
        struct Geo
        {
                
            var lat = ""
        
            var lng = ""
        }
    }
    struct Company
    {
        var name2 = ""
        
        var catchPhrase = ""
        
        var bs = ""
    }
        
        
    init(dic: NSDictionary) 
    {
        self.id = (dic["id"] as? Int) ?? 0
    
        self.name = (dic["name"] as? String) ?? ""
        
        self.username = (dic["username"] as? String) ?? ""
        
        self.email = (dic["email"] as? String) ?? ""
        
        self.phone = dic["phone"] as? String ?? ""
        
        self.website = dic["website"] as? String ?? ""
            
        let addressDict = dic["address"] as? NSDictionary ?? [:]
        
        self.address = Address(
            street: addressDict["street"] as? String ?? "",
            suite: addressDict["suite"] as? String ?? "",
            city: addressDict["city"] as? String ?? "",
            zipcode: addressDict["zipcode"] as? String ?? "",
            geo: Address.Geo(
                lat: (addressDict["geo"] as? NSDictionary)?["lat"] as? String ?? "",
                lng: (addressDict["geo"] as? NSDictionary)?["lng"] as? String ?? ""
                )
            )
            
        let companyDict = dic["company"] as? NSDictionary ?? [:]
        
        self.company = Company(
            name2: companyDict["name"] as? String ?? "",
            catchPhrase: companyDict["catchPhrase"] as? String ?? "",
            bs: companyDict["bs"] as? String ?? ""
        )
    }
    
}

class ApiCallingVC: UIViewController, UITableViewDelegate, UITableViewDataSource
{
   

    @IBOutlet weak var Table_View: UITableView!
    
    var arr = [UserData]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        Table_View.delegate = self
        
        Table_View.dataSource = self
        
        // Do any additional setup after loading the view.
        
        AF.request("https://jsonplaceholder.typicode.com/users",method: .get).responseJSON 
        {
            data in
            
            switch data.result 
            {
                case .success(let data1):
                
                    if let ans = data1 as? NSArray
                    {
                    
                        for i in ans 
                        {
                        
                            if let dic = i as? NSDictionary 
                            {
                            
                                self.arr.append(UserData(dic: dic))
                            
                            }
                        
                        }
                        self.Table_View.reloadData()
                    
                    }
                
                case .failure(let err):
                    print(err)
            }
            
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int 
    {
        return self.arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        
        let index = arr[indexPath.row]
        
        cell.id.text = "\(index.id)"
        
        cell.name.text = index.name
        
        cell.username.text = index.username
        
        cell.email.text = index.email
        
        cell.street.text = "\(index.address.street)"
        
        cell.suite.text = "\(index.address.suite)"
        
        cell.city.text = "\(index.address.city)"
        
        cell.zipcode.text = "\(index.address.zipcode)"
        
        cell.lat.text = "\(index.address.geo.lat)"
        
        cell.lng.text = "\(index.address.geo.lng)"
        
        cell.phone.text = index.phone
        
        cell.website.text = index.website
        
        cell.name2.text = "\(index.company.name2)"
        
        cell.catchPhrase.text = "\(index.company.catchPhrase)"
        
        cell.bs.text = "\(index.company.bs)"
        
        return cell
    }
}
