//
//  LocationsView.swift
//  WanderList
//
//  Created by Peter Johnson on 3/16/24.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    
//    @State private var mapRegion = MapCameraPosition.region(MKCoordinateRegion(
//            center: CLLocationCoordinate2D(latitude: 41.8902, 
//                                           longitude: 12.4922),
//            span: MKCoordinateSpan(latitudeDelta: 0.1,
//                                   longitudeDelta: 0.1)))
    
    var body: some View {
        
        ZStack {
            Map(coordinateRegion: $vm.mapRegion)
                .ignoresSafeArea()
            VStack {
                header
                    .padding()
                
                Spacer()
                
                ZStack {
                    ForEach(vm.locations) { location in
                        if location.name == vm.mapLocation.name {
                            LocationPreviewView(location: location)
                                .shadow(color: .black.opacity(0.1) ,radius: 20)
                                .padding()
                                .transition(.asymmetric(
                                    insertion: .move(edge: .trailing),
                                    removal: .move(edge: .leading)))
                        }
                    }
                }
            }
        }
    }
}

extension LocationsView {
    var header: some View {
        VStack {
            Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                .font(.title2)
                .fontWeight(.black)
                .frame(height:55)
                .frame(maxWidth:.infinity)
                .overlay(alignment: .leading) {
                    Image(systemName: "arrow.down")
                        .font(.headline)
                        .foregroundStyle(.primary)
                        .padding()
                        .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))
                }
            if vm.showLocationsList {
                LocationsListView()
            }
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.5) ,radius: 20, x: 0, y: 15)
        .onTapGesture {
            vm.toggleShowLocationsList()
        }
    }
    
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
