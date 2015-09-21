//
//  MainTabBarVC.swift
//  Test
//
//  Created by hi on 15/9/21.
//  Copyright (c) 2015年 GML. All rights reserved.
//

import UIKit

class MainTabBarVC: UITabBarController {
    
    var tabBarNormalImg:UIImageView?
    var tabBarSelectedImg:UIImageView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.hidden = true
        
        
        
    }
    
    /**
        自定义tabbar视图
    */
    func customTabBar(){
        var height = UIScreen.mainScreen().bounds.height
        var width = UIScreen.mainScreen().bounds.width
        
        var tabBarW = width
        var tabBarH = height - 49
        // 正常状态的image
        tabBarNormalImg = UIImageView(frame: CGRectMake(0, tabBarH, tabBarW, 49))
        tabBarNormalImg!.userInteractionEnabled = true
        tabBarNormalImg!.image = UIImage(named: "tabbar_home")
        
        // 选中image
        var y = tabBarNormalImg!.frame.size.height/2 - 45/2
        tabBarSelectedImg = UIImageView(frame: CGRectMake(5, y, 50, 45))
        tabBarSelectedImg!.image = UIImage(named: "tabbar_home_highlighted")
        
        var x:CGFloat = 0
        
    }
    
    
    /**
    *  添加子控制器
    */
    func addChildViewControllers(){
        tabBar.tintColor = UIColor.orangeColor()
        
        addChildViewControllerWithName("Home", "首页", "tabbar_home")
        addChildViewControllerWithName("Message", "消息", "tabbar_message_center")
        addChildViewControllerWithName("Discover", "发现", "tabbar_discover")
        addChildViewControllerWithName("Profile", "我的", "tabbar_profile")
    }
    
    func addChildViewControllerWithName(subName:String ,_ title:String, _ imageName:String){
        let sb = UIStoryboard(name: subName, bundle: nil)
        let nav = sb.instantiateInitialViewController() as! UINavigationController
        
        nav.title = title
        nav.topViewController?.title = title
        nav.tabBarItem.image = UIImage(named: imageName)
        nav.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
        addChildViewController(nav)
    }
    
   
}
