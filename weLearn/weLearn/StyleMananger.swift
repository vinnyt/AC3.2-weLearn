//
//  StyleManager.swift
//  Vote
//
//  Created by Marty Avedon on 2/18/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class StyleManager {
    static let styler = StyleManager()
    
    private init() {}
    
    func prettify() {
        //let displayFont = "Thirtysix"
        let boldFont = "Avenir-Black"
        let regularFont = "Avenir-Roman"
        let italicFont = "Avenir-Oblique"
        let lightFont = "Avenir-LightOblique"
        let lightItalicFont = "Avenir-LightOblique"
        
        let accessibilityFont = "TiresiasInfofont"
        let accessibilityFontItalic = "TiresiasInfofont"
        
        // top bar
        let proxyNavBar = UINavigationBar.appearance()
        
        // details & text
        let proxyImageView = UIImageView.appearance()
        let proxyLabel = UILabel.appearance()
        let proxyTextField = UITextField.appearance()
        let proxyTextView = UITextView.appearance()
        let proxyPlaceholder = UILabel.appearance(whenContainedInInstancesOf: [UITextField.self])
        let proxyButtonLabel = UILabel.appearance(whenContainedInInstancesOf: [UIButton.self])
        let proxyButton = UIButton.appearance()
        
        // generalized info
        let proxyWebView = UIWebView.appearance()
        let proxyTableView = UITableView.appearance()
        let proxyTableCell = UITableViewCell.appearance()
        let proxySectionHeader = UITableViewHeaderFooterView.appearance()
        let proxyCollectionCell = UICollectionViewCell.appearance()
        let proxyCollectionView = UICollectionView.appearance()
        let proxyScrollView = UIScrollView.appearance()
        
        // top bar styling
        proxyNavBar.tintColor = UIColor.weLearnCoolWhite
        proxyNavBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.weLearnCoolWhite, NSFontAttributeName: UIFont(name: boldFont, size: 21)!]
        proxyNavBar.apply(gradient: [UIColor.weLearnCoolAccent.withAlphaComponent(0.5), UIColor.weLearnGreen])
        
        // detail & text styling
        proxyLabel.font = UIFont(name: boldFont, size: 20)
        proxyLabel.textColor = UIColor.weLearnBlack
        
        proxyTextView.font = UIFont(name: regularFont, size: 16)
        proxyTextView.textColor = UIColor.weLearnBlack
        proxyTextView.backgroundColor = UIColor.white
        
        proxyTextField.backgroundColor = UIColor.white
        proxyTextField.textColor = UIColor.weLearnOrange
        proxyTextField.font = UIFont(name: boldFont, size: 20)

        proxyPlaceholder.font = UIFont(name: lightItalicFont, size: 20)
        proxyPlaceholder.textAlignment = .left
        proxyPlaceholder.backgroundColor = proxyTextField.backgroundColor
        proxyPlaceholder.textColor = UIColor.weLearnGrey
        
        proxyButtonLabel.font = UIFont(name: boldFont, size: 20)
        proxyButton.titleEdgeInsets = UIEdgeInsetsMake(15, 15, 15, 15)
        proxyButtonLabel.allowsDefaultTighteningForTruncation = true
        proxyButton.tintColor = UIColor.weLearnBlack
        
        // generalized info styling
        proxyWebView.scalesPageToFit = true
        proxyWebView.scrollView.bounces = true
        proxyWebView.layer.cornerRadius = 3.0
        proxyWebView.layer.borderWidth = 1.0
        
        proxyTableView.backgroundColor = UIColor.weLearnWarmWhite
        proxySectionHeader.tintColor = UIColor.weLearnOrange
        
        proxyScrollView.bounces = true
        proxyScrollView.backgroundColor = UIColor.weLearnWarmWhite
        proxyScrollView.tintColor = UIColor.weLearnOrange
        
        proxyCollectionView.backgroundColor = .clear
    }
    
}
