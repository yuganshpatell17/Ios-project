import UIKit

class choosepodcasts: UIViewController 
{

    @IBOutlet weak var btn_Search: UITextField!
    
    @IBOutlet weak var btn_Next: UIButton!
    
    override func viewDidLoad() 
    {
        super.viewDidLoad()

        self.btn_Search.layer.cornerRadius = self.btn_Search.frame.height / 2
        self.btn_Next.layer.cornerRadius = self.btn_Next.frame.height / 2
    }
    

    @IBAction func btn_Back(_ sender: UIButton) 
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btn_Next(_ sender: UIButton) 
    {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC")
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
