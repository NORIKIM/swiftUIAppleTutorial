//
//  CategoryHome.swift
//  Landmarks
//
//  Created by 인터웍스_맥북 on 8/22/24.
//

import SwiftUI

struct CategoryHome: View {
    var body: some View {
        NavigationSplitView {
            Text("Hello, World!")
                .navigationTitle("Featured")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    CategoryHome()
}
