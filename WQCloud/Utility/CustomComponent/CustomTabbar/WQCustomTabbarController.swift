//
//  WQCustomTabbarController.swift
//  WQCloud
//
//  Created by chenweiqiang on 2020/5/25.
//  Copyright © 2020 chenweiqiang. All rights reserved.
//

import UIKit
import WQCTMediator
import WQCTMediator_Extension

class WQCustomTabbarController: UITabBarController {
    
    lazy var tabbarView: WQCustomTabbarView = {
        
        var view = WQCustomTabbarView.init(frame: CGRect(x: 0, y: -7, width: SCREEN_WIDTH, height: tabbarHeight), array: self.itemArray)
        view.delegate = self
        return view
    }()
    
    var itemArray: [TabbarItem] = [TabbarItem(viewControllerName:"MessageViewController",
                                              normalImage: UIImage(named: "message_default")!,
                                              selectImage: UIImage(named:"message_selected")!, title: "消息"),
                                   
                                   TabbarItem(viewControllerName:"WQMineViewController",
                                              normalImage: UIImage(named: "server_default")!,
                                              selectImage: UIImage(named: "server_selected")!, title: "服务器"),
                                   
                                   
                                   
                                   TabbarItem(viewControllerName:"WQMineViewController",
                                              normalImage: UIImage(named: "mine_default")!,
                                              selectImage: UIImage(named: "mine_selected")!, title: "我的")
        
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        var arr: [UIViewController] = []
        let vc = CTMediator.sharedInstance().ny_messageModuleViewController(userId: "1234")
        arr.append(vc)
        
//        itemArray.forEach {
//
//            let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"]
//            guard let ns = nameSpace as? String else{
//                return
//            }
//
//            let myClass: AnyClass? = NSClassFromString(ns + "." + $0.viewControllerName)
//            guard let myClassType = myClass as? UIViewController.Type else {
//                return
//            }
//            let vc = myClassType.init()
//
//            //由于超出了5个item的限制范围，所以第5，第6个按钮的导航控制器是UIMoreNavigationViewController
//            let nav = WQBaseNavigationController(rootViewController: vc)
//
//            arr.append(nav)
//        }
        
        self.viewControllers = arr
        //把更多按钮隐藏
        //self.moreNavigationController.navigationBar.isHidden = true
        
        //self.delegate = self
        UITabBar.appearance().isTranslucent = false
        
        addCustomBottomBar()
    }
    
    private func addCustomBottomBar() {
        
        self.tabBar.backgroundColor = UIColor.white
        self.tabBar.addSubview(self.tabbarView)
        
    }
    
    deinit {
        print("NYCustomTabbarController dealloc")
    }
    
}
extension WQCustomTabbarController: WQCustomTabbarViewDelegate {
    
    func itemSelectIndex(index: Int) {
        print("\(index)")
        self.selectedIndex = index
    }
}
