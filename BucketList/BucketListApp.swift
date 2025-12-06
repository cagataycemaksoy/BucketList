//
//  BucketListApp.swift
//  BucketList
//
//  Created by Cem Aksoy on 5.12.2025.
//

import SwiftUI
import SwiftData

@main
struct BucketListApp: App {
    var body: some Scene {
        WindowGroup {
            BucketListView()
        }
        .modelContainer(for: Goal.self)
    }
}
