//
//  LocationsViewModel.swift
//  WanderList
//
//  Created by Peter Johnson on 3/16/24.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {
    
    // Load all the locations from LocationsDataService
    @Published var locations: [Location]
    
    // Set current location on the map
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    // Current region selected on the mao
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    // Show or hide the list of locations
    @Published var showLocationsList: Bool = false
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut)
        {
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan)
        }
    }
    
    func toggleShowLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList.toggle()
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
        }
    }
    
    func nextButtonPressed(location: Location) {
        withAnimation() {
            for index in locations.indices {
                if locations[index].name == location.name {
                    if index + 1 < locations.count {
                        mapLocation = locations[index + 1]
                    }
                    else {
                        mapLocation = locations.first!
                    }
                }
                
            }
        }
    }
}
