//
//  GeolocalizatedNotification.swift
//  Framework
//
//  Created by Miguel Pimentel on 31/05/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import Foundation
import UserNotifications
import CoreLocation
import MapKit

public class GeolocalizatedNotification: NSObject {
    
    
    
    
    
    //: MARK -  Notification
    
    public func geolocalizatedNotification() {
        
        let timeToNotificate:  TimeInterval = 5
        let contentTitle = ""
        let contentBody = ""
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeToNotificate, repeats: false)
        let content = createContent(title: contentTitle, body: contentBody)
        
        let request = UNNotificationRequest(identifier: "textNotification", content: content, trigger: trigger)
    
        requestANewNotification(request: request)
    }
    
    
    
    private func requestForNotification() {
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {
            didAllow, error in
            
        })
        
    }
    
    private func createContent(title: String, body: String) -> UNMutableNotificationContent {
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default()
        
        return content
    }
    
    private func requestANewNotification(request: UNNotificationRequest) {
        
        UNUserNotificationCenter.current().add(request) {(error) in
            if let error = error {
                print("Uh oh! We had an error: \(error)")
            }
        }
    }
    
    
    
}
