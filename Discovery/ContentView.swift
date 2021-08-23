//
//  ContentView.swift
//  Discovery
//
//  Created by user on 23.08.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                DiscoverCategoriesView()
            }.navigationTitle("Discover")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DiscoverCategoriesView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(0..<7, id: \.self) { num in
                    VStack(spacing: 4) {
                        Spacer()
                            .frame(width: 50, height: 50)
                            .background(Color.gray)
                            .cornerRadius(.infinity)
                            .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
                        Text("Art")
                            .font(.system(size: 12, weight: .semibold))
                    }
                }
            }.padding(.horizontal)
        }
    }
}
