//
//  WQBaseNavigationController.swift
//  WQCloud
//
//  Created by chenweiqiang on 2020/5/26.
//  Copyright © 2020 chenweiqiang. All rights reserved.
//

import UIKit

class WQBaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        
        super.pushViewController(viewController, animated: animated)
        
    }
    
}
//MARK: - StatusBarStyle
extension WQBaseNavigationController {
    
    override var childForStatusBarStyle: UIViewController? {
        return self.topViewController
    }
}
