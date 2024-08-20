//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by 김지나 on 2023/12/26.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
