//
//  NextCollectionCell.swift
//  transitionDemoApp
//
//  Created by Apple on 10/08/23.
//

import UIKit

class NextCollectionCell: UICollectionViewCell {
    //MARK: - @IBOutlet
    @IBOutlet weak private var constantWidth: NSLayoutConstraint!
    @IBOutlet weak private var constantHeight: NSLayoutConstraint!
    @IBOutlet weak private var rectangleView: UIView!
    @IBOutlet weak private var firstSquareView: UIView!
    @IBOutlet weak private var secondSquareView: UIView!
    @IBOutlet weak private var firstAnimatedRectangleView: UIView!
    @IBOutlet weak private var secondAnimatedRectangleView: UIView!
    @IBOutlet weak private var thirdAnimatedRectangleView: UIView!
    @IBOutlet weak private var fourthAnimatedRectangleView: UIView!
    //MARK: - Varriables
    private let widthValue = 120.00
    private let heightValue = 25.00
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupIntialUI()
    }
}

//MARK: - NextCollectionCellMethods
extension NextCollectionCell {
    
    //MARK: - SetupIntialUI
    private func setupIntialUI() {
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
    }
    
    //MARK: - AnimationFromCenter
    func animationFromCenter() {
        UIView.animate(withDuration: 1.0) { //1
            self.contentView.layoutIfNeeded()
            self.constantWidth.constant = self.widthValue
            self.constantHeight.constant = self.heightValue
            self.contentView.layoutIfNeeded()
        }
    }
    
    //MARK: - AnimationFromRight
    func animationFromRight() {
        UIView.animate(withDuration: 0.3) { [self] in
            firstSquareView.frame = firstSquareView.frame.offsetBy(dx: 0, dy: 0)
            firstAnimatedRectangleView.frame = firstAnimatedRectangleView.frame.offsetBy(dx: 0, dy: 0)
            secondAnimatedRectangleView.frame = secondAnimatedRectangleView.frame.offsetBy(dx: 0, dy: 0)
           
            secondSquareView.frame = firstSquareView.frame.offsetBy(dx: 0, dy: 0)
            thirdAnimatedRectangleView.frame = firstAnimatedRectangleView.frame.offsetBy(dx: 0, dy: 0)
            fourthAnimatedRectangleView.frame = secondAnimatedRectangleView.frame.offsetBy(dx: 0, dy: 0)
        }
    }
}
