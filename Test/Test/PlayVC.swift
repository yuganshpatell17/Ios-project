import UIKit
import AVFAudio

protocol PlayVCDelegate
{
    func PlayMusicVC()
}
class PlayVC: UIViewController 
{
    @IBOutlet weak var btn_play1: UIButton!
    
    @IBOutlet weak var btn_play2: UIButton!
    
    @IBOutlet weak var btn_play3: UIButton!
    
    @IBOutlet weak var btn_play4: UIButton!
    
    var player : AVAudioPlayer?
    var delegate : PlayVCDelegate?
    var callback : (() -> Void)?
    
    override func viewDidLoad() 
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btn_play1(_ sender: UIButton) 
    {
        self.delegate?.PlayMusicVC()
        self.dismiss(animated: true)
    }
    @IBAction func btn_play2(_ sender: UIButton) 
    {
        self.delegate?.PlayMusicVC()
        self.dismiss(animated: true)
    }
    @IBAction func btn_play3(_ sender: UIButton) 
    {
        self.callback?()
        self.dismiss(animated: true)
    }
    @IBAction func btn_play4(_ sender: UIButton)
    {
        self.callback?()
        self.dismiss(animated: true)
    }
}
