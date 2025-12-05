//
//  Goal.swift
//  BucketList
//
//  Created by Cem Aksoy on 5.12.2025.
//

import Foundation
import SwiftData

@Model
class Goal {
  var title: String
  var notes: String
  var completed: Bool
  var completedOn: Date
  
  init(title: String = "", notes: String = "", completed: Bool = false, completedOn: Date = .now) {
    self.title = title
    self.notes = notes
    self.completed = completed
    self.completedOn = completedOn
  }
}
