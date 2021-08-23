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
                PopularDestinationsView()
                PopularRestauransView()
                TrendingCreatorsView()
            }.navigationTitle("Discover")
        }
    }
}


struct PopularDestinationsView: View {
    var body: some View {
        HStack {
            Text("Popular destinations")
                .font(.system(size: 14, weight: .semibold))
            Spacer()
            Text("See all")
                .font(.system(size: 12, weight: .semibold))
        }.padding(.horizontal)
        .padding(.top)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(0..<5, id: \.self) { num in
                    Spacer()
                        .frame(width: 125, height: 150, alignment: .center)
                        .background(Color.gray)
                        .cornerRadius(5)
                        .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
                        .padding(.bottom)
                }
            }.padding(.horizontal)
        }
    }
}

struct PopularRestauransView: View {
    var body: some View {
        HStack {
            Text("Popular places to eat")
                .font(.system(size: 14, weight: .semibold))
            Spacer()
            Text("See all")
                .font(.system(size: 12, weight: .semibold))
        }.padding(.horizontal)
        .padding(.top)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(0..<5, id: \.self) { num in
                    Spacer()
                        .frame(width: 180, height: 90, alignment: .center)
                        .background(Color.gray)
                        .cornerRadius(5)
                        .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
                        .padding(.bottom)
                }
            }.padding(.horizontal)
        }
    }
}

struct TrendingCreatorsView: View {
    var body: some View {
        HStack {
            Text("Trending Creators")
                .font(.system(size: 14, weight: .semibold))
            Spacer()
            Text("See all")
                .font(.system(size: 12, weight: .semibold))
        }.padding(.horizontal)
        .padding(.top)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(0..<5, id: \.self) { num in
                    Spacer()
                        .frame(width: 50, height: 50)
                        .background(Color.gray)
                        .cornerRadius(.infinity)
                        .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
                        .padding(.bottom)
                }
            }.padding(.horizontal)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Categoty: Hashable {
    let name, imageName: String
}

struct DiscoverCategoriesView: View {
    
    let categories: [Categoty] = [
        .init(name: "Art", imageName: "paintpalette.fill"),
        .init(name: "Sport", imageName: "sportscourt.fill"),
        .init(name: "Live Events", imageName: "music.mic"),
        .init(name: "Food", imageName: "music.mic"),
        .init(name: "History", imageName: "music.mic"),
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing:14) {
                ForEach(categories, id: \.self) { category in
                    VStack(spacing: 8
                    ) {
                        Image(systemName: category.imageName)
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .frame(width: 64, height: 64)
                            .background(Color.gray)
                            .cornerRadius(64)
                            .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
                        Text(category.name)
                            .font(.system(size: 12, weight: .semibold))
                    }.frame(width: 68)
                }
            }.padding(.horizontal)
        }
    }
}
