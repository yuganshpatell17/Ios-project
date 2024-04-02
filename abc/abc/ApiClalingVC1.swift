//
//  ApiClalingVC1.swift
//  abc
//
//  Created by yugansh on 02/02/24.
//

import UIKit
import Alamofire

struct UserData1
{
    var postId = 0
    var id = 0
    var name = ""
    var email = ""
    var body = ""
    
    init(dic : NSDictionary)
    {
        self.postId = (dic["postId"] as? Int) ?? 0
        self.id = (dic["id"] as? Int) ?? 0
        self.name = (dic["name"] as? String) ?? ""
        self.email = (dic["email"] as? String) ?? ""
        self.body = (dic["body"] as? String) ?? ""
    }
}

class ApiClalingVC1: UIViewController, UITableViewDelegate, UITableViewDataSource 
{
    
    @IBOutlet weak var Table_View: UITableView!
    
    var arr = [UserData1]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        Table_View.delegate = self
        
        Table_View.dataSource = self
        
        AF.request("https://jsonplaceholder.typicode.com/comments",method: .get).responseJSON
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
                            
                                self.arr.append(UserData1(dic: dic))
                            
                            }
                        
                        }
                        self.Table_View.reloadData()
                    
                    }
                
                case .failure(let err):
                    print(err)
            }
            
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell1") as! TableViewCell1
        
        let index = self.arr[indexPath.row]
        
        cell.postId.text = "\(index.postId)"
        
        cell.id.text = "\(index.id)"
        
        cell.name.text = index.name
        
        cell.email.text = index.email
        
        cell.body.text = index.body
        
        return cell
    }

   
}
