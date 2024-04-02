import UIKit

class ViewController_4: UIViewController 
{
    
    @IBOutlet weak var btn_Playlist: UIButton!
    
    @IBOutlet weak var btn_Artists: UIButton!
    
    @IBOutlet weak var btn_Albums: UIButton!
    
    @IBOutlet weak var btn_Poducasts_Shows: UIButton!
 
    
    static var shar = ViewController_4()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.btn_Playlist.layer.cornerRadius = self.btn_Playlist.frame.height / 2
        self.btn_Artists.layer.cornerRadius = self.btn_Artists.frame.height / 2
        self.btn_Albums.layer.cornerRadius = self.btn_Albums.frame.height / 2
        self.btn_Poducasts_Shows.layer.cornerRadius = self.btn_Poducasts_Shows.frame.height / 2
        
        self.btn_Playlist.layer.borderWidth = 1
        self.btn_Artists.layer.borderWidth = 1
        self.btn_Albums.layer.borderWidth = 1
        self.btn_Poducasts_Shows.layer.borderWidth = 1
        
        self.btn_Playlist.layer.borderColor = UIColor.white.cgColor
        self.btn_Artists.layer.borderColor = UIColor.white.cgColor
        self.btn_Albums.layer.borderColor = UIColor.white.cgColor
        self.btn_Poducasts_Shows.layer.borderColor = UIColor.white.cgColor
        
    }
    
    @IBAction func btn_Back(_ sender: UIButton) 
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btn_Search(_ sender: UIButton) 
    {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchVC")
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func btn_Home(_ sender: UIButton) 
    {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC")
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
