//
//  BalanceCollectionCell.swift
//  transitionDemoApp
//
//  Created by Apple on 11/08/23.
//

import UIKit

class BalanceCollectionCell: UICollectionViewCell {
    //MARK: - @IBOutlet
    @IBOutlet weak private var sideView: UIView!
    @IBOutlet weak private var constantHeightSideView: NSLayoutConstraint!
    @IBOutlet weak private var constantHeightWalletView: NSLayoutConstraint!
    @IBOutlet weak private var contantWidthRectangleView: NSLayoutConstraint!
    @IBOutlet weak private var constantHeightRacttbalegView: NSLayoutConstraint!
    @IBOutlet weak private var balanceStackView: UIStackView!
    @IBOutlet weak private var fifteenButton: UIButton!
    @IBOutlet weak private var tenButton: UIButton!
    @IBOutlet weak private var fiveButton: UIButton!
    @IBOutlet weak private var RectangleView: UIView!
    //MARK: - Varriables
    private let widthValue = 120.00
    private let heightValue = 25.00
    private var fiveButtonX = 0.00
    private var tenButtonX = 0.00
    private var fifteenButtonX = 0.00
    private let rectabgleFrame = CGRect()
    private let greenColor = UIColor(red: 126/255, green: 207/255, blue: 44/255, alpha: 1.0)
    private let grayColor = UIColor(red: 198/255, green: 198/255, blue: 198/255, alpha: 1)
    private let animationDuration = 0.8
    private let constant_18 = 18.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupIntialUI()
    }
}

//MARK: - BalanceCollectionCellMethos
extension BalanceCollectionCell {
    
    private func setupIntialUI() {
        DispatchQueue.main.async {
            self.contentView.layoutIfNeeded()
            
            self.sideView.alpha = 0.00

            self.constantHeightSideView.constant = CGFloat.zero
            self.constantHeightWalletView.constant = CGFloat.zero
            self.contantWidthRectangleView.constant = CGFloat.zero
            self.constantHeightRacttbalegView.constant = CGFloat.zero
            
            let widthView = self.contentView.frame.size.width

            self.fiveButtonX = self.fiveButton.frame.origin.x
            self.tenButtonX = self.tenButton.frame.origin.x
            self.fifteenButtonX = self.fifteenButton.frame.origin.x

            self.fiveButton.frame.origin.x = widthView
            self.tenButton.frame.origin.x = widthView
            self.fifteenButton.frame.origin.x = widthView
            
            self.fiveButton.backgroundColor = self.greenColor
            self.tenButton.backgroundColor = self.grayColor
            self.fifteenButton.backgroundColor = self.grayColor

            self.contentView.layoutIfNeeded()
        }
    }

    func animationFromCenter() {
        UIView.animate(withDuration: animationDuration) {
            self.contentView.layoutIfNeeded()
            self.contentView.layoutIfNeeded()
        }
    }
    
    func animationFromRight() {
        DispatchQueue.main.async {
            UIView.animate(withDuration: self.animationDuration) {
                self.contentView.layoutIfNeeded()
                self.contantWidthRectangleView.constant = self.widthValue
                self.constantHeightRacttbalegView.constant = self.heightValue
                self.contentView.layoutIfNeeded()
            }
            completion: { _ in
                
                UIView.animate(withDuration: self.animationDuration) {
                    self.fiveButton.frame.origin.x = self.fiveButtonX
                    self.tenButton.frame.origin.x = self.tenButtonX
                    self.fifteenButton.frame.origin.x = self.fifteenButtonX
                    self.tenButton.isSelected = true

                }
                
                completion: { _ in
                    UIView.animate(withDuration: self.animationDuration) {
                        self.sideView.alpha = 1.00
                        self.contentView.layoutIfNeeded()
                        self.constantHeightSideView.constant = self.constant_18
                        self.constantHeightWalletView.constant = self.constant_18
                        self.contentView.layoutIfNeeded()
                    }
                }
            }
        }
    }
}

//MARK: - Button's Actions
extension BalanceCollectionCell {
    
    @IBAction private func fiveButtonPressed(_ sender: Any) {
        fiveButton.backgroundColor = greenColor
        tenButton.backgroundColor = grayColor
        fifteenButton.backgroundColor = grayColor
    }
    
    @IBAction private func tenButtonPressed(_ sender: Any) {
        fiveButton.backgroundColor = grayColor
        tenButton.backgroundColor =  greenColor
        fifteenButton.backgroundColor = grayColor
    }
    
    @IBAction private func fifteenButtonPressed(_ sender: Any) {
        fiveButton.backgroundColor = grayColor
        tenButton.backgroundColor = grayColor
        fifteenButton.backgroundColor =  greenColor
    }
}
