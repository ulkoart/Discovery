//
//  RestaurantPhotosView.swift
//  Discovery
//
//  Created by user on 06.09.2021.
//

import SwiftUI

struct RestaurantPhotosView: View {
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [
                GridItem(.fixed(125), spacing: 4),
                GridItem(.fixed(125), spacing: 4),
                GridItem(.fixed(125)),
            ], spacing: 4, content: {
                
                ForEach(0..<15, id: \.self) { num in
                    Text("Placeholder")
                        .padding()
                        .background(Color.red)
                }
            })
        }.navigationBarTitle("All Photos", displayMode: .inline)
    }
}

struct RestaurantPhotosView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RestaurantPhotosView()
        }
        
    }
}
