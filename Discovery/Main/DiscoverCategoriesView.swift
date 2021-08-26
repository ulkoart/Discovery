//
//  DiscoverCategoriesView.swift
//  Discovery
//
//  Created by user on 24.08.2021.
//

import SwiftUI

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
                    NavigationLink(
                        destination: CategoryDetailsView(),
                        label: {
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
                        })
                }
            }.padding(.horizontal)
        }
    }
}

class CategoryDetailsViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var places = [Int]()
    
    init() {
        // network
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.isLoading = false
            self?.places = [1,2,3,4,5,6,7]
        }
    }
}

struct ActivityIndicatorView: UIViewRepresentable {
    typealias UIVewType = UIActivityIndicatorView
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let aiv = UIActivityIndicatorView(style: .large)
        aiv.startAnimating()
        aiv.color = .white
        return aiv
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {

    }
}

struct CategoryDetailsView: View {
    
    @ObservedObject var vm = CategoryDetailsViewModel()
    
    var body: some View {
        ZStack {
            if vm.isLoading {
                VStack {
                    ActivityIndicatorView()
                    Text("Loading...")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                }
                .padding()
                .background(Color.black)
                .cornerRadius(8)
                

            } else {
                ScrollView {
                    
                    ForEach(vm.places, id: \.self) { num in
                        VStack(alignment: .leading, spacing: 0) {
                            Image("art1")
                                .resizable()
                                .scaledToFill()
                            Text("Demo")
                                .font(.system(size: 12, weight: .semibold))
                                .padding()
                        }.asTile()
                        .padding()
                    }
                }
            }
        }.navigationBarTitle("Categoty", displayMode: .inline)
    }
}

struct DiscoverCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CategoryDetailsView()
        }
        
        MainView()
        
        //        ZStack {
        //            Color.orange
        //            DiscoverCategoriesView()
        //        }
        
    }
}
