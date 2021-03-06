//
//  PopularDestinationsView.swift
//  Discovery
//
//  Created by user on 24.08.2021.
//

import SwiftUI
import MapKit

struct PopularDestinationsView: View {
    
    let destinations: [Destination] = [
        .init(name: "Paris", country: "France", imageName: "eiffel_tower", latitude: 48.855014, longitude: 2.341231),
        .init(name: "Tokyo", country: "Japan", imageName: "japan", latitude: 35.67988, longitude: 139.7695),
        .init(name: "New York", country: "US", imageName: "new_york", latitude: 40.71592, longitude: -74.0055),
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
                    NavigationLink(
                        destination: NavigationLazyView(PopularDestinationDetailsView(destination: destination)), label: {
                        PopularDestinationTileRow(destination: destination)
                            .padding(.bottom)
                    })
                }
            }.padding(.horizontal)
        }
    }
}


struct DestinationDetails: Decodable {
    let description: String
    let photos: [String]
}

class DestinationDetailsViewModel: ObservableObject {
    
    @Published var isLoading = true
    @Published var destinationDetails: DestinationDetails?
    
    init(name: String) {
        let fixedUrlString = "https://travel.letsbuildthatapp.com/travel_discovery/destination?name=\(name.lowercased())".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        guard let url = URL(string: fixedUrlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, error) in
            
            DispatchQueue.main.async {
                guard let data = data else { return }
                
                do {
                    self.destinationDetails = try JSONDecoder().decode(DestinationDetails.self, from: data)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
        
    }
    
}

struct PopularDestinationDetailsView: View {
    
    @ObservedObject var vm: DestinationDetailsViewModel
    
    let destination: Destination
    
    @State var region: MKCoordinateRegion
    @State var isShowingAttractions = true
    
    init(destination: Destination) {
        print("Hitting network unnecesarily")
        self.destination = destination
        self._region = State(initialValue: MKCoordinateRegion(center: .init(latitude: destination.latitude, longitude: destination.longitude), span: .init(latitudeDelta: 0.1, longitudeDelta: 0.1)))
        self.vm = .init(name: destination.name)
    }
    
    var body: some View {
        ScrollView {
            
            if let photos = vm.destinationDetails?.photos {
                DestinationHeaderContainer(imageUrlStrings: photos)
                    .frame(height: 350)
            }
            
            VStack(alignment: .leading) {
                Text(destination.name)
                    .font(.system(size: 18, weight: .bold))
                Text(destination.country)
                
                HStack {
                    ForEach(0..<5, id: \.self) { num in
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                    }
                }.padding(.top, 2)
                
                HStack {
                    Text(vm.destinationDetails?.description ?? "")
                        .padding(.top, 4)
                        .font(.system(size: 14))
                    Spacer()
                }
                

                
                // HStack { Spacer() }
            }
            .padding(.horizontal)
            
            HStack {
                Text("Location")
                    .font(.system(size: 18, weight: .semibold))
                Spacer()
                
                Button(action: {
                    isShowingAttractions.toggle()
                }, label: {
                    Text("\(isShowingAttractions ? "Hide" : "Show") Attractions")
                        .font(.system(size: 12, weight: .semibold))
                })
                
                Toggle("", isOn: $isShowingAttractions)
                    .labelsHidden()
                
            }.padding(.horizontal)
            
            Map(coordinateRegion: $region, annotationItems: isShowingAttractions ? attractions : []) { attraction in
                // MapMarker(coordinate: .init(latitude: attraction.latitude, longitude: attraction.longitude), tint: .blue)
                MapAnnotation(coordinate: .init(latitude: attraction.latitude, longitude: attraction.longitude)) {
                    CustomMapAnnotation(attraction: attraction)
                }
            }
            .frame(height: 300)
        }.navigationBarTitle(destination.name, displayMode: .inline)
    }
    
    let attractions: [Attraction] = [
        .init(name: "Eiffel Tower", imageName: "eiffel_tower", latitude: 48.858605, longitude: 2.2946),
        .init(name: "Champs-Elysees", imageName: "new_york", latitude: 48.866867, longitude: 2.311780),
        .init(name: "Louvre Museum", imageName: "art2", latitude: 48.860288, longitude: 2.337789)
    ]
    
}

struct CustomMapAnnotation: View {
    let attraction: Attraction
    
    var body: some View {
        VStack {
            Image(attraction.imageName)
                .resizable()
                .frame(width: 80, height: 60)
                .cornerRadius(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color(.init(white: 0, alpha: 0.5)))
                )
            Text(attraction.name)
                .font(.system(size: 12, weight: .semibold))
                .padding(.horizontal, 6)
                .padding(.vertical, 4)
                .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
                .foregroundColor(.white)
                .cornerRadius(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color(.init(white: 0, alpha: 0.5)))
                )
        }.shadow(radius: 5)
    }
}

struct PopularDestinationTileRow: View {
    
    let destination: Destination
    
    var body: some View {
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
                .foregroundColor(Color(.label))
            
            Text(destination.country)
                .font(.system(size: 12, weight: .semibold))
                .padding(.horizontal, 12)
                .padding(.bottom, 8)
                .foregroundColor(.gray)
        }
        .asTile()
    }
}

struct PopularDestinationsView_Previews: PreviewProvider {
    static var previews: some View {
        PopularDestinationsView()
        NavigationView {
            PopularDestinationDetailsView(destination: .init(name: "Paris", country: "France", imageName: "eiffel_tower", latitude: 48.859565, longitude: 2.353235))
        }
        MainView()

    }
}
