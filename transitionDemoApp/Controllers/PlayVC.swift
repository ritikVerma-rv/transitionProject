//
//  ViewController.swift
//  TransitionApp
//
//  Created by Apple on 09/08/23.
//

import UIKit
import Hero

class PlayVC: UIViewController {
    //MARK: - @IBOutlet
    @IBOutlet weak private var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
    }
    
    private func setUpCollectionView() {
        collectionView.register(UINib(nibName: KeyConstant.CellIds.play.rawValue, bundle: nil),
                                forCellWithReuseIdentifier: KeyConstant.CellIds.play.rawValue)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.hero.isEnabled = true
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension PlayVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: collectionView.frame.size.width, height: collectionView.frame.size.height * 0.65)
    }
}

//MARK: - UICollectionViewDataSource
extension PlayVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KeyConstant.CellIds.play.rawValue, for: indexPath) as! PlayCollectionCell
        cell.orangeButton.hero.id = KeyConstant.Titles.yellowView.rawValue
        cell.yellowView.hero.id = KeyConstant.Titles.orangeView.rawValue
        return cell
    }
}

//MARK: - UICollectionViewDelegate
extension PlayVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: KeyConstant.VCIds.candy.rawValue) as! CandyVC
        vc.hero.isEnabled = true
        present(vc, animated: true, completion: nil)
    }
}
