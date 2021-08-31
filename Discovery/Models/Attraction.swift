//
//  Attraction.swift
//  Discovery
//
//  Created by user on 31.08.2021.
//

import Foundation

struct Attraction: Identifiable {
    let id = UUID().uuidString
    let name, imageName: String
    let latitude, longitude: Double
}
