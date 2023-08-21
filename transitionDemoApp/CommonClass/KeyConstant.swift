//
//  KeyConstant.swift
//  transitionDemoApp
//
//  Created by Apple on 19/08/23.
//

import Foundation

struct KeyConstant {
    
    enum CellIds: String {
        case play = "PlayCollectionCell"
        case next = "NextCollectionCell"
        case balance = "BalanceCollectionCell"
        case oswald = "OswaldCollectionCell"
    }
    
    enum VCIds: String {
        case candy = "CandyVC"
    }
    
    enum CellView {
        case twoSkeltonView
        case walletCell
        case oswaldCell
    }
    
    enum Titles: String {
        case confirm = "Confirm"
        case download = "DOWNLOAD"
        case mb_30 = "30 MB"
        case playButton = "playButton"
        case yellowView = "yellowView"
        case mb_10_30 = "10MB / 30MB"
        case orangeView = "orangeView"
    }
}
