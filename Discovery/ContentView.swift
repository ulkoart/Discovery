//
//  ContentView.swift
//  Discovery
//
//  Created by user on 23.08.2021.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
    }
    
    var body: some View {
        NavigationView {
            
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.999972403, green: 0.7216030955, blue: 0.2627452612, alpha: 1)), Color(#colorLiteral(red: 0.9999994636, green: 0.5333602428, blue: 0.2823523283, alpha: 1))]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                Color(.init(white: 0.95, alpha: 1))
                    .offset(y:400)
                
                ScrollView {
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                        Text("Where do you want go?")
                        Spacer()
                            
                    }.font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color(.init(white: 1, alpha: 0.3)))
                    .cornerRadius(10)
                    .padding(16)
                    
                    
                    DiscoverCategoriesView()
                    
                    VStack {
                        PopularDestinationsView()
                        PopularRestauransView()
                        TrendingCreatorsView()
                    }.background(Color(.init(white: 0.95, alpha: 1)))
                    .cornerRadius(16)
                    .padding(.top, 32)
                }
            }
            .navigationTitle("Discover")
        }
    }
}

struct Destination: Hashable {
    let name, country, imageName: String
}

struct PopularDestinationsView: View {
    
    let destinations: [Destination] = [
        .init(name: "Paris", country: "France", imageName: "eiffel_tower"),
        .init(name: "Tokyo", country: "Japan", imageName: "japan"),
        .init(name: "New York", country: "US", imageName: "new_york"),
    ]
    
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
                ForEach(destinations, id: \.self) { destination in
                    VStack(alignment: .leading, spacing: 0) {
                        Image(destination.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 125, height: 125, alignment: .center)
                            .cornerRadius(4)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 6)
                        
                        Text(destination.name)
                            .font(.system(size: 12, weight: .semibold))
                            .padding(.horizontal, 12)
                        Text(destination.country)
                            .font(.system(size: 12, weight: .semibold))
                            .padding(.horizontal, 12)
                            .padding(.bottom, 8)
                    }
                    //.frame(width: 125)
                    .background(Color.white)
                    .cornerRadius(5)
                    .shadow(color: .init(.sRGB, white: 0.8, opacity: 1), radius: 4, x: 0.0, y: 2)
                    .padding(.bottom)
                }
            }.padding(.horizontal)
        }
    }
}

struct Restarant: Hashable {
    let name, imageName: String
}

struct PopularRestauransView: View {
    
    let restarants: [Restarant] = [
        .init(name: "Japan`s Finest Tapes", imageName: "tapas"),
        .init(name: "Bar & Grill", imageName: "bar_grill"),
    ]
    
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
                ForEach(restarants, id: \.self) { restarant in
                    HStack(spacing: 8) {
                        Image(restarant.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 60, height: 60, alignment: .center)
                            .clipped()
                            .cornerRadius(5)
                            .padding(.leading, 6)
                            .padding(.vertical, 6)
                        
                        VStack(alignment: .leading, spacing: 6) {
                            
                            HStack{
                                Text(restarant.name)
                                Spacer()
                                Button(action: {}, label: {
                                    Image(systemName: "ellipsis")
                                        .foregroundColor(.gray)
                                })
                            }
                            HStack {
                                Image(systemName: "star.fill")
                                Text("4.7 • Sushi • $$")
                            }
                            Text("Tokyo, Japan")                            
                        }.font(.system(size: 12, weight: .semibold))
                        
                        Spacer()
                        
                    }
                    .frame(width: 240)
                    .background(Color.white)
                    .cornerRadius(5)
                    .shadow(color: .init(.sRGB, white: 0.8, opacity: 1), radius: 4, x: 0.0, y: 2)
                    .padding(.bottom)
                }
            }.padding(.horizontal)
        }
    }
}

struct User: Hashable {
    let name, imageName: String
}

struct TrendingCreatorsView: View {
    
    let users: [User] = [
        .init(name: "Amy Adams", imageName: "amy"),
        .init(name: "Billy Childs", imageName: "billy"),
        .init(name: "Sammy Adams", imageName: "sam"),
    ]
    
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
            HStack(alignment: .top, spacing: 12) {
                ForEach(users, id: \.self) { user in
                    VStack {
                        Image(user.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 60, height: 60)
                            .cornerRadius(60)
                        Text(user.name)
                            .font(.system(size: 11, weight: .semibold))
                            .multilineTextAlignment(.center)
                    }
                    .frame(width: 60)
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
        .init(name: "Food", imageName: "eye.fill"),
        .init(name: "History", imageName: "book.fill"),
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing:14) {
                ForEach(categories, id: \.self) { category in
                    VStack(spacing: 8) {
                        Image(systemName: category.imageName)
                            .font(.system(size: 20))
                            .foregroundColor(Color(#colorLiteral(red: 0.9999931455, green: 0.5843424201, blue: 0.2549082935, alpha: 1)))
                            .frame(width: 64, height: 64)
                            .background(Color.white)
                            .cornerRadius(64)
                        Text(category.name)
                            .font(.system(size: 12, weight: .semibold))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                    }.frame(width: 68)
                }
            }.padding(.horizontal)
        }
    }
}
