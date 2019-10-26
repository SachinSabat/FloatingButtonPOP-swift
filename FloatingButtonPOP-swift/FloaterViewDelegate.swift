//
//  FloaterViewDelegate.swift
//  FloatingButtonPOP-swift
//
//  Created by Sachin Sabat on 26/10/19.
//  Copyright © 2019 Sachin Sabat. All rights reserved.
//

import UIKit

// Change these variable for Button heigth and width
private let buttonHeigthAndWidth: CGFloat = 50

// Chnage these variable for distance between two buttons
private let buttonPadding: Int = 65

// Change these variable for button to give its respective trailing constraint
private let mainButtonTrailingConstraint: CGFloat = 25

// Change these variable for button to give its respective bottom constraint
private let mainButtonBottomConstraint: CGFloat = 40

// Change these variable for space between label and button
private let distanceBetweenTitleLabelAndButtonConstraint: CGFloat = 10

// Protocol function
// addFloaterMenu:-
//                 menuItems: To provide tuples of Title Name and UIImage
//                 mainItem: To provide base item from which button expands and collapse
//
// UserDidTapOnItem:- Index of button clicked
//
public protocol FloaterViewDelegate: AnyObject {
    func addFloaterMenu(with menuItems: [(String, UIImage?)], mainItem: (String, UIImage?), dropShadow: Bool)
    func userDidTapOnItem(at index: Int, with model: String)
}

// Protocol extension to create Main button with reamining float button
//
public extension FloaterViewDelegate where Self: UIViewController {
    
   public func addFloaterMenu(with menuItems: [(String, UIImage?)], mainItem: (String, UIImage?), dropShadow: Bool) {
        
        var buttons:[FloaterItemView] = []
        
        //Code for multiple float button
        for index in 0..<menuItems.count {
            
            let item = menuItems[index]
            let floaterItemView = FloaterItemView(frame: .zero)
            floaterItemView.prepareItem(with: item)
            floaterItemView.tag = index
            floaterItemView.itemButton.addAction(for: .touchUpInside) { [weak self] in
                let buttonTag = floaterItemView.tag
                self?.userDidTapOnItem(at: buttonTag+1, with: menuItems[buttonTag].0)
            }
            
            floaterItemView.translatesAutoresizingMaskIntoConstraints = false
            
            view.addSubview(floaterItemView)
            //Adding constraints with respect to index
            setConstraint(view: floaterItemView, withTitleLabelAlpha: true, dropShowdowToImageView: dropShadow)
            
            buttons.append(floaterItemView)
        }
        
        // Code for base view
        let mainItemView = FloaterItemView(frame: .zero)
        mainItemView.prepareItem(with: mainItem)
        mainItemView.tag = 10
        
        mainItemView.itemButton.addAction(for: .touchUpInside) { [weak self] in
            
            if menuItems.count > 0 {
                
                if mainItemView.tag == 10 {
                    
                    UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: .allowUserInteraction, animations: { () -> Void in
                        for index in 0..<buttons.count {
                            buttons[index].alpha = 1.0
                            buttons[index].transform = CGAffineTransform(translationX: 0, y: CGFloat(-buttonPadding * (index+1)))
                        }
                        
                    }, completion: nil)
                    
                } else {
                    UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: .allowUserInteraction, animations: { () -> Void in
                        for index in 0..<buttons.count {
                            buttons[index].alpha = 0.0
                            buttons[index].transform = .identity
                        }
                    }, completion: nil)
                    
                }
            }else{
                self?.userDidTapOnItem(at: 0, with: mainItem.0)
            }
            mainItemView.tag = mainItemView.tag == 10 ? 20 : 10
            
        }
        mainItemView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(mainItemView)
        //Adding constraints to main base button
        setConstraint(view: mainItemView, withTitleLabelAlpha: false, dropShowdowToImageView: dropShadow)
    }
    
    
    private func setConstraint(view: FloaterItemView, withTitleLabelAlpha: Bool, dropShowdowToImageView: Bool){
        
        view.imageView.frame = CGRect(x: 0, y: 0, width: buttonHeigthAndWidth, height: buttonHeigthAndWidth)
        
        view.bottomAnchor.constraint(equalTo: view.self.superview!.bottomAnchor, constant: -mainButtonBottomConstraint).isActive = true
        view.trailingAnchor.constraint(equalTo: view.self.superview!.trailingAnchor, constant: -mainButtonTrailingConstraint).isActive = true
        
        view.heightAnchor.constraint(equalToConstant: buttonHeigthAndWidth).isActive = true
        view.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        
        view.imageContentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(view.imageContentView)
        
        view.imageContentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        view.imageContentView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        view.imageContentView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        view.imageContentView.widthAnchor.constraint(equalToConstant: buttonHeigthAndWidth).isActive = true
        
        view.imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(view.imageView)
        
        view.imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        view.imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        view.imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        view.imageView.widthAnchor.constraint(equalToConstant: buttonHeigthAndWidth).isActive = true
        
        if dropShowdowToImageView{
            view.imageContentView.applyshadowWithCorner(containerView: view.imageContentView, cornerRadious: view.imageView.frame.height/2, imageView: view.imageView)
        }else{
            view.imageContentView.makeRoundCorners(byRadius: view.imageView.frame.height/2)
        }
        
        view.itemButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(view.itemButton)
        
        view.itemButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        view.itemButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        view.itemButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        view.itemButton.widthAnchor.constraint(equalToConstant: buttonHeigthAndWidth).isActive = true
        
        view.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(view.titleLabel)
        
        view.titleLabel.trailingAnchor.constraint(equalTo: view.itemButton.leadingAnchor, constant: -10.0).isActive = true
        view.titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: distanceBetweenTitleLabelAndButtonConstraint).isActive = true
        view.titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: distanceBetweenTitleLabelAndButtonConstraint).isActive = true
        view.titleLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -distanceBetweenTitleLabelAndButtonConstraint).isActive = true
        
        view.alpha = withTitleLabelAlpha == true ? 0.0 : 1.0
        
        
    }
}

extension UIControl {
    func addAction(for controlEvents: UIControl.Event, _ closure: @escaping ()->()) {
        let sleeve = ClosureSleeve(closure)
        addTarget(sleeve, action: #selector(ClosureSleeve.invoke), for: controlEvents)
        objc_setAssociatedObject(self, String(format: "[%d]", arc4random()), sleeve, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
}

private class ClosureSleeve {
    let closure: ()->()
    
    init (_ closure: @escaping ()->()) {
        self.closure = closure
    }
    
    @objc func invoke () {
        closure()
    }
}
