//
//  SelectedListView.swift
//  BucketList
//
//  Created by Cem Aksoy on 7.12.2025.
//

import SwiftUI
import SwiftData

struct SelectedListView: View {
  @Query private var goals: [Goal]
  @Environment(\.modelContext) private var modelContext
  @State private var selectedSegment: Segments
  
  var body: some View {
    List(goals) { goal in
      
      NavigationLink {
        DetailView(goal: goal)
      } label: {
        HStack {
          Image(systemName: !goal.completed ? "square" : "checkmark.square")
          Text(goal.title)
        }
        .font(.title2)
      }
      .swipeActions {
        Button("", systemImage: "trash", role: .destructive) {
          modelContext.delete(goal)
          guard let _ = try? modelContext.save() else {
            print("😡 Failed to delete the element!")
            return
          }
        }
      }
    }
    .listStyle(.plain)
  }
  
  init(selectedSegment: Segments) {
    self.selectedSegment = selectedSegment
    
    switch selectedSegment {
    case .all: _goals = Query()
    case .completeed: _goals = Query(filter: #Predicate {$0.completed == true})
    case .open: _goals = Query(filter: #Predicate {$0.completed == false})
    }
  }
}

#Preview {
  NavigationStack {
    SelectedListView(selectedSegment: .all).modelContainer(Goal.preview)
  }
}
