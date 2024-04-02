//
//  SettingsVC.swift
//  
//
//  Created by yugansh on 14/02/24.
//

import UIKit

class SettingsVC: UIViewController, UITableViewDelegate, UITableViewDataSource 
{
    
    @IBOutlet weak var txt_Search: UITextField!
    
    @IBOutlet weak var Table_View: UITableView!
    
    var name = ["Profile Details","All Requirements","PIN Change","About us","Term & Condition","Privacy Policy","FAQ","Log Out"]
    
    var image = ["profile","all","pin 1","about","term","privacy","FAQ","Log Out"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.Table_View.delegate = self
        self.Table_View.dataSource = self

        let em = UIImage(named: "Search")
        addleftimage(textFlied : txt_Search , andimage : em!)
        
        // Do any additional setup after loading the view.
    }
    
    func   addleftimage(textFlied : UITextField , andimage img : UIImage)
    {
        let leftimageview = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: 20, height: 20))
        leftimageview.image = img
        textFlied.leftView = leftimageview
        textFlied.leftViewMode = .always
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int 
    {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = Table_View.dequeueReusableCell(withIdentifier: "Settings1") as! Settings1
        
        cell.lbl_Name.text = name[indexPath.row]
        
        cell.image_View.image = UIImage(named: "\(image[indexPath.row])")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100
    }
    
    
    @IBAction func btn_Back(_ sender: Any) 
    {
        self.popVC()
    }
}
