//
//  CodigoComentado.swift
//  PracticaMapas
//
//  Created by Hector Guadalupe Climaco Flores on 20/05/22.
//

import Foundation

/*struct Stadium {
  var name: String
  var lattitude: CLLocationDegrees
  var longtitude: CLLocationDegrees
}*/
// 17.972327953653437, -92.93231047176705
//17.999718495382083, -92.95537877811958

//punto geografico
//let stadiums = [Stadium(name: "José Moreno Irabien 505", lattitude: 17.972327953653437, longtitude: -92.93231047176705)]
/*let MyUbications = MKPointAnnotation()
var lattitude = 17.999718495382083
var longtitude = -92.95537877811958*/
//checkLocationServices()
//fetchStadiumsOnMap(stadiums)


/*MyUbications.coordinate = CLLocationCoordinate2D(latitude: lattitude, longitude: longtitude)
MyUbications.title = "Mi ubicación"
MyUbications.subtitle = "Aki estoy"
Mapa.addAnnotation(MyUbications)

let region = MKCoordinateRegion(center: MyUbications.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
Mapa.setRegion(region, animated: true)*/

//funcion que verificará cuál es el estado de autorización
/*func checkLocationServices(){
    if CLLocationManager.locationServicesEnabled() {
        checkLocationAuthorization()
     } else {
     }
}*/


/*func fetchStadiumsOnMap(_ stadiums: [Stadium]) {
  for stadium in stadiums {
    let annotations = MKPointAnnotation()
    annotations.title = stadium.name
    annotations.coordinate = CLLocationCoordinate2D(latitude:
      stadium.lattitude, longitude: stadium.longtitude)
    Mapa.addAnnotation(annotations)
  }
}*/
