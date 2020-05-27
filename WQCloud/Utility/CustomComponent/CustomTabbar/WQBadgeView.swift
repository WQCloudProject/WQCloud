//
//  WQBadgeView.swift
//  WQCloud
//
//  Created by chenweiqiang on 2020/5/26.
//  Copyright © 2020 chenweiqiang. All rights reserved.
//

import UIKit

extension UIView {
    
    //任意UIView添加badge
    func showBadgeValue(badgeValue: Int, insets: UIEdgeInsets = .zero) {
        
        removeBadge()
        
        if badgeValue > 0 {
            
            let label = UILabel()
            var number = ""
            if badgeValue > 99 {
                number = "99+"
            } else {
                number = String(badgeValue)
            }
            label.text = number
            label.textColor = .white
            label.backgroundColor = ColorHex("#FF3300")
            label.layer.cornerRadius = 9
            label.textAlignment = .center
            label.font = RegularFont(12)
            label.layer.masksToBounds = true
            label.sizeToFit()
            label.tag = 9999
            
            var width = label.bounds.size.width + 10
            let height: CGFloat = 18.0
            width = width < height ? height : width
            
            label.frame = CGRect(x: 0, y: 0, width: width, height: height)
            
            self.addSubview(label)
            label.frame = CGRect(x: self.frame.size.width - insets.right, y: insets.top, width: label.frame.size.width, height: label.frame.size.height)
        }
    }
    
    //删除UIView的badge
    func removeBadge() {
        
        if let label = self.viewWithTag(9999) {
            
            label.removeFromSuperview()
        }
    }
}
