//
//  NextVC.swift
//  transitionDemoApp
//
//  Created by Apple on 10/08/23.
//

import UIKit

class OswaldVC: UIViewController {
    
    var isAnimationDone = false

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "OswaldCollectionCell", bundle: nil), forCellWithReuseIdentifier: "OswaldCollectionCell")
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
    }
    
}

extension OswaldVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OswaldCollectionCell", for: indexPath) as! OswaldCollectionCell
        
        return cell
    }
 
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        
//        if let cell = cell as? OswaldCollectionCell {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//                if !self.isAnimationDone {
//                    self.isAnimationDone = true
//                  //  cell.animationFromCenter()
//                    cell.animationFromRight()
//                }
//            }
//        }
//    }

}

 
