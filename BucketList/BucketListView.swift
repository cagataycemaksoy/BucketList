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
          Text(goal.title)
            .font(.title2)
        }
      }
      .listStyle(.plain)
      .navigationTitle("Bucket List:")
      .sheet(isPresented: $isSheetPresented) {
        Text("Hello World!!!")
      }
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button {
            isSheetPresented = true
          } label: {
            Image(systemName: "plus")
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
