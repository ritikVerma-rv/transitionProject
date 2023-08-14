//
//  OswaldCollectionCell.swift
//  transitionDemoApp
//
//  Created by Apple on 12/08/23.
//

import UIKit

class OswaldCollectionCell: UICollectionViewCell {
    @IBOutlet weak var constantHeightReady: NSLayoutConstraint!
    @IBOutlet weak var constantHeightOswald: NSLayoutConstraint!
    @IBOutlet weak var oswaldLabel: UILabel!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var secondVIew: UIView!
    @IBOutlet weak var playLabel: UILabel!
    
    var firstViewOriginX = 0.00
    var secondViewOriginX = 0.00
    var thirdViewOriginX = 0.00
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        DispatchQueue.main.async {
            self.contentView.layoutIfNeeded()
            
            self.constantHeightReady.constant = 0.00
            self.constantHeightOswald.constant = 0.00
            
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


                    //self.firstView.frame = self.firstView.frame.offsetBy(dx: 0, dy: 0)
                    //self.secondVIew.frame = self.secondVIew.frame.offsetBy(dx: 0, dy: 0)
                    //self.thirdView.frame = self.thirdView.frame.offsetBy(dx: 0, dy: 0)
                }
            }
        }
    }
    
}
