import UIKit

class SearchVC: UIViewController 
{

    override func viewDidLoad() 
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btn_YourLibrary(_ sender: UIButton) 
    {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController_4")
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btn_Home(_ sender: UIButton) 
    {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC")
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}
