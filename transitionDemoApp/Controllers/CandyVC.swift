//
//  CandyVC.swift
//  transitionDemoApp
//
//  Created by Apple on 10/08/23.
//

import UIKit
import Hero

enum CellView {
    case twoSkeltonView
    case walletCell
    case oswaldCell
}

class CandyVC: UIViewController {
    
    @IBOutlet weak var leadingLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var sideViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var topViewConstrain: NSLayoutConstraint!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var downloadButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var tickButton: UIButton!
    
    @IBOutlet weak var rightView: UIView!
    @IBOutlet weak var sideView: UIView!
    @IBOutlet weak var downloadTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var leadingPlayConstraint: NSLayoutConstraint!
    @IBOutlet weak var trailingPlayConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomPlayConstraint: NSLayoutConstraint!
    
    
    var progressBar: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadButton.hero.isEnabled = true
        playButton.hero.isEnabled = true
        self.playButton.isHidden =  false
        self.playButton.alpha = 0.0
        
        // Set Hero IDs for the buttons
        downloadButton.hero.id = "downloadButton"
        playButton.hero.id = "playButton"
        yellowView.hero.id = "ironMan"
        //        stackView.hero.id = "batMan"
        setupProgressBar()
        
        
        
        self.view.hero.modifiers = [.translate(y: 1000), .durationMatchLongest]
        //
        //        stackView.hero.modifiers = [.cascade]
        //        stackView.hero.modifiers = [.fade, .scale(0.5)]
        
        
        
        playButton.isHidden = true  // Hide the completedButton initially
        
        
        //downloadButton.addTarget(self, action: #selector(downloadButtonTapped), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1.5) { [self] in
            
            self.view.layoutIfNeeded()
            
            self.leadingLeftConstraint.constant = 0.00
            self.sideViewLeadingConstraint.constant = 10.00
            self.topViewConstrain.constant = 25.00
            
            
            self.rightView.alpha = 1.0
            self.sideView.alpha = 1.0
            
            
            
            
            self.view.layoutIfNeeded()
            
            
        }
    }
    
    @IBAction func playButton(_ sender: UIButton) {
        
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "NextVC") as! NextVC
        vc.hero.modalAnimationType = .slide(direction: .up) // Choose the desired animation
        present(vc, animated: true, completion: nil)
        
        //  navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func downloadButton(_ sender: UIButton) {
        
            self.progressBar.alpha = 1.0
            
            UIView.animate(withDuration: 3.6) {
                self.view.layoutIfNeeded()
                self.downloadTrailingConstraint.constant = 65.00
                self.tickButton.alpha = 1.0
                self.progressBar.frame.size.width = self.downloadButton.bounds.width
                self.view.layoutIfNeeded()
           
            } completion: { _ in
                
                UIView.animate(withDuration: 1.0) {
                    self.progressBar.isHidden = true
                    self.downloadButton.alpha = 1.0
                    
                } completion: { _ in
                    UIView.animate(withDuration: 0.9) { [self] in
                        self.view.layoutIfNeeded()
                        
                        self.tickButton.alpha = 0.0
                        
                        //                self.downloadTrailingConstraint.constant = 65.00
                        self.downloadButton.alpha = 0.0
                        
                        //self.hero.modalAnimationType = .slide(direction: .up)
                        
                        self.playButton.isHidden = false
                        self.playButton.alpha = 1.0
                        self.bottomPlayConstraint.constant = 65.0
                        self.leadingPlayConstraint.constant = 15.0
                        self.trailingPlayConstraint.constant = 15.0
                        
                        
                        
                        self.view.layoutIfNeeded()
                    }
                }

                
              
            }
        
        
        
        
        //
        //        UIView.animate(withDuration: 1.5) { [self] in
        //        }
        
        
        
        
        
        
        // Start the Hero animation for the appearingButton
        downloadButton.hero.modifiers = [.translate(y: playButton.bounds.height)]
        downloadButton.hero.id = "downloadButton" // Update the Hero ID
        
        // Update the Hero ID for the initialButton to avoid conflict
        playButton.hero.id = "playButton"
        
        self.hero.modalAnimationType = .slide(direction: .up) // Choose the desired animation
        // present(playButton, animated: true, completion: nil)
        
        
    }
    
    func setupProgressBar() {
        progressBar = UIView()
        progressBar.backgroundColor = UIColor(red: 154/255, green: 171/255, blue: 137/255, alpha: 0.5)
        progressBar.frame = CGRect(x: 0, y: 0, width: 45, height: downloadButton.frame.height)
        
        progressBar.cornerRadius = 25
        progressBar.alpha = 0.0
        
        downloadButton.addSubview(progressBar)
    }
    
    @IBAction func dismissButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    //    @objc func downloadButtonTapped() {
    //            // Simulate a download progress
    //            let totalProgressDuration: TimeInterval = 5 // seconds
    //            let progressBarWidth = downloadButton.frame.width
    //
    //        downloadButton.backgroundColor = downloadButton.backgroundColor?.withAlphaComponent(0.3)
    //
    //            UIView.animate(withDuration: totalProgressDuration, animations: {
    //                self.progressBar.frame.size.width = progressBarWidth
    //            }) { _ in
    //                // Download complete, hide downloadButton and show completedButton
    ////                self.downloadButton.isHidden = true
    ////                self.playButton.isHidden = false
    //                self.progressBar.frame.size.width = 0
    //
    //
    //
    //            }
    //        }
}

