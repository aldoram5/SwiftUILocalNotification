//
//  ViewController.swift
//  NotificationTest
//
//  Created by gbmobile on 1/19/15.
//  Copyright (c) 2015 gbmobile. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var notificationButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.sharedApplication().registerUserNotificationSettings(
            UIUserNotificationSettings(
                forTypes:UIUserNotificationType.Sound | UIUserNotificationType.Alert,
                categories: nil)
        )
 
        notificationButton = UIButton(frame: CGRectMake(50,100,200,100))
        notificationButton.backgroundColor = UIColor.redColor()
        notificationButton.layer.masksToBounds = true
        notificationButton.setTitle("Notification", forState: .Normal)
        notificationButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        notificationButton.tag = 1
        
        view.addSubview(notificationButton)
    }
    
    
    func onClickMyButton(sender: UIButton){
        if sender.tag == 1 {
            showNotificationFire()
        }
    }
    
   
    
    
    private func showNotificationFire(){
        
        let customNotification: UILocalNotification = UILocalNotification()
        
        customNotification.alertBody = "Notification custom sound"
        customNotification.soundName = "beep-01a.wav"
        customNotification.timeZone = NSTimeZone.defaultTimeZone()
        customNotification.fireDate = NSDate(timeIntervalSinceNow: 6)
        
        UIApplication.sharedApplication().scheduleLocalNotification(customNotification)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

