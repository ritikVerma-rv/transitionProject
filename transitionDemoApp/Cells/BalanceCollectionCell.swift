//
//  BalanceCollectionCell.swift
//  transitionDemoApp
//
//  Created by Apple on 11/08/23.
//

import UIKit

class BalanceCollectionCell: UICollectionViewCell {

    @IBOutlet weak var sideView: UIView!
    @IBOutlet weak var constantHeightSideView: NSLayoutConstraint!
    @IBOutlet weak var constantHeightWalletView: NSLayoutConstraint!
    @IBOutlet weak var contantWidthRectangleView: NSLayoutConstraint!
    @IBOutlet weak var constantHeightRacttbalegView: NSLayoutConstraint!
    @IBOutlet weak var animationStackView: UIStackView!
    @IBOutlet weak var balanceStackView: UIStackView!
    @IBOutlet weak var fifteenButton: UIButton!
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var RectangleView: UIView!
   
    var widthValue = 100.00
    var heightValue = 20.00
    
    var fiveButtonX = 0.00
    var tenButtonX = 0.00
    var fifteenButtonX = 0.00
    
    var rectabgleFrame = CGRect()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        DispatchQueue.main.async {
            self.contentView.layoutIfNeeded()
            
            self.sideView.alpha = 0.00
            
            self.constantHeightSideView.constant = CGFloat.zero
            self.constantHeightWalletView.constant = CGFloat.zero

            self.contantWidthRectangleView.constant = CGFloat.zero
            self.constantHeightRacttbalegView.constant = CGFloat.zero
            
            //self.rectabgleFrame  = self.RectangleView.frame
            
            //self.RectangleView.frame = CGRect.zero

            let widthView = self.contentView.frame.size.width

            self.fiveButtonX = self.fiveButton.frame.origin.x
            self.tenButtonX = self.tenButton.frame.origin.x
            self.fifteenButtonX = self.fifteenButton.frame.origin.x

            self.fiveButton.frame.origin.x = widthView
            self.tenButton.frame.origin.x = widthView
            self.fifteenButton.frame.origin.x = widthView

            self.contentView.layoutIfNeeded()
        }
        
    }
    
    
    
    func animationFromCenter() {
        let RectangleView: CGFloat = 60
        
        UIView.animate(withDuration: 1.0) { //1
            self.contentView.layoutIfNeeded()
      //      self.constantWidth.constant = self.widthValue
        //    self.constantHeight.constant = self.heightValue
            self.contentView.layoutIfNeeded()
        }
    }
    
    func animationFromRight() {
        DispatchQueue.main.async {
//            self.contentView.layoutIfNeeded()
            
            UIView.animate(withDuration: 0.8) {
                self.contentView.layoutIfNeeded()
                self.contantWidthRectangleView.constant = self.widthValue
                self.constantHeightRacttbalegView.constant = self.heightValue
                self.contentView.layoutIfNeeded()
            }
            completion: { _ in
                
                UIView.animate(withDuration: 0.8) {
                    self.fiveButton.frame.origin.x = self.fiveButtonX
                    self.tenButton.frame.origin.x = self.tenButtonX
                    self.fifteenButton.frame.origin.x = self.fifteenButtonX

                }
                completion: { _ in
                    UIView.animate(withDuration: 0.8) {
                        self.sideView.alpha = 1.00
                        self.contentView.layoutIfNeeded()
                        self.constantHeightSideView.constant = 18.0
                        self.constantHeightWalletView.constant = 18.0
                        self.contentView.layoutIfNeeded()
                    }
                }
            }
        }
    }
    
}
