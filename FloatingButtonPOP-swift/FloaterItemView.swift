//
//  FloaterItemView.swift
//  FloatingButtonPOP-swift
//
//  Created by Sachin Sabat on 26/10/19.
//  Copyright © 2019 Sachin Sabat. All rights reserved.
//

import UIKit

public class FloaterItemView: UIView {
    
    // MARK:- UIView Draw method
    var imageContentView = UIView()
    var imageView = UIImageView()
    var titleLabel = UILabel()
    var itemButton = UIButton()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        prepareUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepareUI()
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func prepareUI() {
        
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = UIColor.white
        
        titleLabel.backgroundColor = UIColor.white
        titleLabel.textColor = UIColor.darkText
        titleLabel.layer.cornerRadius = 4
        titleLabel.numberOfLines = 1
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textAlignment = .right
        titleLabel.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        titleLabel.layer.masksToBounds = true
        
        itemButton.setTitle("", for: .normal)
        
    }
    
    //This function prepares array of float buttons recieved in FloaterItemViewDelegate in MenuItems array.
    //
    func prepareItem(with tuple: (String, UIImage?)) {
        titleLabel.text = tuple.0
        imageView.image = tuple.1
    }
    
}
