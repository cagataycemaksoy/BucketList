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

extension Goal {
  @MainActor
  static var preview: ModelContainer {
    guard let container = try? ModelContainer(for: Self.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true)) else {
      fatalError("Failed to create preview container!")
    }
    container.mainContext.insert(Goal(title: "Dive the Great Barrier Reef", notes: "Need scuba certification first ", completed: false))
    container.mainContext.insert(Goal(title: "Become Scuba Certified", notes: "East Coast Divers is in Brookline, MA that can do this", completed: true))
    container.mainContext.insert(Goal(title: "Hike the Great Wall", notes: "Maybe during study abroad", completed: true))
    container.mainContext.insert(Goal(title: "Safari in Kenya", notes: "Try to schedule something during the Great Migration", completed: false))
    container.mainContext.insert(Goal(title: "Hike Machu Picchu", notes: "Learning to surf in Lima might also be cool", completed: false))
    return container
  }
}
