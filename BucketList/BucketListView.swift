//
//  BucketListView.swift
//  BucketList
//
//  Created by Cem Aksoy on 5.12.2025.
//

import SwiftUI
import SwiftData

struct BucketListView: View {
  @Query private var goals: [Goal]
  @State private var isSheetPresented = false
  @Environment(\.modelContext) private var modelContext
  
  var body: some View {
    NavigationStack {
      List {
        ForEach(goals) { goal in
          NavigationLink {
            DetailView(goal: goal)
          } label: {
            Text(goal.title)
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
      }
      .listStyle(.plain)
      .navigationTitle("Bucket List:")
      .sheet(isPresented: $isSheetPresented) {
        NavigationStack {
          DetailView(goal: Goal())
        }
      }
      .toolbar {
        ToolbarItem(placement: .confirmationAction) {
          Button("Add", systemImage: "plus") {
            isSheetPresented = true
          }
        }
      }
    }
  }
}

#Preview {
    BucketListView()
    .modelContainer(Goal.preview)
}
