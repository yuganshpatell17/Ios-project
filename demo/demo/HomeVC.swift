import UIKit


var isLogin = UserDefaults.standard

class HomeVC: UIViewController
{
    
    
    
    override func viewDidLoad()
    {
        
        super.viewDidLoad()

    }
    
    @IBAction func btn_YourLibrary(_ sender: UIButton) 
    {
        sender.isSelected.toggle()
        if sender.isSelected {
        }
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController_4")
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btn_Song(_ sender: UIButton) 
    {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PlayMusicVC")
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func btn_Search(_ sender: UIButton) 
    {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchVC")
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
