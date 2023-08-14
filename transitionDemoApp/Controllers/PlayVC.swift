//
//  ViewController.swift
//  TransitionApp
//
//  Created by Apple on 09/08/23.
//

import UIKit
import Hero

class PlayVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "PlayCollectionCell", bundle: nil), forCellWithReuseIdentifier: "PlayCollectionCell")

        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.hero.isEnabled = true
    }
}

extension PlayVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: collectionView.frame.size.width, height: collectionView.frame.size.height * 0.75)
    }
}

extension PlayVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayCollectionCell", for: indexPath) as! PlayCollectionCell
        
        cell.orangeButton.hero.id = "ironMan"
        cell.yellowView.hero.id = "batMan"
        
        


        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "CandyVC") as! CandyVC
        vc.hero.isEnabled = true
        present(vc, animated: true, completion: nil)
    }
    
//    func performHeroTransition(from cell: PlayCollectionCell, at indexPath: IndexPath) {
//           let vc = storyboard?.instantiateViewController(withIdentifier: "CandyVC") as! CandyVC
//
//
//           // Enable Hero for the destination view controller
//        vc.hero.isEnabled = true
//
//           // Set the animation type to automatically match the views
//        vc.hero.modalAnimationType = .fade
//
//           navigationController?.pushViewController(vc, animated: true)
//       }
   }
  

