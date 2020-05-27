//
//  WQColor.swift
//  WQCloud
//
//  Created by chenweiqiang on 2020/5/26.
//  Copyright © 2020 chenweiqiang. All rights reserved.
//

import UIKit


/// ------------------------------常用色值分区------------------------------------
let GreenColor: UIColor = ColorHex("#00CC67")
let RedColor: UIColor = ColorHex("#FF3300")
let OrangeColor: UIColor = ColorHex("#FF6A00")

let LineColor: UIColor = ColorHex("#D4D7D9")
let BackgroundColor: UIColor = ColorHex("#EDF0F2")

let BlackColor: UIColor = ColorHex("222222")
let NineColor: UIColor = ColorHex("0x999999")


/// -------------------------------常用颜色设置方法--------------------------------

func RGB(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
    
    return UIColor.init(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: 1.0)
}

func RGB(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
    
    return UIColor.init(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha)
}

func ColorFromHex(rgbValue: Int) -> UIColor {
    
    return UIColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16)) / 255.0,
                   green: ((CGFloat)((rgbValue & 0xFF00) >> 8)) / 255.0,
                   blue: ((CGFloat)(rgbValue & 0xFF)) / 255.0,alpha: 1.0)
}

func ColorFromHex(rgbValue: Int, alpha: CGFloat) -> UIColor {
    
    return UIColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16)) / 255.0,
                   green: ((CGFloat)((rgbValue & 0xFF00) >> 8)) / 255.0,
                   blue: ((CGFloat)(rgbValue & 0xFF)) / 255.0,alpha: alpha)
}

func ColorHex(_ color: String, _ alpha: CGFloat = 1.0) -> UIColor {
    
    var cstr = color.trimmingCharacters(in:  CharacterSet.whitespacesAndNewlines).uppercased() as NSString;
    if(cstr.length < 6){
        return UIColor.clear;
    }
    if(cstr.hasPrefix("0X")){
        cstr = cstr.substring(from: 2) as NSString
    }
    if(cstr.hasPrefix("#")){
        cstr = cstr.substring(from: 1) as NSString
    }
    if(cstr.length != 6){
        return UIColor.clear;
    }
    var range = NSRange.init()
    range.location = 0
    range.length = 2
    //r
    let rStr = cstr.substring(with: range);
    //g
    range.location = 2;
    let gStr = cstr.substring(with: range)
    //b
    range.location = 4;
    let bStr = cstr.substring(with: range)
    var r :UInt32 = 0x0;
    var g :UInt32 = 0x0;
    var b :UInt32 = 0x0;
    Scanner.init(string: rStr).scanHexInt32(&r);
    Scanner.init(string: gStr).scanHexInt32(&g);
    Scanner.init(string: bStr).scanHexInt32(&b);
    return UIColor.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: alpha);
}

/// 随机颜色
func RandomColor() -> UIColor {
    return RGB(red: CGFloat(arc4random()%255), green: CGFloat(arc4random()%255), blue: CGFloat(arc4random()%255))
}
