//
//  WQCustomTabbarView.swift
//  WQCloud
//
//  Created by chenweiqiang on 2020/5/26.
//  Copyright © 2020 chenweiqiang. All rights reserved.
//

import UIKit
@objc protocol WQCustomTabbarViewDelegate {
    func itemSelectIndex(index: Int)
}
struct TabbarItem {
    
    let viewControllerName: String
    let normalImage: UIImage
    let selectImage: UIImage
    let title: String
    
}

/// 无高亮的点击按钮
private class HighlightedButton: SPButton {
    
    override var isHighlighted: Bool {
        
        set {
            
        }
        
        get {
            return false
        }
    }
}

class WQCustomTabbarView: UIView {

    var itemArray: [TabbarItem] = []
    
    weak var delegate: WQCustomTabbarViewDelegate?
    
    public var selectedIndex: Int = 0 {
        
        didSet {
            
            let tag = selectedIndex + 100
            
            guard let button = self.viewWithTag(tag) as? UIButton else { return }
            
            self.subviews.forEach {
                guard let btn = $0 as? UIButton, (100...106) ~= $0.tag else {
                    return
                }
                btn.isSelected = false
            }
            button.isSelected = true
        }
    }
    
    
    public convenience init(frame: CGRect ,array: [TabbarItem]) {
        self.init(frame: frame)
        self.itemArray = array
        
        configUI()
    }
    
    private func configUI() {
        
        self.backgroundColor = UIColor.white
        
        let buttonWidth = self.bounds.size.width/CGFloat(itemArray.count)
        let buttonHeight = 56.0
        
        for i in 0..<itemArray.count {
            
            let item = itemArray[i]
            
            let button: HighlightedButton = HighlightedButton.init(imagePosition: .top)
            button.frame = CGRect(x: buttonWidth*CGFloat(i), y: 0, width: buttonWidth, height: CGFloat(buttonHeight))
            button.setImage(item.normalImage, for: .normal)
            button.setImage(item.selectImage, for: .selected)
            button.setTitle(item.title, for: .normal)
            button.setTitleColor(RGB(red: 100, green: 100, blue: 100), for: .normal)
            button.setTitleColor(GreenColor, for: .selected)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 10)
            button.imageTitleSpace = 5
            button.tag = 100 + i
            
            if i == 0 {
                button.isSelected = true
            }
            
            self.addSubview(button)
            
            button.addTarget(self, action: #selector(buttonClickAction(button:)), for: .touchUpInside)
        }
        
        let line = UIView(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: 0.5))
        line.backgroundColor = LineColor
        self.addSubview(line)
        
    }
    
    @objc func buttonClickAction(button: UIButton) {
        
        self.subviews.forEach {
            guard let btn = $0 as? UIButton, (100...106) ~= $0.tag else {
                return
            }
            btn.isSelected = false
        }
        button.isSelected = true
        
        let index = button.tag - 100
        
        if let delegate = self.delegate {
            delegate.itemSelectIndex(index: index)
        }
    }
    
    
    public func showBadgeValue(badgeValue: Int, index: Int) {
        
        guard let button = self.viewWithTag(index + 100) as? UIButton else { return }
        
        let buttonWidth = self.bounds.size.width/CGFloat(itemArray.count)
        
        let item = itemArray[index]
        
        let image = item.normalImage
        
        let imageWidth = image.size.width
        
        let offset = (buttonWidth - imageWidth) / 2.0
        if badgeValue == 0 {
            button.removeBadge()
        }else {
            button.showBadgeValue(badgeValue: badgeValue, insets: UIEdgeInsets(top: 5, left: 0, bottom: 0, right: offset + 5))
        }
        
    }

}
