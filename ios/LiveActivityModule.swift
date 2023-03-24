import Foundation
import UIKit
import AVFoundation
import ActivityKit

@objc(LiveActivityModule)
class LiveActivityModule: NSObject {
  
  func areActivitiesEnabled() -> Bool {
    if #available(iOS 16.1, *) {
      return ActivityAuthorizationInfo.init().areActivitiesEnabled
    } else {
      return false
    }
  }
  
  // TEST NATIVE FUCTION
  @objc(testFunc)
  func testFunc(){
    print("Live activity module connected.")
  }
  
  
  // WIDGET NOTIFICATION
  @objc(startNotificationActivity:withMessage:)
  func startNotificationActivity(title: String, message: String) -> Void {
    print("Called the function")
    if #available(iOS 16.1, *) {
      let initialContentState = NotificationAttributes.ContentState(mesage: message)
      let activityAttributes = NotificationAttributes(title: title)
      
      do {
        _ = try Activity.request(attributes: activityAttributes, contentState: initialContentState)
        print("Requested a motification Live Activity.")
      } catch (let error) {
        print("Error requesting motification delivery Live Activity \(error.localizedDescription).")
      }
    } else{
      print("Not 16.1.")
    }
  }
  
  @objc(updateNotificationActivity:)
  func updateNotificationActivity(message: String) -> Void {
    if #available(iOS 16.1, *) {
      
      let notificationStatus = NotificationAttributes.NotificationStatus(mesage: message)
      let alertConfiguration = AlertConfiguration(title: "Notification Update", body: "Notification update.", sound: .default)
      
      Task {
        for activity in Activity<NotificationAttributes>.activities {
          await activity.update(using: notificationStatus, alertConfiguration: alertConfiguration)
        }
      }
    }
  }
  
  @objc
  func endNotificationActivity() -> Void {
    if #available(iOS 16.1, *) {
      let notificationStatus = NotificationAttributes.NotificationStatus(mesage: "Share programming experience!")
      
      
      Task {
        for activity in Activity<NotificationAttributes>.activities {
          await activity.end(using:notificationStatus, dismissalPolicy: .default)
        }
      }
    }
  }
}
