//
//  UIImageViewExtension.swift
//  FloatingButtonPOP-swift
//
//  Created by Sachin Sabat on 26/10/19.
//  Copyright © 2019 Sachin Sabat. All rights reserved.
//

import UIKit
// You can change access specifier if you want to use extension throughout the app.
internal extension UIView {
    func applyshadowWithCorner(containerView : UIView, cornerRadious : CGFloat, imageView: UIImageView){
        
        // the color of the shadow
        imageView.layer.shadowColor = UIColor.darkGray.cgColor
        
        // the shadow will be 5pt right and 5pt below the image view
        // negative value will place it on left / above of the image view
        imageView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        
        // how long the shadow will be. The longer the shadow, the more blurred it will be
        imageView.layer.shadowRadius = 5.0
        
        // opacity of the shadow
        imageView.layer.shadowOpacity = 0.9
        
        containerView.layer.cornerRadius = cornerRadious
        containerView.clipsToBounds = true
    }
    
    func makeRoundCorners(byRadius rad: CGFloat) {
        self.layer.cornerRadius = rad
        self.clipsToBounds = true
    }
    
}
