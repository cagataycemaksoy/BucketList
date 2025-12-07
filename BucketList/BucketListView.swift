//
//  BucketListView.swift
//  BucketList
//
//  Created by Cem Aksoy on 5.12.2025.
//

import SwiftUI
import SwiftData

struct BucketListView: View {
  @State private var isSheetPresented = false
  @State private var selectedSegment: Segments = .all
  
  
  var body: some View {
    NavigationStack {
      VStack(spacing: 20) {
        Picker("", selection: $selectedSegment) {
          ForEach(Segments.allCases, id: \.self) { segment in
            Text(segment.rawValue)
          }
        }
        .pickerStyle(.segmented)
        SelectedListView(selectedSegment: selectedSegment)
      }
      .padding(.horizontal)
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
