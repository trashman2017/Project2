import UIKit
import MapKit

class TripsMapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var tripsMap: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load trips from the Utilities class
        Utilities.loadTrips()
        
        // Set the MapKitView delegate to the TripsMapViewController
        self.tripsMap.delegate = self
        
        // Center the map around current user location
        tripsMap.setCenter(tripsMap.userLocation.coordinate, animated: true)
        
        // Add a Pin to the map for each trip
        for i in 0 ... Utilities.trips.count - 1 {
            let trip = Utilities.trips[i]
            
            // CLGeocoder helps to convert trip destination to coordinates
            CLGeocoder().geocodeAddressString(trip.tripDestination, completionHandler: {
                // This is a closure (function), called after resolving the coordinate of the destination
                (placeMark, error) in let tripLocation = placeMark![0].location?.coordinate
                self.tripsMap.addAnnotation(TripAnnotation(tripId : i, trip: trip, coordinate: tripLocation!))
            }
        )
    }
}
}


// Stopped after step 13.. Next Customizing your Pin image...
