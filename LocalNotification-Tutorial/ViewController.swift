//
//  ViewController.swift
//  LocalNotification-Tutorial
//
//  Created by Aman Aggarwal on 02/05/19.
//  Copyright © 2019 Aman Aggarwal. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func setReminder(_ sender: Any){
        
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = "Notifiaction on a certail date"
        content.body = "This is a local notification on certain date"
        content.sound = .default
        content.userInfo = ["value": "Data with local notification"]
        
        
        let fireDate = Calendar.current.dateComponents([.day, .month, .year, .hour, .minute, .second], from: Date().addingTimeInterval(10))
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: fireDate, repeats: false)
        //UNTimeIntervalNotificationTrigger(timeInterval: 20, repeats: false)
        
        let request = UNNotificationRequest(identifier: "reminder", content: content, trigger: trigger)
        center.add(request) { (error) in
            if error != nil {
                print("Error = \(error?.localizedDescription ?? "error local notification")")
            }
        }
        
    }

}

