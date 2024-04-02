//
//  TableVC.swift
//  abc
//
//  Created by yugansh on 24/01/24.
//

import UIKit
import AVFAudio

protocol changedelegate
{
    func passdata(data : String )
}

class TableVC: UIViewController, UITableViewDelegate, UITableViewDataSource 
{
    
    @IBOutlet weak var Segment: UISegmentedControl!
    
    @IBOutlet weak var tableView: UITableView!
    
    var player : AVAudioPlayer?
    
    var delegate : changedelegate!
    
    var arr = ["21","22","23","24","25","26","27","28","29","30"]
    
    var arr2 = ["yudhishthira"," bhim","arjun","nakul","Sahadeva","krishna","pitamah bhishma","duryodhana" ,"balram" ,"pandu","dhritarashtra"]
    
    var arr3 = ["Yudhishthira (Sanskrit: युधिष्ठिर, IAST: Yudhiṣṭhira) also known as Dharmaraja, was the king of Indraprastha (Current Delhi) and later the Kuru Kingdom in ancient Indian History and the eldest among the five Pandava brothers, he is also one of the central figures of the ancient Hindu epic Mahabharata.Yudhishthira was the son of Kunti, the first wife of King Pandu, fathered by the god Yama due to Pandu's inability to have children. Yudhishthira held a belief in dharma (morals and virtues) and was chosen to be the crown prince of Kuru.", "In the Hindu epic Mahabharata, Bhima (Sanskrit: भीम, IAST: Bhīma) is the second among the five Pandavas. The Mahabharata relates many events that portray the might of Bhima. Bhima was born when Vayu, the wind god, granted a son to Kunti and Pandu. After the death of Pandu and Madri, Kunti with her sons stayed in Hastinapura. From his childhood, Bhima had a rivalry with his cousins Kauravas, especially Duryodhana.", "Arjuna (Sanskrit: अर्जुन, IAST: Arjuna), also known as Partha and Dhananjaya, a protagonist of the Hindu epic Mahabharata. In the epic he is the third of five Pandava brothers, from the lineage of the Kuru. In the Mahabharata War, Arjuna was a key warrior from the Pandava side and killed many warriors. Before the beginning of the war, his mentor Krishna gave him the supreme knowledge of the Bhagavad Gita to overcome his moral dilemmas.", "In the Hindu epic Mahabharata, Nakula (Sanskrit: नकुल) was the fourth of the five Pandava brothers. Nakula and Sahadeva were twins blessed to Kunti, by the Ashvini Kumaras, the divine physicians and adopted by Pandu and Madri.[2] Their parents – Pandu and Madri – died early, so the twins were adopted by their mother, Kunti and were trained by Drona in Hastinapura. Skilled in Ayurveda, sword fighting, and horse keeping, Nakula is described as the most handsome man in the Mahabharata." ,"Sahadeva (Sanskrit: सहदेव) was the youngest of the Pandava brothers, the five principal protagonists of the epic Mahabharata. He and his twin brother, Nakula, were blessed to Queen Kunti by invoking the twin gods Ashvins and adopted by King Pandu and Queen Madri. Trained by Drona, Kripa and Brihaspati, Sahadeva is described to be skilled in swordsmanship and astrology, and also Neeti Sastra.", "(Mahabharata, Book 12, Chapter 80) I never behave with slavish obsequiousness towards my kinsmen by flattering speeches about their prosperity. I give them half of what I have and forgive their evil speeches. As a fire-stick is ground by a person desirous of obtaining fire, even so, my heart is ground by my kinsmen with their cruel speeches. Indeed, those cruel speeches burn my heart every day. Might reside in Sankarshana (Balarama); mildness in Gada; and as regards Pradyumna, he surpasses even me in the beauty of a person.", "Bhishma (Sanskrit: भीष्म, romanized: bhīṣma, lit. 'terrible'),[1] also known as Pitamaha, Gangaputra, and Devavrata, is a major character of the epic Mahabharata. He was the supreme commander of the Kaurava forces during the Kurukshetra War of the epic. He was the only character who witnessed the entirety of the events of the Mahabharata, beginning from the reign of his father, King Shantanu of the Kuru kingdom. Bhishma was the stepbrother of Vyasa, the grandfather of both the Pandavas and the Kauravas. He was a prominent statesman of the Kuru Kingdom.", "Duryodhana (Sanskrit: दुर्योधन, IAST: Duryodhana), also known as Suyodhana, is the primary antagonist in the Hindu epic Mahabharata. He was the eldest of the Kauravas, the hundred sons of the king Dhritarashtra and his queen Gandhari.Being the first-born son of the king, he was the crown prince of the Kuru Kingdom and its capital of Hastinapura, often forced into ceding the title to his cousin Yudhishthira, who was one of the Pandava brothers and older than he. Aided by his maternal uncle Shakuni, Duryodhana tricked the Pandavas into surrendering their kingdom and forced them to go into exile.", "Balarama (Sanskrit: बलराम, IAST: Balarāma) is a Hindu god. The elder brother of Vāsudeva-Krishna[7][8] he is described in the Bhagavata Purana as the highest form of divinity that expanded into Vishnu and creation.[9] He is particularly significant in the Jagannath tradition, as one of the triad deities.", "In the Hindu epic Mahabharata, Pandu (Sanskrit: पाण्डु, romanized: Pāṇḍu, lit. 'pale') was a king of the Kuru Kingdom. He was the foster-father of the five Pandava brothers, who were the boons bestowed upon his wife Kunti by a number of deities, owing to his inability to bear children following sage Kindama's curse. He belonged to the Kuru Dynasty.", "Dhritarashtra (Sanskrit: धृतराष्ट्र, ISO-15919: Dhr̥tarāṣṭra) was a Kuru king, and the father of the Kauravas in the Hindu epic Mahabharata. He was the King of the Kuru Kingdom, with its capital at Hastinapura. He was born to Vichitravirya's first wife, Ambika.Dhritarashtra was born blind.."]
    
    var song_image = ["31","32","33","34"]
    
    var song_name = ["Ram","Keejo Kesari Ke Laal","Ram Siya Ram","Jai Shree Ram"]
    
    var song_dis = ["mp3","mp3","mp3","mp3"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.tableView.delegate = self
        
        self.tableView.dataSource = self
        
    }
    
    @IBAction func Segment(_ sender: UISegmentedControl) 
    {
        tableView.reloadData()
        
        player?.pause()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if Segment.selectedSegmentIndex == 0 
        {
            return arr.count
        } 
        else if Segment.selectedSegmentIndex == 1
        {
            return song_image.count
        } 
        else
        {
            return song_image.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell 
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTable") as! ImageTable
        
        if Segment.selectedSegmentIndex == 0
        {
            cell.img_Name.image = UIImage(named: arr[indexPath.row])
            
            cell.lab_Name.text = arr2[indexPath.row]
            
            cell.lab_Description.text = arr3[indexPath.row]
        
        }
        else if Segment.selectedSegmentIndex == 1
        {
            cell.img_Name.image = UIImage(named: song_image[indexPath.row])
            
            cell.lab_Name.text = song_name[indexPath.row]
            
            cell.lab_Description.text = song_dis[indexPath.row]
            
        }
        else
        {
            cell.img_Name.image = UIImage(named: song_image[indexPath.row])
            
            cell.lab_Name.text = song_name[indexPath.row]
            
            cell.lab_Description.text = song_dis[indexPath.row]
        }
        
        return cell
    }
    
    @objc func change(_ sender : UIButton)
    {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ShowProfile") as! ShowProfile
        
        vc.Image_Name = UIImage(named: arr[sender.tag])!
        
        vc.Lable_Name = arr2[sender.tag]
        
        vc.Lable_Description = arr3[sender.tag]
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat 
    {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) 
    {
        self.playSong(song_name: song_name[indexPath.row])
        
        if Segment.selectedSegmentIndex == 0
        {
            player?.pause()
            
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ShowProfile") as! ShowProfile
            
            vc.Image_Name = UIImage(named: arr[indexPath.row])!
            
            vc.Lable_Name = arr2[indexPath.row]
            
            vc.Lable_Description = arr3[indexPath.row]
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if Segment.selectedSegmentIndex == 1
        {
            player?.play()
            
        }
        else
        {
            player?.pause()
            
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ShowProfile") as! ShowProfile
            
            vc.Image_Name = UIImage(named: song_image[indexPath.row])!
            
            vc.Lable_Name = song_name[indexPath.row]
            
            vc.Lable_Description = song_dis[indexPath.row]
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
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
