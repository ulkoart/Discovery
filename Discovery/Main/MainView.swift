//
//  ContentView.swift
//  Discovery
//
//  Created by user on 23.08.2021.
//

import SwiftUI

extension Color {
    static let discoverBackground = Color(.init(white: 0.95, alpha: 1))
    static let defaultBackground = Color("defaultBackground")
}

struct MainView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
    }
    
    // @Environment(\.colorScheme) var colorScheme
        
    var body: some View {
        NavigationView {
            
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.999972403, green: 0.7216030955, blue: 0.2627452612, alpha: 1)), Color(#colorLiteral(red: 0.9999994636, green: 0.5333602428, blue: 0.2823523283, alpha: 1))]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                Color.defaultBackground
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
                    }
                    .background(Color.defaultBackground)
                    .cornerRadius(16)
                    .padding(.top, 32)
                }
            }
            .navigationTitle("Discover")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .colorScheme(.dark)
        MainView()
            .colorScheme(.light)
    }
}
