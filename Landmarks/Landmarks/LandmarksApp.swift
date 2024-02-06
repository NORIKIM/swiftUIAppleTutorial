//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by 김지나 on 2023/12/26.
//

import SwiftUI

@main
struct LandmarksApp: App {
    var body: some Scene {
        WindowGroup {
            //ContentView()
            var landmark: Landmark
            LandmarkRow(landmark: landmarks[0])
        }
    }
}
