import UIKit
import AVFAudio

class PlayMusicVC: UIViewController 
{

    
    @IBOutlet weak var btn_Play: UIButton!
    
    var player : AVAudioPlayer?
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btn_Back(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btn_Play(_ sender: UIButton) 
    {
        if player?.isPlaying == true
        {
            self.btn_Play.setImage(UIImage(named: "play"), for: .normal)
            
            player!.pause()
        }
        else
        {
            playSong(song_name: "Jai Shree Ram", song_type: "mp3")
            
            self.btn_Play.setImage(UIImage(named: "pause"), for: .normal)
            
            player?.play()
        }
    }
    
    func playSong(song_name:String, song_type:String)
    {
        let urlString = Bundle.main.path(forResource: song_name , ofType: song_type)

        do
        {
            try AVAudioSession.sharedInstance().setMode(.default)

            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)

            guard let urlString = urlString else { return }

            self.player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))

            guard let player = self.player else { return }

            player.play()
            

                
        }
        catch
        {
            print("Something Went Wrong")
        }
    }
}
