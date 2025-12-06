//
//  BucketListView.swift
//  BucketList
//
//  Created by Cem Aksoy on 5.12.2025.
//

import SwiftUI
import SwiftData

struct BucketListView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    BucketListView()
    .modelContainer(Goal.preview)
}
