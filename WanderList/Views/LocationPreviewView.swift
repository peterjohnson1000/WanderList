//
//  LocationPreviewView.swift
//  WanderList
//
//  Created by Peter Johnson on 3/19/24.
//

import SwiftUI

struct LocationPreviewView: View {
    
    let location: Location
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        
        
        HStack(alignment: .bottom) {
            
            VStack(alignment: .leading, spacing: 10) {
                imageSection
                titleSection
            }
            
            VStack(spacing: 10) {
                learnMoreButton
                learnNextButton
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y:65)
        )
        .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
    }
}

extension LocationPreviewView {
    
    var imageSection: some View {
        
        VStack {
            if let imageName = location.imageNames.first
            {
                Image(imageName)
                    .resizable()
                    .frame(width:100 ,height:100)
                    .cornerRadius(10)
            }
        }
        .padding(5)
        .background(.white)
        .cornerRadius(10)
    }
    
    var titleSection: some View {
        
        VStack(alignment: .leading) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            Text(location.cityName)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var learnMoreButton: some View {
        Button (
            action: {
            
        }, label: {
            Text("Learn More")
                .frame(width: 125, height: 35)
        })
        .buttonStyle(.borderedProminent)
        
    }
    
    var learnNextButton: some View {
        Button (
            action: {
                vm.nextButtonPressed(location: location)
        }, label: {
            Text("Next")
                .frame(width: 125, height: 35)
        })
        .buttonStyle(.bordered)
    }
}



#Preview {
    LocationPreviewView(location: LocationsDataService.locations.first!)
        .padding()
        .environmentObject(LocationsViewModel())
}
