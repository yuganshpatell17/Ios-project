import UIKit

class Home: UIViewController, PlayVCDelegate
{
    @IBOutlet weak var btn_Music: UIButton!
    @IBOutlet weak var lbl_Home: UILabel!
    
    var name = ""
    
    override func viewDidLoad() 
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.lbl_Home.text = name
    }
    
    @IBAction func btn_Music(_ sender: UIButton) 
    {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "PlayVC") as! PlayVC
        
        vc.delegate = self
        
        vc.callback = 
        {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "PlayMusicVC") as! PlayMusicVC

            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        self.present(vc, animated: true)
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func play_1() 
    {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "PlayMusicVC") as! PlayMusicVC
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func play_2() 
    {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "PlayMusicVC") as! PlayMusicVC
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func PlayMusicVC()
    {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "PlayMusicVC") as! PlayMusicVC
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
