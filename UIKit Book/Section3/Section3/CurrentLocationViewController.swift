//
//  ViewController.swift
//  Section3
//
//  Created by Sarvar Boltaboyev on 25/08/24.
//
import CoreLocation
import UIKit

class CurrentLocationViewController: UIViewController, CLLocationManagerDelegate {
    // reverse geocoding
    let geocoder = CLGeocoder()
    var placemark: CLPlacemark?
    var performingReverseGeocoding = false
    var lastGeocodingError: Error?
     
    var updatingLocation = false // chapter 23
    var lastLocationError: Error? // chapter 23
    let locationManager = CLLocationManager() // chapter 22
    var location: CLLocation? // chapter 22
    
    var timer: Timer?
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var tagButton: UIButton!
    @IBOutlet weak var getButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabels()
        configureButton()
    }
    
    
    // confogure get button
    
    func configureButton() {
        if updatingLocation {
            getButton.setTitle("Stop", for: .normal)
        } else {
            getButton.setTitle("Get My Location", for: .normal)
        }
    }
    // MARK: - CLLocationManagerDelegate
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("didFailWithError \(error.localizedDescription)")
        
       
        
        if (error as NSError).code == CLError.locationUnknown.rawValue {
            return
        }
        
        lastLocationError = error
        stopLocationManager()
        updateLabels()
    }
    
    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]) {
            
            let newLocation = locations.last!
            print("didUpdateLocations \(newLocation)")
            
            // 1
            if newLocation.timestamp.timeIntervalSinceNow < -5 {
                return
            }
            
            // 2
            if newLocation.horizontalAccuracy < 0 {
                return
            }
            
            // New section #1
            var distance =  CLLocationDistance(Double.greatestFiniteMagnitude)
            if let location = location {
                distance = newLocation.distance(from: location)
            }
            // End of new section #1
            
            // 3
            if location == nil || location!.horizontalAccuracy >
                newLocation.horizontalAccuracy {
                
                // 4
                lastLocationError = nil
                location = newLocation
                
                // 5
                if newLocation.horizontalAccuracy <=
                    locationManager.desiredAccuracy {
                    // New section #2
                    if distance > 0 {
                        performingReverseGeocoding = false
                    }
                    // End of new section #2
                    print("*** We're done!")
                    stopLocationManager()
                }
                updateLabels()
                // New section #3
            } else if distance < 1 {
                let timeInterval =
                newLocation.timestamp.timeIntervalSince(location!.timestamp)
                if timeInterval > 10 {
                    print("*** Force done!")
                    stopLocationManager()
                    updateLabels()
                }
                // End of new sectiton #3
            }
            // The new code begins here:
            if !performingReverseGeocoding {
                print("*** Going to geocode")
                performingReverseGeocoding = true
                geocoder.reverseGeocodeLocation(newLocation) {placemarks,
                    error in
                    self.lastGeocodingError = error
                    if error == nil, let places = placemarks, !places.isEmpty {
                        self.placemark = places.last!
                    } else {
                        self.placemark = nil
                    }
                    self.performingReverseGeocoding = false
                    self.updateLabels()
                }
            }
            // End of the new code
            
        }
    // MARK: - Actions
    @IBAction func getLocation() {
        let authStatus = locationManager.authorizationStatus
        if authStatus == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
            return
        }
        if authStatus == .denied || authStatus == .restricted {
            alert()
            return
        }
        
        
        // New code below, replacing existing code after this point // chapter 23
        if updatingLocation {
            stopLocationManager()
        } else {
            location = nil
            lastLocationError = nil
            startLocationManager()
        }
        updateLabels()
        
    }
    
    @objc func didTimeOut() {
      print("*** Time out")
      if location == nil {
        stopLocationManager()
        lastLocationError = NSError(
          domain: "MyLocationsErrorDomain",
          code: 1,
          userInfo: nil)
        updateLabels()
      }
    }
    
    // MARK: - Helper Methods
    
    
    func string(from placemark: CLPlacemark) -> String {
      // 1
      var line1 = ""
      // 2
      if let tmp = placemark.subThoroughfare {
        line1 += tmp + " "
      }
    // 3
      if let tmp = placemark.thoroughfare {
    line1 += tmp }
    // 4
      var line2 = ""
      if let tmp = placemark.locality {
        line2 += tmp + " "
      }
      if let tmp = placemark.administrativeArea {
        line2 += tmp + " "
      }
      if let tmp = placemark.postalCode {
    line2 += tmp }
    // 5
      return line1 + "\n" + line2
    }
    
    func startLocationManager() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            updatingLocation = true
            
            // chapter 23
            timer = Timer.scheduledTimer(
                  timeInterval: 60,
                  target: self,
                  selector: #selector(didTimeOut),
                  userInfo: nil,
                  repeats: false)
        }
    }
    
    func stopLocationManager() {
        if updatingLocation {
            locationManager.stopUpdatingLocation()
            locationManager.delegate = nil
            updatingLocation = false
            if let timer = timer {
                  timer.invalidate()
                }
        }
    }
    
    func alert() {
        let alert = UIAlertController(title: "Location Services Disabled", message: "Please enable location services for this app in  Settings.", preferredStyle: .alert)
        let oKaction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(oKaction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func updateLabels() {
        if let location = location {
            latitudeLabel.text = String(
                format: "%.8f",
                location.coordinate.latitude)
            longitudeLabel.text = String(format: "%.8f", location.coordinate.longitude)
            if let placemark = placemark {
                  addressLabel.text = string(from: placemark)
                } else if performingReverseGeocoding {
                  addressLabel.text = "Searching for Address..."
                } else if lastGeocodingError != nil {
                  addressLabel.text = "Error Finding Address"
            } else {
                  addressLabel.text = "No Address Found"
                }
        } else {
            // Remove the following line  // chapter 23
            messageLabel.text = "Tap 'Get My Location' to Start"
            // The new code starts here:
            let statusMessage: String
            if let error = lastLocationError as NSError? {
                if error.domain == kCLErrorDomain && error.code == CLError.denied.rawValue {
                    statusMessage = "Location Services Disabled"
                } else {
                    statusMessage = "Error Getting Location"
                }
            } else if !CLLocationManager.locationServicesEnabled() {
                statusMessage = "Location Services Disabled"
            } else if updatingLocation {
                statusMessage = "Searching..."
            } else {
                statusMessage = "Tap 'Get My Location' to Start"
            }
            messageLabel.text = statusMessage
        }
    }
}


