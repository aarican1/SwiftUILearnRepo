    //
    //  LocationManager.swift
    //  SwiftUI-WeatherApp
    //
    //  Created by Abdurrahman Arıcan on 1.03.2025.
    //

    import Foundation
    import CoreLocation

    class LocationManager : NSObject, CLLocationManagerDelegate {
        private let locationManager = CLLocationManager()
        var onLocationUpdate: ((CLLocation) -> Void)?
        var onLocationError: ((Error) -> Void)?

        override init() {
            super.init()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
        }
     
       
       
        
        func checkIfLocationServicesIsEnabled() {
            if CLLocationManager.locationServicesEnabled(){
                checkLocationAuthorization()
            }else{
                print("Show an alert letting them know this is off and to go turn it on location services")
            }
        }
        
        func getAddressName(from location : CLLocation, completion : @escaping (String?,String?)->Void){
            let geocoder = CLGeocoder()
                  geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
                      if let placemark = placemarks?.first {
                          if let city = placemark.locality {
                              
                              if let neighborhood = placemark.subLocality {
                                  completion(city,neighborhood)
                              }
                              else{
                                  completion(city,nil)
                              }
                          }
                            else {
                                completion(nil,nil)
                          }
                      }
                  }
        }
        
        
        private func checkLocationAuthorization(){
          switch locationManager.authorizationStatus {
                
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()

            case .restricted:
                print("Your location is restricted.")
            case .denied:
                print("Your have denied this app location permission. Go into settings to change it.")
            case .authorizedAlways, .authorizedWhenInUse:
                locationManager.requestLocation()
                break
            @unknown default:
                break
            }
        }
        
        func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            checkLocationAuthorization()
        }
        
        
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            if let newLocation = locations.last {
                onLocationUpdate?(newLocation)
                  }
            
            manager.stopUpdatingLocation()
        }
        
        
        func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
            onLocationError?(error)
            
        }
        
    }
