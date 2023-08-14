//
//  NextVC.swift
//  transitionDemoApp
//
//  Created by Apple on 10/08/23.
//

import UIKit

class BalanceVC: UIViewController {
    
    var isAnimationDone = false

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "BalanceCollectionCell", bundle: nil), forCellWithReuseIdentifier: "BalanceCollectionCell")
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
    }
    
}

extension BalanceVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BalanceCollectionCell", for: indexPath) as! BalanceCollectionCell
        
        return cell
    }
 
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if let cell = cell as? BalanceCollectionCell {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                if !self.isAnimationDone {
                    self.isAnimationDone = true
                    cell.animationFromCenter()
                    cell.animationFromRight()
                }
            }
        }
    }

}

 
