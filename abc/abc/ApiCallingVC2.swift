//
//  ApiCallingVC2.swift
//  abc
//
//  Created by yugansh on 03/02/24.
//

import UIKit
import Alamofire

struct UserData2
{
    var id = 0
    var title = ""
    var price = 0.0
    var description1 = ""
    var category = ""
    var image1 = ""
    
    init(dic : NSDictionary)
    {
        self.id = (dic["id"] as? Int) ?? 0
        self.title = (dic["title"] as? String) ?? ""
        self.price = (dic["price"] as? Double) ?? 0.0
        self.description1 = (dic["description"] as? String) ?? ""
        self.category = (dic["category"] as? String) ?? ""
        self.image1 = (dic["image"] as? String) ?? ""
    }
}

class ApiCallingVC2: UIViewController, UITableViewDelegate, UITableViewDataSource
{

    @IBOutlet weak var Table_View: UITableView!
    
    var arr = [UserData2]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        Table_View.delegate = self
        
        Table_View.dataSource = self
        
        AF.request("https://fakestoreapi.com/products",method: .get).responseJSON
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
                            
                                self.arr.append(UserData2(dic: dic))
                            
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell2") as! TableViewCell2
        
        let index = self.arr[indexPath.row]
        
        cell.id.text = "\(index.id)"
        
        cell.title.text = index.title
        
        cell.price.text = "\(index.price)"
        
        cell.description1.text = index.description1
        
        cell.category.text = index.category
        
//        cell.image1.image = "\(index.image1)"
        
        if let imageUrl = URL(string: index.image1) 
        {
            DispatchQueue.global().async
            {
                if let imageData = try? Data(contentsOf: imageUrl),
                   let image = UIImage(data: imageData)
                {
                    DispatchQueue.main.async
                    {
                        cell.image1.image = image
                    }
                }
            }
        }
        
        return cell
    }
}
