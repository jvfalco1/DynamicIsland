//
//  ActivityAttributes.swift
//  Lama
//
//  Created by Joao Vitor Falco on 23/03/23.
//

import Foundation
import ActivityKit

struct NotificationAttributes: ActivityAttributes {
  public typealias NotificationStatus = ContentState
  
  public struct ContentState: Codable, Hashable {
    var mesage: String
  }
  
  var title: String
}
