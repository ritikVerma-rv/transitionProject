//
//  CandyVC.swift
//  transitionDemoApp
//
//  Created by Apple on 10/08/23.
//

import UIKit
import Hero

class CandyVC: UIViewController {
    //MARK: - @IBOutlet
    @IBOutlet weak private var leadingLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak private var sideViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak private var topViewConstrain: NSLayoutConstraint!
    @IBOutlet weak private var yellowView: UIView!
    @IBOutlet weak private var downloadButton: UIButton!
    @IBOutlet weak private var playButton: UIButton!
    @IBOutlet weak private var tickButton: UIButton!
    @IBOutlet weak private var rightView: UIView!
    @IBOutlet weak private var sideView: UIView!
    @IBOutlet weak private var downloadTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak private var leadingPlayConstraint: NSLayoutConstraint!
    @IBOutlet weak private var trailingPlayConstraint: NSLayoutConstraint!
    @IBOutlet weak private var bottomPlayConstraint: NSLayoutConstraint!
    //MARK: - Varriables
    private var progressBar: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupIntialUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        dismissUIMethods()
    }
    
}

//MARK: - @IBAction
extension CandyVC {
    @IBAction private func dismissButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction private func playButton(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "NextVC") as! NextVC
        vc.hero.modalAnimationType = .slide(direction: .up)
        present(vc, animated: true, completion: nil)
        
    }
    
    @IBAction private func downloadButton(_ sender: UIButton) {
        self.progressBar.alpha = 0.0
        
        UIView.animate(withDuration: 1.0) {
            
            self.view.layoutIfNeeded()
            self.downloadTrailingConstraint.constant = 65.00
            self.tickButton.alpha = 1.0
            self.view.layoutIfNeeded()
            
        } completion: { _ in
            
            let colorValue = self.downloadButton.backgroundColor
            self.downloadButton.backgroundColor = colorValue?.withAlphaComponent(0.3)
            self.progressBar.backgroundColor = colorValue
            self.progressBar.alpha = 1.0
            self.perform(#selector(self.showPlayButtonAnimation), with: nil, afterDelay: 0.7)
        }
    }

}

//MARK: - Methods
extension CandyVC {
    @objc private func showPlayButtonAnimation() {
        UIView.animate(withDuration: 1.0) {
            self.progressBar.frame.size.width = self.downloadButton.bounds.width
            self.downloadButton.setTitle(KeyConstant.Titles.mb_10_30.rawValue, for: .normal)
        }
        completion: { _ in
            let image = UIImage.init(named: "doneImage")
            self.tickButton.setImage(image, for: .normal)
            
            UIView.animate(withDuration: 0.9) { [self] in
                self.view.layoutIfNeeded()
                self.tickButton.alpha = 0.0
                self.downloadButton.alpha = 0.0
                self.playButton.isHidden = false
                self.playButton.alpha = 1.0
                self.bottomPlayConstraint.constant = 65.0
                self.leadingPlayConstraint.constant = 15.0
                self.trailingPlayConstraint.constant = 15.0
                self.view.layoutIfNeeded()
            }
        }
    }
    
    private func dismissUIMethods() {
        UIView.animate(withDuration: 1.5) { [self] in
            self.view.layoutIfNeeded()
            self.leadingLeftConstraint.constant = CGFloat.zero
            self.sideViewLeadingConstraint.constant = 10.00
            self.topViewConstrain.constant = 25.00
            self.rightView.alpha = 1.0
            self.sideView.alpha = 1.0
            self.view.layoutIfNeeded()
        }
    }
    
    private func setupIntialUI() {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 50, y: 100, width: 200, height: 60)
        
        let firstLine = KeyConstant.Titles.download.rawValue
        let secondLine = KeyConstant.Titles.mb_30.rawValue
        let buttonText = "\(firstLine)\n\(secondLine)"
        
        downloadButton.setTitle(buttonText, for: .normal)
        downloadButton.titleLabel?.numberOfLines = 2
        downloadButton.titleLabel?.lineBreakMode = .byWordWrapping
        downloadButton.titleLabel?.textAlignment = .center
        
        playButton.hero.isEnabled = true
        playButton.isHidden =  false
        playButton.alpha = 0.0
        
        playButton.hero.id = KeyConstant.Titles.playButton.rawValue
        yellowView.hero.id = KeyConstant.Titles.yellowView.rawValue
        setupProgressBar()
        
        view.hero.modifiers = [.translate(y: 1000), .durationMatchLongest]
        playButton.isHidden = true
    }
    
    private func setupProgressBar() {
        progressBar = UIView()
        progressBar.backgroundColor = UIColor(red: 154/255, green: 171/255, blue: 137/255, alpha: 0.5)
        progressBar.frame = CGRect(x: 0, y: 0, width: 45, height: downloadButton.frame.height)
        progressBar.cornerRadius = 25
        progressBar.alpha = 0.0
        downloadButton.insertSubview(progressBar, at: 0)
    }
}

