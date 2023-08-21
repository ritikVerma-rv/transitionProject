//
//  OswaldCollectionCell.swift
//  transitionDemoApp
//
//  Created by Apple on 12/08/23.
//

import UIKit

class OswaldCollectionCell: UICollectionViewCell {
    //MARK: - @IBOutlet
    @IBOutlet weak private var constantHeightReady: NSLayoutConstraint!
    @IBOutlet weak private var constantHeightOswald: NSLayoutConstraint!
    @IBOutlet weak private var oswaldLabel: UILabel!
    @IBOutlet weak private var firstView: UIView!
    @IBOutlet weak private var thirdView: UIView!
    @IBOutlet weak private var secondVIew: UIView!
    @IBOutlet weak private var playLabel: UILabel!
    //MARK: - Varriables
    var firstViewOriginX = 0.00
    var secondViewOriginX = 0.00
    var thirdViewOriginX = 0.00
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupIntialView()
    }
}

//MARK: - OswaldCollectionCellMethods
extension OswaldCollectionCell {
    
    private func setupIntialView() {
        DispatchQueue.main.async {
            self.contentView.layoutIfNeeded()
            
            self.constantHeightReady.constant = CGFloat.zero
            self.constantHeightOswald.constant = CGFloat.zero
            
            let widthView = self.contentView.frame.size.width + 100
            
            self.firstViewOriginX = self.firstView.frame.origin.x
            self.secondViewOriginX = self.secondVIew.frame.origin.x
            self.thirdViewOriginX = self.thirdView.frame.origin.x
            
            self.firstView.frame.origin.x = widthView - 40
            self.secondVIew.frame.origin.x = widthView - 70
            self.thirdView.frame.origin.x = widthView - 100
            
            self.contentView.layoutIfNeeded()
        }
    }
    
    func animationFromRight() {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.8) {
                self.contentView.layoutIfNeeded()
                self.constantHeightReady.constant = 22.0
                self.constantHeightOswald.constant = 18.00
                self.contentView.layoutIfNeeded()
            }
            completion: { _ in
                UIView.animate(withDuration: 0.8) {
                    self.firstView.frame.origin.x = self.firstViewOriginX
                    self.secondVIew.frame.origin.x = self.secondViewOriginX
                    self.thirdView.frame.origin.x = self.thirdViewOriginX
                }
            }
        }
    }
}
