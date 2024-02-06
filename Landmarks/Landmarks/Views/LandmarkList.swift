//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 인터웍스_맥북 on 2/6/24.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        List {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
    }
}

#Preview {
    LandmarkList()
}
