//
//  FirstViewController.swift
//  Test
//
//  Created by hi on 15/9/21.
//  Copyright (c) 2015年 GML. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UITextFieldDelegate,UIAlertViewDelegate {
    var imageView:UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.redColor()
        
        setUpButton()
        setUpLabel()
        setUpTextField()
        setUpImageView()

    }
    func setUpButton(){
        var button:UIButton = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
        button.frame = CGRectMake(100, 100, 80, 60)
        button.setTitle("normal", forState: UIControlState.Normal)
        button.setTitle("selected", forState: UIControlState.Highlighted)
        button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        button.setTitleColor(UIColor.yellowColor(), forState: UIControlState.Highlighted)
        button.backgroundColor = UIColor.lightGrayColor()
        button.setImage(UIImage(named: "tabbar_home"), forState: UIControlState.Normal)
        button.setImage(UIImage(named: "tabbar_home_highlighted"), forState: UIControlState.Highlighted)
        button.titleLabel?.font = UIFont.systemFontOfSize(15)
        button.addTarget(self, action: "buttonAction", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
    }
    
    func buttonAction(){
        println("\(__FUNCTION__)")
    }
    
    func setUpLabel(){
        var label = UILabel(frame: CGRectMake(10, 170, 200, 44))
        label.text = "label"
        label.textColor = UIColor.yellowColor()
        label.textAlignment = NSTextAlignment.Center
        label.font = UIFont.systemFontOfSize(18)
        label.adjustsFontSizeToFitWidth = true
        view.addSubview(label)
        // 设置富文本
        var attributeStr = NSMutableAttributedString(string: "hello world")
        attributeStr.addAttribute(NSFontAttributeName, value: UIFont.systemFontOfSize(25), range: NSMakeRange(0, 5))
        attributeStr.addAttribute(NSForegroundColorAttributeName, value: UIColor.greenColor(), range: NSMakeRange(0, 5))
        label.attributedText = attributeStr
    }
    
    func setUpTextField(){
        var textField = UITextField(frame: CGRectMake(100, 260, 160, 80))
        textField.borderStyle = UITextBorderStyle.RoundedRect
        view.addSubview(textField)
        textField.placeholder = "please input your name"
        textField.textAlignment = NSTextAlignment.Left
        textField.background = UIImage(named: "tabbar_message")
        textField.clearButtonMode = UITextFieldViewMode.WhileEditing
        textField.delegate = self
        
     }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
//        self.imageView.stopAnimating()
        setUpAlterView()
    }
    func textFieldDidBeginEditing(textField: UITextField) {
        println("\(__FUNCTION__)")
    }
    
    
    func setUpImageView(){
        var imageView = UIImageView(frame: CGRectMake(100, 350, 100, 100))
        var images = [AnyObject]()
        
        imageView.animationImages = [UIImage(named: "tabbar_home")!,UIImage(named: "tabbar_home_highlighted")!,UIImage(named: "tabbar_message_center")!,UIImage(named: "tabbar_message_center_highlighted")!] as [AnyObject]
        
        imageView.animationDuration = 0.5
        view.addSubview(imageView)
        self.imageView = imageView
        imageView.startAnimating()
    }
    
    func setUpAlterView(){
        
        var alterView = UIAlertView()
        alterView.title = "Alter"
        alterView.message = "quite"
        alterView.addButtonWithTitle("quxiao")
        alterView.addButtonWithTitle("sure")
        alterView.show()
        alterView.delegate = self
        
    }
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        println("index \(buttonIndex)")
    }
    
  
}
