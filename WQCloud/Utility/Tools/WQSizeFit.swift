//
//  WQSizeFit.swift
//  WQCloud
//
//  Created by chenweiqiang on 2020/5/26.
//  Copyright © 2020 chenweiqiang. All rights reserved.
//

import UIKit

///---------------------------------------------SizeFit-----------------------------------

let SCREEN_WIDTH = UIScreen.main.bounds.width

let SCREEN_HEIGHT = UIScreen.main.bounds.height

let SCREEN_BOUND = UIScreen.main.bounds

let STATUSBAR_HEIGHT = UIApplication.shared.statusBarFrame.size.height

let safeTopAreaHeight: CGFloat = (is_iPhoneX || is_iPhoneXs || is_iPhoneXsMax) ? 88.0 : 64.0

let tabbarHeight: CGFloat = (is_iPhoneX || is_iPhoneXs || is_iPhoneXsMax) ? 90.0 : 56.0

let safeBottomAreaHeight: CGFloat = (is_iPhoneX || is_iPhoneXs || is_iPhoneXsMax) ? 34.0 : 0.0


///-------------------------------------DeviceFit--------------------------------------

let is_iPhoneSE: Bool = (SCREEN_WIDTH == 320.0 && SCREEN_HEIGHT == 568.0) ? true : false

let is_iPhone6: Bool = (SCREEN_WIDTH == 375.0 && SCREEN_HEIGHT == 667.0) ? true : false

let is_iPhoneX: Bool = (SCREEN_WIDTH == 375.0 && SCREEN_HEIGHT == 812.0) ? true : false

let is_iPhoneXs: Bool = (SCREEN_WIDTH == 414.0 && SCREEN_HEIGHT == 896.0) ? true : false

let is_iPhoneXsMax: Bool = (SCREEN_WIDTH == 414.0 && SCREEN_HEIGHT == 896.0) ? true : false

public func LightFont(_ font: CGFloat) -> UIFont {
    
    let size = configureFont(font)
    return UIFont(name: "PingFangSC-Light", size: size)!
}

public func RegularFont(_ font: CGFloat) -> UIFont {
    
    let size = configureFont(font)
    return UIFont(name: "PingFangSC-Regular", size: size)!
}

public func MediumFont(_ font: CGFloat) -> UIFont {
    
    let size = configureFont(font)
    return UIFont(name: "PingFangSC-Medium", size: size)!
}

public func SemiboldFont(_ font: CGFloat) -> UIFont {
    
    let size = configureFont(font)
    return UIFont(name: "PingFangSC-Semibold", size: size)!
}

private func configureFont(_ font: CGFloat) -> CGFloat {
    
    if SCREEN_WIDTH == 320.0 {
        
        return font - CGFloat(1)
    } else if SCREEN_WIDTH == 375.0 {
        
        return font
    } else {
        
        return font + CGFloat(1)
    }
}

public func heightFit(height: CGFloat) -> CGFloat {
    
    let rate: CGFloat = SCREEN_HEIGHT/812.0

    return height * rate
}

public func widthFit(_ width: CGFloat) -> CGFloat {
    
    return (SCREEN_WIDTH / 375.0) * width
}
