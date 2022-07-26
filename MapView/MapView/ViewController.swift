
//
//  ViewController.swift
//  MapView
//
//  Created by rentalhub-16pro on 2022/07/19.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    var locationManager:CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        mapView.showsUserLocation = true
    }
// 남산타워 37.5511694    126.9882266
//37.3983865!4d126.9879868
    @IBAction func segmentControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            locationManager.startUpdatingLocation()
        case 1:
            let coord = CLLocationCoordinate2D.init(latitude: 37.3893865, longitude: 126.9879868)
            updateRegion(coord: coord)
            updatePin(coord: coord, title: "통합IT센터", subTitle: "출근하자...")
            
        case 2:
            let coord = CLLocationCoordinate2D.init(latitude: 37.5511694, longitude: 126.9882266)
            updateRegion(coord: coord)
            updatePin(coord: coord, title: "남산타워", subTitle: "서울구경")
        default:
            updateRegion(coord: CLLocationCoordinate2D.init(latitude: 0, longitude: 0))
        }
        
        
    }
    
    func updateRegion(coord: CLLocationCoordinate2D){
        let span = MKCoordinateSpan.init(latitudeDelta: 0.01, longitudeDelta: 0.01)
        
        let region = MKCoordinateRegion.init(center: coord, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    func updatePin(coord: CLLocationCoordinate2D, title:String, subTitle: String){
        let pin = MKPointAnnotation()
        pin.coordinate = coord
        pin.title = title
        pin.subtitle = subTitle
        mapView.addAnnotation(pin)
    }
    
    
}

extension ViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }

        updateRegion(coord: location.coordinate)
        updatePin(coord: location.coordinate, title: "현재위치", subTitle: "")
        locationManager.stopUpdatingLocation()
        
        titleLabel.text = "현재위치"
        
        CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            if let pm = placemarks?.first,
               let country = pm.country,
               let area = pm.administrativeArea,
               let thoroughfare = pm.thoroughfare,
               let local = pm.locality,
               let subThoroughfare = pm.subThoroughfare
            {
                self.addressLabel.text = "\(country) \(area) \(local) \(thoroughfare) \(subThoroughfare)"
            }
        }
    }
    
    
}
