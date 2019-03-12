//
//  Event.swift
//  hacksc
//
//  Created by Caleb Thomas on 3/10/19.
//  Copyright © 2019 Caleb Thomas. All rights reserved.
//

import UIKit

class Event {
  enum EventType {
    case FUN
    case WORKSHOP
    case FOOD
  }
  
  var name: String
  var location: String
  var time: String
  var image: UIImage?
  var type: EventType
  
  init?(name: String, location: String, time: String, image: UIImage?, type: EventType) {
    self.name = name
    self.location = location
    self.time = time
    self.image = image
    self.type = type
  }
  
}
