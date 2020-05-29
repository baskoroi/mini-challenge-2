//
//  StatusPosisiViewController.swift
//  MC2-Group15
//
//  Created by Faris Ali Yafie on 28/05/20.
//  Copyright © 2020 Angela Fanuela. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class StatusPosisiViewController: UIViewController,CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var contactButton: UIButton!
    @IBOutlet weak var mapView: MKMapView!
    
    let statusHelper : Int = 0
    
    // setting all view in info pesanan
    func setupView(){
        imageView.layer.cornerRadius = 8.0
        contactButton.layer.cornerRadius = 8.0
    }
    
    //manage user's location
    var locManager = CLLocationManager()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
        locManager.desiredAccuracy = kCLLocationAccuracyBest // High Battery Usage
        locManager.delegate = self
        // locManager.requestAlwaysAuthorization()
        locManager.requestWhenInUseAuthorization()
        locManager.startUpdatingLocation()
            
        mapView.delegate = self
        
        getAddress()
    }
    
    func StatusHelper(){
        switch statusHelper {
        case 0:
            statusLabel.text = "Status : Menuju Lokasi Belanja"
        case 1:
            statusLabel.text = "Status : Menuju Rumah Anda"
        case 2:
            statusLabel.text = "Status : Hampir Sampai"
        default:
            statusLabel.text = "Status : Undetected"
        }
    }
        
    // get address from textfield
    func getAddress(){
        let geoCoder = CLGeocoder()
        // get source place from here
        geoCoder.geocodeAddressString("lokasi helper") { (placemarks, error) in
            guard let placemarks = placemarks, let target = placemarks.first?.location
                else{
                    print("No Location Found")
                    return
            }
            print(target)
            self.mapThis(sourceCoor: target.coordinate)
        }
    }
    
    //update location state
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
            manager.stopUpdatingLocation()
            render(location)
        }
        print(locations)
    }
    
        func render(_ location: CLLocation){
            let sourceCoordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
            let region = MKCoordinateRegion(center: sourceCoordinate, span: span)
            mapView.setRegion(region, animated: true)
            mapView.showsUserLocation = true

            // pin current location
            let pinned = MKPointAnnotation()
            pinned.coordinate = sourceCoordinate
            mapView.addAnnotation(pinned)
        }

        // create direction from source to destination place
        func mapThis(sourceCoor : CLLocationCoordinate2D){
            let destinationCoor = (locManager.location?.coordinate)!

            let sourcePlaceMark = MKPlacemark(coordinate: sourceCoor)
            let destinationPlaceMark = MKPlacemark(coordinate: destinationCoor)

            let sourceItem = MKMapItem(placemark: sourcePlaceMark)
            let destinationItem = MKMapItem(placemark: destinationPlaceMark)

            let destinationRequest = MKDirections.Request()
            destinationRequest.source = sourceItem
            destinationRequest.destination = destinationItem
            destinationRequest.transportType = .automobile
            destinationRequest.requestsAlternateRoutes = true

            let directions = MKDirections(request: destinationRequest)
            directions.calculate { (response, error) in
                guard let response = response else{
                    if let error = error {
                        print("Something is wrong")
                    }
                    return
                }
                let route = response.routes[0]
                self.mapView.addOverlay(route.polyline)
                self.mapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
            }
        }

        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let render = MKPolylineRenderer(overlay: overlay as! MKPolyline)
            render.strokeColor = .blue
            return render
        }
    
    }
