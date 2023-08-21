//
//  NextVC.swift
//  transitionDemoApp
//
//  Created by Apple on 10/08/23.
//

import UIKit

class NextVC: UIViewController {
    //MARK: - @IBOutlet
    @IBOutlet weak var downloadButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    //MARK: - Varriables
    private var isAnimationDone = false
    private var cellType : KeyConstant.CellView = .twoSkeltonView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
    }
    
    //MARK: - SetUpCollectionView
    private func setUpCollectionView() {
        collectionView.register(UINib(nibName: KeyConstant.CellIds.next.rawValue, bundle: nil),
                                forCellWithReuseIdentifier: KeyConstant.CellIds.next.rawValue)
        collectionView.register(UINib(nibName: KeyConstant.CellIds.balance.rawValue, bundle: nil),
                                forCellWithReuseIdentifier: KeyConstant.CellIds.balance.rawValue)
        collectionView.register(UINib(nibName: KeyConstant.CellIds.oswald.rawValue, bundle: nil),
                                forCellWithReuseIdentifier: KeyConstant.CellIds.oswald.rawValue)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
}

//MARK: - Button's_Actions
extension NextVC {
    @IBAction private func dismissButtonTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction private func downloadButtonPressed(_ sender: Any) {
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

//MARK: - UICollectionViewDelegateFlowLayout
extension NextVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
}

//MARK: - UICollectionViewDelegate
extension NextVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if cellType == .twoSkeltonView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KeyConstant.CellIds.next.rawValue,
                                                          for: indexPath) as! NextCollectionCell
            return cell
        }
        else if cellType == .walletCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KeyConstant.CellIds.balance.rawValue,
                                                          for: indexPath) as! BalanceCollectionCell
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KeyConstant.CellIds.oswald.rawValue,
                                                          for: indexPath) as! OswaldCollectionCell
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let afterSeconds = 1.0
        
        if cellType == .twoSkeltonView {
            if let cell = cell as? NextCollectionCell {
                DispatchQueue.main.asyncAfter(deadline: .now() + afterSeconds) {
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
                DispatchQueue.main.asyncAfter(deadline: .now() + afterSeconds) {
                    if !self.isAnimationDone {
                        self.isAnimationDone = true
                        cell.animationFromRight()
                    }
                }
            }
        }
        else {
            if let cell = cell as? OswaldCollectionCell {
                DispatchQueue.main.asyncAfter(deadline: .now() + afterSeconds) {
                    if !self.isAnimationDone {
                        self.isAnimationDone = true
                        cell.animationFromRight()
                        self.downloadButton.setTitle(KeyConstant.Titles.confirm.rawValue, for: .normal)
                        self.downloadButton.setTitleColor(.white, for: .normal)
                        self.downloadButton.backgroundColor = .black
                    }
                }
            }
        }
    }
}
