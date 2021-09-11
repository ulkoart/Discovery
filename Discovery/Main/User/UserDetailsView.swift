//
//  UserDetailsView.swift
//  Discovery
//
//  Created by user on 09.09.2021.
//

import SwiftUI
import KingfisherSwiftUI

struct UserDetailsView: View {
    
    let user: User
    
    var body: some View {
        ScrollView {
            
            VStack(spacing: 12) {
                Image(user.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .padding(.horizontal)
                    .padding(.top)
                
                Text(user.name)
                    .font(.system(size: 14, weight: .semibold))
                //  • : OPT + 8
                
                HStack {
                    Text("@amyadams20 •")
                    Image(systemName: "hand.thumbsup.fill")
                        .font(.system(size: 10, weight: .semibold))
                    Text("2541")
                }
                .font(.system(size: 12, weight: .regular))
                
                Text("YouTuber, Vlogger, Travel Creator")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(Color(.lightGray))
                
                HStack(spacing: 12) {
                    VStack {
                        Text("59,394")
                            .font(.system(size: 13, weight: .semibold))
                        Text("Followers")
                            .font(.system(size: 9, weight: .regular))
                    }
                    
                    Spacer()
                        .frame(width: 0.5, height: 10)
                        .background(Color(.lightGray))
                    
                    VStack {
                        Text("2,112")
                            .font(.system(size: 13, weight: .semibold))
                        Text("Following")
                            .font(.system(size: 9, weight: .regular))
                    }
                }
                
                HStack(spacing: 12) {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        HStack {
                            Spacer()
                            Text("Follow")
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .padding(.vertical, 8)
                        .background(Color(.orange))
                        .cornerRadius(100)
                    })
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        HStack {
                            Spacer()
                            Text("Contacts")
                                .foregroundColor(Color(.black))
                            Spacer()
                        }
                        .padding(.vertical, 8)
                        .background(Color(white: 0.9))
                        .cornerRadius(100)
                    })
                }.font(.system(size: 11, weight: .semibold))
                
                ForEach(0..<10, id: \.self) { num in
                    VStack(alignment: .leading) {
                        KFImage(URL(string: "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/5c6bc68c-a8a1-42ac-ab3a-947927826807"))
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200)
                            .clipped()
                        
                        HStack {
                            Image("amy")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 34)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading) {
                                Text("Here is my post")
                                    .font(.system(size: 14, weight: .semibold))
                                Text("500k views")
                                    .font(.system(size: 12, weight: .semibold))
                                    .foregroundColor(.gray)
                            }
                        }.padding(.horizontal, 8)
                        
                        HStack {
                            ForEach(0..<3, id: \.self) { num in
                                Text("#Traveling")
                                    .foregroundColor(Color(#colorLiteral(red: 0.02622057498, green: 0.5437566042, blue: 1, alpha: 1)))
                                    .font(.system(size: 14, weight: .semibold))
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 4)
                                    .background(Color(#colorLiteral(red: 0.9179115891, green: 0.9450209737, blue: 0.9946766496, alpha: 1)))
                                    .cornerRadius(20)
                            }
                        }
                        .padding(.bottom)
                        .padding(.horizontal, 8)
                        
                       
                    }
                    .background(Color(white: 1))
                    .cornerRadius(12)
                    .shadow(color: .init(white: 0.8), radius: 5, x: 0, y: 4)
                }

            }.padding(.horizontal)
        }.navigationBarTitle(user.name, displayMode: .inline)
    }
}

struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserDetailsView(user: .init(name: "Amy Adams", imageName: "amy"))
        }
    }
}
