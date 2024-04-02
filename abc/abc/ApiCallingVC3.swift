//
//  ApiCallingVC3.swift
//  abc
//
//  Created by yugansh on 03/02/24.
//

import UIKit
import Alamofire

struct UserData3
{
    var albumId = 0
    var id = 0
    var title = ""
    var url = ""
    var thumbnailUrl = ""
    
    init(dic : NSDictionary)
    {
        self.albumId = (dic["albumId"] as? Int) ?? 0
        self.id = (dic["id"] as? Int) ?? 0
        self.title = (dic["title"] as? String) ?? ""
        self.url = (dic["url"] as? String) ?? ""
        self.thumbnailUrl = (dic["thumbnailUrl"] as? String) ?? ""
    }
}

class ApiCallingVC3: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    @IBOutlet weak var Table_View: UITableView!
    
    var arr = [UserData3]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        Table_View.delegate = self
        
        Table_View.dataSource = self
        
        AF.request("https://jsonplaceholder.typicode.com/photos",method: .get).responseJSON
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
                            
                                self.arr.append(UserData3(dic: dic))
                            
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell3") as! TableViewCell3
        
        let index = self.arr[indexPath.row]
        
        cell.albumId.text = "\(index.albumId)"
        
        cell.id.text = "\(index.id)"
        
        cell.title.text = index.title
        
//        cell.url.text = index.url
        
//        cell.thumbnailUrl.text = index.thumbnailUrl
        
//        cell.image1.image = "\(index.image1)"
        
        if let imageUrl = URL(string: index.url)
        {
            DispatchQueue.global().async
            {
                if let imageData = try? Data(contentsOf: imageUrl),
                   let image = UIImage(data: imageData)
                {
                    DispatchQueue.main.async
                    {
                        cell.url.image = image
                    }
                }
            }
        }
        
        if let imageUrl = URL(string: index.thumbnailUrl)
        {
            DispatchQueue.global().async
            {
                if let imageData = try? Data(contentsOf: imageUrl),
                   let image = UIImage(data: imageData)
                {
                    DispatchQueue.main.async
                    {
                        cell.thumbnailUrl.image = image
                    }
                }
            }
        }

        return cell
    
    }
}
