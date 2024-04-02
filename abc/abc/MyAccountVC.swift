import UIKit

class MyAccountVC: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate 
{

    @IBOutlet weak var image: UIButton!
    
    @IBOutlet weak var btn_a: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.image.layer.cornerRadius = self.image.frame.height / 2
    }
    
    @IBAction func btn_a(_ sender: UIButton) 
    {
        var img = UIImagePickerController()
        img.sourceType = .photoLibrary
        img.allowsEditing = true
        img.delegate = self
        
        
        self.present(img, animated: true)
        
    }
    
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        if let a = info[.editedImage] ?? info[.originalImage] 
        {
            if let img = a as? UIImage 
            {
                //self.img.image
            }
        }
    }
}
