import UIKit
import AVFAudio

protocol PlayMusicVCDelegate
{
    func play_1()
    func play_2()
}

class PlayMusicVC: UIViewController 
{
    
    @IBOutlet weak var play_1: UIButton!
    
    @IBOutlet weak var play_2: UIButton!
    
    @IBOutlet weak var play_3: UIButton!
    
    @IBOutlet weak var play_4: UIButton!
    
    var player : AVAudioPlayer?
    var delegate : PlayMusicVCDelegate?
    var callback : (() -> Void)?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func play_1(_ sender: UIButton) 
    {
        if player?.isPlaying == true
        {
            self.play_1.setImage(UIImage(named: "play"), for: .normal)
            
            player!.pause()
        }
        else
        {
            playSong(song_name: "Keejo Kesari Ke Laal", song_type: "mp3")
            
            self.play_1.setImage(UIImage(named: "pause"), for: .normal)
            
            player?.play()
        }
    }
    
    @IBAction func play_2(_ sender: UIButton)
    {
        if player?.isPlaying == true
        {
            self.play_2.setImage(UIImage(named: "play"), for: .normal)
            
            player!.pause()
        }
        else
        {
            playSong(song_name: "Ram Siya Ram", song_type: "mp3")
            
            self.play_2.setImage(UIImage(named: "pause"), for: .normal)
            
            player?.play()
        }
    }
    
    @IBAction func play_3(_ sender: UIButton)
    {
        if player?.isPlaying == true
        {
            self.play_3.setImage(UIImage(named: "play"), for: .normal)
            
            player!.pause()
        }
        else
        {
            playSong(song_name: "Ram", song_type: "mp3")
            
            self.play_3.setImage(UIImage(named: "pause"), for: .normal)
            
            player?.play()
        }
    }
    
    @IBAction func play_4(_ sender: UIButton)
    {
        if player?.isPlaying == true
        {
            self.play_4.setImage(UIImage(named: "play"), for: .normal)
            
            player!.pause()
        }
        else
        {
            playSong(song_name: "Jai Shree Ram", song_type: "mp3")
            
            self.play_4.setImage(UIImage(named: "pause"), for: .normal)
            
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
