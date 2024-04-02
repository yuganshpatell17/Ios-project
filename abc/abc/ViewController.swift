import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate 
{
    
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    
    var bool_1 = Bool()
    var bool_2 = Bool()
    
    override func viewDidLoad() 
    {
        super.viewDidLoad()
        
        self.btn1.layer.cornerRadius = self.btn1.frame.height / 2
        self.btn2.layer.cornerRadius = self.btn2.frame.height / 2
    }
    
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) 
    {
        
        if bool_1 == true 
        {
            
            if let a = info[.editedImage] ?? info[.originalImage] 
            {
                img2.image = a as? UIImage
                self.dismiss(animated: true)
            }
            bool_1 = false
        }
        
        if bool_2 == true 
        {
            
            if let a = info[.editedImage] ?? info[.originalImage] 
            {
                img1.image = a as? UIImage
                self.dismiss(animated: true)
            }
            bool_2 = false
            
        }
        
    }
    
    @IBAction func btu_2(_ sender: Any) 
    {
        bool_1 = true
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        
        
        self.present(imagePicker, animated: true)
        
        
        
    }
    
    @IBAction func but_1(_ sender: Any) 
    {
        bool_2 = true
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        
        
        self.present(imagePicker, animated: true)
        
    }
    
    
}

