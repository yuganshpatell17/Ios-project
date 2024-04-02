//
//  ShowProfile.swift
//  abc
//
//  Created by yugansh on 24/01/24.
//

import UIKit
import AVFAudio

class ShowProfile: UIViewController , changedelegate
{
    
    
    @IBOutlet weak var btn_Play_Pause: UIButton!
    
    @IBOutlet weak var img_Name: UIImageView!
    
    @IBOutlet weak var lab_Name: UILabel!
    
    @IBOutlet weak var lab_Description: UILabel!
    
    @IBOutlet weak var txt_Change: UITextField!
    
    @IBOutlet weak var btn_Change: UIButton!
    
    var Image_Name = UIImage()
    
    var Lable_Name = String()
    
    var Lable_Description = String()
    
    var Text_Flied = String()
    
    var player : AVAudioPlayer?
    
    var play_pause : Int = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.img_Name.image = Image_Name
        
        self.lab_Name.text = Lable_Name
        
        self.lab_Description.text = Lable_Description
        
        self.txt_Change.text = Text_Flied
        
//        if play_pause == 0
//        {
//            btn_Play_Pause.isHidden = true
//        }
//        else
//        {
//            btn_Play_Pause.isHidden = false
//        }

        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btn_Change(_ sender: UIButton) 
    {
        self.lab_Name.text = self.txt_Change.text
        
        self.txt_Change.text = ""
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TableVC") as! TableVC
        
        vc.delegate = self
        
        vc.delegate.passdata(data: self.txt_Change.text!)
    }
    
  
    @IBAction func btn_Play_Pause(_ sender: UIButton) 
    {
        if player?.isPlaying == true
        {
            player?.pause()
            
            btn_Play_Pause.setImage(UIImage(named: "play"), for: .normal)
        }
        else
        {
            self.playSong(song_name: "\(Lable_Name)")
            
            btn_Play_Pause.setImage(UIImage(named: "pause"), for: .normal)
            
            player?.play()
        }
    }
    
    func passdata(data: String)
    {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TableVC") as! TableVC
        
        self.Text_Flied = Lable_Name
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func playSong(song_name:String)
    {
        let urlString = Bundle.main.path(forResource: song_name , ofType: "mp3")

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
