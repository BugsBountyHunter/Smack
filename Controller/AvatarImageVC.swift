//
//  AvatarImageVC.swift
//  Smack
//
//  Created by Ahmed on 9/19/1439 AH.
//  Copyright © 1439 AH Steph_saber. All rights reserved.
//

import UIKit

class AvatarImageVC:UIViewController,UICollectionViewDelegate,UICollectionViewDataSource
           ,UICollectionViewDelegateFlowLayout {
    
    //outlet
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var segmentChanged: UISegmentedControl!
    // var
    
    var avatarType = AvatarType.dark
    

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
      
    }
    //Work with collection view
    
    //number of element
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "avatarImage", for: indexPath) as? AvatarCell{
            cell.configureCell(index: indexPath.item, type: avatarType)
            return cell
        }
        return AvatarCell()
    }
    //number of section
    func numberOfSections(in collectionView: UICollectionView) -> Int {
       return 1
    }
    //number of item in section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 28
    }
    // size of screeen
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var numberOfColumns:CGFloat = 3
        if UIScreen.main.bounds.width > 320{
            numberOfColumns = 4
        }
        let spaceBetweenCells:CGFloat = 10
        let padding:CGFloat = 40
        let cellDimention = ((collectionView.bounds.width - padding) - (numberOfColumns - 1) * spaceBetweenCells) / numberOfColumns
        return CGSize(width: cellDimention, height: cellDimention)
    }
    
    //select image
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if avatarType == .dark {
            
            UserDataService.instance.setAvatarName(avatarName: "dark\(indexPath.item)")
        }else{
            UserDataService.instance.setAvatarName(avatarName: "light\(indexPath.item)")
        }
        self.dismiss(animated: true, completion: nil)
    
    }
    
    
    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func segmentControlChanged(_ sender: Any) {
        if segmentChanged.selectedSegmentIndex == 0 {
            avatarType = .dark
        }else{
            avatarType = .light
        }
        collectionView.reloadData()
        
    }
    
    
    
    

    

}
