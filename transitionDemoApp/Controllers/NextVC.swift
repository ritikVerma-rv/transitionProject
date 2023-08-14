//
//  NextVC.swift
//  transitionDemoApp
//
//  Created by Apple on 10/08/23.
//

import UIKit

class NextVC: UIViewController {
    
    @IBOutlet weak var downloadButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var isAnimationDone = false
    var cellType : CellView = .twoSkeltonView

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "NextCollectionCell", bundle: nil), forCellWithReuseIdentifier: "NextCollectionCell")
        collectionView.register(UINib(nibName: "BalanceCollectionCell", bundle: nil), forCellWithReuseIdentifier: "BalanceCollectionCell")
        collectionView.register(UINib(nibName: "OswaldCollectionCell", bundle: nil), forCellWithReuseIdentifier: "OswaldCollectionCell")

        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    @IBAction func downloadButtonPressed(_ sender: Any) {
        if cellType == .twoSkeltonView {
            cellType = .walletCell
            isAnimationDone = false
        }
        else if cellType == .walletCell {
            cellType = .oswaldCell
            isAnimationDone = false
            
        }
        
        collectionView.reloadData()
    }
}



extension NextVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
}

extension NextVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if cellType == .twoSkeltonView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NextCollectionCell", for: indexPath) as! NextCollectionCell
            return cell
        }
        else if cellType == .walletCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BalanceCollectionCell", for: indexPath) as! BalanceCollectionCell
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OswaldCollectionCell", for: indexPath) as! OswaldCollectionCell
            return cell
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if cellType == .twoSkeltonView {
            if let cell = cell as? NextCollectionCell {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    if !self.isAnimationDone {
                        self.isAnimationDone = true
                        cell.animationFromCenter()
                        cell.animationFromRight()
                    }
                }
            }
        }
        else if cellType == .walletCell {
            if let cell = cell as? BalanceCollectionCell {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    if !self.isAnimationDone {
                        self.isAnimationDone = true
//                        cell.animationFromCenter()
                        cell.animationFromRight()
                    }
                }
            }
        }
        else {
            if let cell = cell as? OswaldCollectionCell {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    if !self.isAnimationDone {
                        self.isAnimationDone = true
//                        cell.animationFromCenter()
                        cell.animationFromRight()
                        
                        self.downloadButton.setTitle("Confirm", for: .normal)
                        self.downloadButton.setTitleColor(.white, for: .normal)
                        self.downloadButton.backgroundColor = .black
                    }
                }
            }
        }
    }
}



