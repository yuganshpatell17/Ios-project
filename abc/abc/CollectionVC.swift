//
//  CollectionVC.swift
//  abc
//
//  Created by yugansh on 30/01/24.
//

import UIKit

class CollectionVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource 
{
   

    @IBOutlet weak var CollectionView: UICollectionView!

    var namelable = ["Check 1","Check 2","Check 3","Check 4","Check 5","Check 6","Check 7","Check 8","Check 9","Check 10"]
    
    var Checkboxstates : [Bool] = []
    
    override func viewDidLoad() 
    {
        super.viewDidLoad()
        CollectionView.delegate = self
        
        CollectionView.dataSource = self
    
        Checkboxstates = Array(repeating: false, count: namelable.count)
        
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int 
    {
        return namelable.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        let Cell = CollectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        Cell.btn_CheckBox.tag = indexPath.row
        
        Cell.lbl_Name.text = namelable[indexPath.row]
        
        Cell.btn_CheckBox.addTarget(self, action: #selector(checkBox(_ :)), for: .touchDown)
        
        if Checkboxstates[indexPath.row] 
        {
            Cell.btn_CheckBox.setImage(UIImage(named: "checked"), for: .normal)
        }
        else
        {
            Cell.btn_CheckBox.setImage(UIImage(named: "unchecked"), for: .normal)
        }
    
        return Cell
    }
    
    @objc func checkBox (_ sender: UIButton) 
    {
        
        let row = sender.tag
        
        Checkboxstates[row] = !Checkboxstates[row]
        
        if Checkboxstates[row] 
        {
            sender.setImage(UIImage(named: "checked"), for: .normal)
        }
        else
        {
            sender.setImage(UIImage(named: "unchecked"), for: .normal)
        }
    }
}
