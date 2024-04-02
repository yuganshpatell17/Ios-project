//
//  BirdVoiceVC.swift
//  JanaavarAvaaj
//
//  Created by Yash Dhaduk on 13/03/24.
//

import UIKit
import AVFoundation

class BirdVoiceVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    let images = ["Parrots","Crow","Peacock","Duck","Dove","Pigeon","Penguin","Owl","Sparrow","Hen","Eagle","Kingfisher","Budgerigar","Bluebird","Woodpeckers"]
    let number = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15"]
    let name = ["Parrots","Crow","Peacock","Duck","Dove","Pigeon","Penguin","Owl","Sparrow","Hen","Eagle","Kingfisher","Budgerigar","Bluebird","Woodpeckers"]

    @IBOutlet weak var collectionview: UICollectionView!
    
    var player: AVAudioPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionview.dataSource = self
        self.collectionview.delegate = self
        // Do any additional setup after loading the view.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return name.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BirdVoiceCell", for: indexPath) as! BirdVoiceCell
        
        cell.img_birds.image = UIImage(named: images[indexPath.row])
        cell.lbl_no.text = number[indexPath.row]
        cell.lbl_name.text = name[indexPath.row]
        
        return cell
    }
    
  
        
       
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       

        let name2 = name[indexPath.row]
        
        playSound(sound: name2)
        
        func playSound(sound: String) {
            guard let path = Bundle.main.path(forResource: sound , ofType:"mp3") else {
                return }
            let url = URL(fileURLWithPath: path)

            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.play()
                
            } catch let error {
                print(error.localizedDescription)
            }
        }
        
    }
        


}

