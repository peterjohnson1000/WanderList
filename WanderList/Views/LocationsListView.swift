//
//  LocationsListView.swift
//  WanderList
//
//  Created by Peter Johnson on 3/17/24.
//

import SwiftUI

struct LocationsListView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        List {
            ForEach(vm.locations) { location in
                
                listRowView(location: location)
                    .padding(.vertical,4)
                    .listRowBackground(Color.clear)
                    .onTapGesture {
                        vm.showNextLocation(location: location)
                    }
            }
        }
        .listStyle(.plain)
    }
}

extension LocationsListView {
    func listRowView(location: Location) -> some View {
        HStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height:45)
                    .cornerRadius(10)
            }
            
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }

    }
}

#Preview {
    LocationsListView()
        .environmentObject(LocationsViewModel())
}
