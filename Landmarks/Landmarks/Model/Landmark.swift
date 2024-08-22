//
//  Landmark.swift
//  Landmarks
//
//  Created by  on 2/5/24.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
    // asset 이미지 이름 읽어오기
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    // landmark location from json data
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
}
