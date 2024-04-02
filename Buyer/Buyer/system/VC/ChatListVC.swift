//
//  ChatListVC.swift
//  Buyer
//
//  Created by yugansh on 01/02/24.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import Firebase

class ChatListVC: UIViewController
{
    

    @IBOutlet weak var Table_View: UITableView!
    
    @IBOutlet weak var txt_Search: UITextField!
   
    var thredmodel = [chat_List]()
    
    var model : chat_List!
    
    var image_name = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17"]
//    
//    var name = ["Denish Patel","Jenny Wilson","Jerome Bell","Cameron Williamson","Bessie Cooper","Ralph Edwards","Joshua Lawrence","Andrew Parker","Martin Randolph","Kieron Dotson","Zack John","Karen Castillo","Jamie Franco","Maximillian Jacobson","Martha Craig","Tabitha Potter","Maisy Humphrey"]
//    
//    var massage = ["Hyundai creata","Maruti","Mustang Gt","Hey","Perfect!! Will check it.","Hey","Hyundai creata","Maruti","Mustang Gt","Hey","Perfect!! Will check it.","Hey","Hyundai creata","Maruti","Mustang Gt","Hey","Perfect!! Will check it."]
//    
//    var tik = ["BlueTik","BlueTik","BlueTik","BlueTik","GrayTik","GrayTik","BlueTik","BlueTik","BlueTik","BlueTik","GrayTik","GrayTik","BlueTik","BlueTik","BlueTik","BlueTik","GrayTik"]
//    
//    var online_offline = ["Online", "Online","Online","Online","Offline","Offline","Online","Online","Online","Online","Offline","Offline","Online","Online","Online","Online","Offline"]
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        userdataGet()
        
        self.Table_View.delegate = self
        
        self.Table_View.dataSource = self
        
        let em = UIImage(named: "Search")
        addleftimage(textFlied : txt_Search , andimage : em!)
    
    }
    
    
    
    @IBAction func btn_Back(_ sender: UIButton)
    {
        self.popVC()
    }
    
}


extension ChatListVC : UITableViewDelegate, UITableViewDataSource
{
    func   addleftimage(textFlied : UITextField , andimage img : UIImage)
    {
        let leftimageview = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: 20, height: 20))
        leftimageview.image = img
        textFlied.leftView = leftimageview
        textFlied.leftViewMode = .always
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return thredmodel.count
    }  
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = Table_View.dequeueReusableCell(withIdentifier: "ChatVC") as! ChatVC
        
        cell.profile_Image.image = UIImage(named: image_name[indexPath.row])
        
        let index = thredmodel[indexPath.row]
        
        cell.lbl_Name.text = index.city
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChatScreenVC") as! ChatScreenVC
        
        let index = thredmodel[indexPath.row]
        
        vc.image_name = UIImage(named: image_name[indexPath.row])!
        
        vc.name = index.city
        vc.Reciver = index.Id
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func userdataGet() 
    {
        let db = Firestore.firestore()
        
        let collection = db.collection("user")
            
        collection.whereField("name", notIn: [Auth.auth().currentUser?.email ?? ""]).getDocuments
        { querysnapshot, erro in
            
            if let error = erro as? NSError
            {
                print(error.localizedDescription)
                
            } 
            else
            {
                let arr = querysnapshot?.documents
                for i in arr! 
                {
                    self.model = chat_List(dic: i.data())
                    self.thredmodel.append(self.model)
                    self.Table_View.reloadData()
                }
            }
        }
    }
}
