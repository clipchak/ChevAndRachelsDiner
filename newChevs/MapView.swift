//
//  MapView.swift
//  Darty - Best Drinking Game
//
//  Created by Colton Lipchak on 2/4/20.
//  Copyright © 2020 clipchak. All rights reserved.
//
//  holds the map

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        let centerCoor = CLLocationCoordinate2D(
        latitude: 40.512700, longitude: -80.098845)
        let coordinate = CLLocationCoordinate2D(
            latitude: 40.513055, longitude: -80.098845)
        let span = MKCoordinateSpan(latitudeDelta: 0.0015, longitudeDelta: 0.0015)
        let region = MKCoordinateRegion(center: centerCoor, span: span)
        view.setRegion(region, animated: true)
        //view.mapType = MKMapType(rawValue: 5)!
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "Chev & Rachel's Family Diner"
        view.addAnnotation(annotation)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
