//
//  ChatScreenVC.swift
//  Buyer
//
//  Created by yugansh on 01/02/24.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ChatScreenVC: UIViewController
{

    @IBOutlet weak var Table_View: UITableView!
    
    @IBOutlet weak var lbl_On_Off: UILabel!
    
    @IBOutlet weak var lbl_Name: UILabel!
    
    @IBOutlet weak var profile_image: UIImageView!
    
    @IBOutlet weak var massage_txt: UITextField!
    
    var Reciver = ""
    
    var image_name = UIImage()
    
    var chat : [String] = [""]
    
    var name : String = ""
    
    var online_offline : String = ""
    
    var userchat = [Massages]()
    
    var massageModel : Massages!
    
    var username = ""
    
    var userimage = UIImage()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        userdataGet()
        
        self.lbl_Name.text = username
        
        self.profile_image.image = userimage
        
        self.profile_image.layer.cornerRadius = self.profile_image.frame.width / 2
        
        self.profile_image.clipsToBounds = true
        
        self.profile_image.contentMode = .scaleAspectFill
        
        self.profile_image.image = image_name
        
        self.lbl_Name.text = name
        
        self.lbl_On_Off.text = online_offline
        
        self.Table_View.delegate = self
        
        self.Table_View.dataSource = self
        
        Table_View.register(UINib(nibName: "SenderTC", bundle: nil), forCellReuseIdentifier: "SenderTC")

        Table_View.register(UINib(nibName: "ReciverTC", bundle: nil), forCellReuseIdentifier: "ReciverTC")

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btn_Back(_ sender: UIButton) 
    {
        self.popVC()
    }
    
    @IBAction func btn_Send(_ sender: UIButton) 
    {
        Reciver = lbl_Name.text!
       
        massage(Id: CurrentUserUid, Massages: massage_txt.text!, Reciver: Reciver)
        userdataGet()
        self.Table_View.reloadData()
        self.massage_txt.text = ""
    }
}

extension ChatScreenVC : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return userchat.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
       
        let data = userchat[indexPath.row]
        if data.senderId ==  CurrentUserUid 
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReciverTC") as! ReciverTC
            

            cell.massage_Lable.text = data.Massages

            return cell
        }
        else 
        {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "SenderTC") as! SenderTC
            cell.massage_Lable.text = data.Massages
            
            return cell
        }
    }
    
    func userdataGet() 
    {
            let db = Firestore.firestore()
            let collection = db.collection("Massages")
            
            collection.whereField(CurrentUserUid, isEqualTo: CurrentUserUid).whereField(Reciver, isEqualTo: Reciver).addSnapshotListener { querySnapshot, erro in
                
                    if let error = erro as? NSError
                    {
                        print(error.localizedDescription)
                    }
                    else
                    {
                        let data = querySnapshot?.documents
                        print(data ?? "")
                        self.userchat.removeAll()
                        for arr in data! 
                        {
                            self.massageModel = Massages(dic: arr.data())
                            self.userchat.append(self.massageModel)
                        }
                        print(self.userchat)
                        self.Table_View.reloadData()
                    }
                }
    }
}
