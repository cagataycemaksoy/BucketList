//
//  DetailView.swift
//  BucketList
//
//  Created by Cem Aksoy on 6.12.2025.
//

import SwiftUI
import SwiftData

struct DetailView: View {
  @Environment(\.modelContext) private var modelContext
  @Environment(\.dismiss) private var dismiss
  
  @State var goal: Goal
  @State private var title = ""
  @State private var notes = ""
  @State private var isCompleted = true
  @State private var completedOn = Date.now
  
    var body: some View {
      VStack(alignment: .leading) {
        Text("Goal:")
          .bold()
        
        TextField("goal", text: $title)
          .textFieldStyle(.roundedBorder)
          .listRowSeparator(.hidden)
        
        Text("Notes:")
          .bold()
        
        TextField("notes", text: $notes, axis: .vertical)
          .textFieldStyle(.roundedBorder)
          .listRowSeparator(.hidden)
          .padding(.bottom)
        
        Toggle("Completed?", isOn: $isCompleted)
          .bold()
          .padding(.bottom)
        
        if isCompleted {
          DatePicker("Completed On:", selection: $completedOn, displayedComponents: .date)
            .bold()
            .datePickerStyle(.compact)
            .listRowSeparator(.hidden)
        }
        
      }
      .font(.title2)
      .listStyle(.plain)
      .padding(.horizontal, 20)
      .onAppear {
        title = goal.title
        notes = goal.notes
        isCompleted = goal.completed
        completedOn = goal.completedOn
      }
     
      Spacer()
    }
}

#Preview {
    DetailView(goal: Goal(title: "Hike the Great Wall", notes: "Maybe during study abroad", completed: true))
    .modelContainer(for: Goal.self, inMemory: true)
}
