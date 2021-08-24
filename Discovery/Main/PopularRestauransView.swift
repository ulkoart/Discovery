//
//  PopularRestauransView.swift
//  Discovery
//
//  Created by user on 24.08.2021.
//

import SwiftUI

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
                    .modifier(TileModifer())
                    .padding(.bottom)
                }
            }.padding(.horizontal)
        }
    }
}


struct PopularRestauransView_Previews: PreviewProvider {
    static var previews: some View {
        PopularRestauransView()
    }
}
