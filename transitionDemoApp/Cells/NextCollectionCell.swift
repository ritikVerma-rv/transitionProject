//
//  NextCollectionCell.swift
//  transitionDemoApp
//
//  Created by Apple on 10/08/23.
//

import UIKit

class NextCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var constantWidth: NSLayoutConstraint!
    @IBOutlet weak var constantHeight: NSLayoutConstraint!
    @IBOutlet weak var rectangleView: UIView!
    
    @IBOutlet weak var firstSquareView: UIView!
    @IBOutlet weak var secondSquareView: UIView!

    @IBOutlet weak var firstAnimatedRectangleView: UIView!
    @IBOutlet weak var secondAnimatedRectangleView: UIView!
    @IBOutlet weak var thirdAnimatedRectangleView: UIView!
    @IBOutlet weak var fourthAnimatedRectangleView: UIView!

    
    var widthValue = 100.00
    var heightValue = 20.00
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        DispatchQueue.main.async {
            self.contentView.layoutIfNeeded()
            
            let widthView = self.contentView.frame.size.width + 100
            
            self.firstSquareView.frame = self.firstSquareView.frame.offsetBy(dx: widthView - 40, dy: 0)
            self.firstAnimatedRectangleView.frame = self.firstAnimatedRectangleView.frame.offsetBy(dx: widthView - 70, dy: 0)
            self.secondAnimatedRectangleView.frame = self.secondAnimatedRectangleView.frame.offsetBy(dx: widthView - 30, dy: 0)
            
            self.secondSquareView.frame = self.secondSquareView.frame.offsetBy(dx: widthView - 40, dy: 0)
            self.thirdAnimatedRectangleView.frame = self.thirdAnimatedRectangleView.frame.offsetBy(dx: widthView - 70, dy: 0)
            self.fourthAnimatedRectangleView.frame = self.fourthAnimatedRectangleView.frame.offsetBy(dx: widthView - 30, dy: 0)
            
            self.contentView.layoutIfNeeded()
        }
        

                // Initialization code
        
        
        
//        self.contentView.layoutIfNeeded()
//
//        widthValue =  constantWidth.constant
//        heightValue =  constantHeight.constant
//
//        constantWidth.constant =  0.00
//        constantHeight.constant =  0.00
//
//        self.contentView.layoutIfNeeded()
    }
    
    
    
    func animationFromCenter() {
        let rectangleView: CGFloat = 60
        
        UIView.animate(withDuration: 1.0) { //1
            self.contentView.layoutIfNeeded()
            self.constantWidth.constant = self.widthValue
            self.constantHeight.constant = self.heightValue
            self.contentView.layoutIfNeeded()
        }
    }
    
    func animationFromRight() {
        UIView.animate(withDuration: 0.3) { [self] in
            firstSquareView.frame = self.firstSquareView.frame.offsetBy(dx: 0, dy: 0)
            firstAnimatedRectangleView.frame = self.firstAnimatedRectangleView.frame.offsetBy(dx: 0, dy: 0)
            secondAnimatedRectangleView.frame = self.secondAnimatedRectangleView.frame.offsetBy(dx: 0, dy: 0)
           
            self.secondSquareView.frame = self.firstSquareView.frame.offsetBy(dx: 0, dy: 0)
            self.thirdAnimatedRectangleView.frame = self.firstAnimatedRectangleView.frame.offsetBy(dx: 0, dy: 0)
            self.fourthAnimatedRectangleView.frame = self.secondAnimatedRectangleView.frame.offsetBy(dx: 0, dy: 0)
        }
    }
    
}
