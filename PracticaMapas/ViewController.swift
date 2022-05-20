//
//  ViewController.swift
//  PracticaMapas
//
//  Created by Hector Guadalupe Climaco Flores on 20/05/22.
//

import UIKit
import MapKit
import CoreLocation

struct Stadium {
  var name: String
  var lattitude: CLLocationDegrees
  var longtitude: CLLocationDegrees
}

class ViewController: UIViewController {

    @IBOutlet weak var Mapa: MKMapView!
   
    private let locationManager = CLLocationManager()
    private let rangeInMeters: Double = 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationService()
        centerViewUser()
        
        
        let stadiums = [Stadium(name: "José Moreno Irabien 505", lattitude: 17.972327953653437, longtitude: -92.93231047176705)]
        let MyUbications = MKPointAnnotation()
        let lattitude = 17.999718495382083
        let longtitude = -92.95537877811958
        fetchStadiumsOnMap(stadiums)


        MyUbications.coordinate = CLLocationCoordinate2D(latitude: lattitude, longitude: longtitude)
        MyUbications.title = "Mi ubicación"
        MyUbications.subtitle = "Aki estoy"
        Mapa.addAnnotation(MyUbications)
   
    }
    func fetchStadiumsOnMap(_ stadiums: [Stadium]) {
      for stadium in stadiums {
        let annotations = MKPointAnnotation()
        annotations.title = stadium.name
        annotations.coordinate = CLLocationCoordinate2D(latitude:
          stadium.lattitude, longitude: stadium.longtitude)
        Mapa.addAnnotation(annotations)
      }
    }
    //funcion que checa la autorizavion de la locacion
    func checkLocationAuthorization() {
        switch locationManager.authorizationStatus {
        //está autorizada para obtener la ubicación del usuario es cuando la aplicación está abierta.
        case.authorizedWhenInUse:
            Mapa.showsUserLocation = true
            centerViewUser()
            locationManager.startUpdatingLocation()
            break
        case.denied:
          break
        //en la primera vez, cuando se muestra la ventana emergente, no han elegido permitir o no permitir
        case.notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
        case.restricted:
          break
        //puede obtener su ubicación cuando está en segundo plano.
        case.authorizedAlways:
              Mapa.showsUserLocation = true
              centerViewUser()
              locationManager.startUpdatingLocation()
          break
        @unknown default:
            break
      }
    }
}
extension ViewController: CLLocationManagerDelegate {
    //conocer si cambia el permiso dado por el usuario sobre el uso de la localización
    func locationManager (_ manager: CLLocationManager, didChangeAuthorization status : CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
    // y cuando se actualiza la localización del usuario
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        }
    private func checkLocationService(){
        guard CLLocationManager.locationServicesEnabled() else {
            return
        }
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        checkLocationAuthorization()
    }
    //rango de vista
    private func centerViewUser(){
        guard let location = locationManager.location?.coordinate else { return }
        
        let coordinateRegion = MKCoordinateRegion.init(center: location, latitudinalMeters: rangeInMeters, longitudinalMeters: rangeInMeters)
        Mapa.setRegion(coordinateRegion, animated: true)
    }
}
