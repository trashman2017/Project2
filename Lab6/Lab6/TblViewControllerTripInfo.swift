import UIKit

class TblViewControllerTripInfo: UITableViewController {
    
    var trip : Trip?
    
    @IBOutlet weak var tripDate: UITextField!
    @IBOutlet weak var tripDuration: UITextField!
    @IBOutlet weak var tripDestination: UITextField!
    
    // Save changes if the user modified the trip data
    @IBAction func saveTripInfo(_ sender: Any) {
        trip!.tripDate = Utilities.dateFormatter.date(from: tripDate.text!)!
        trip!.tripDuration = Int(tripDuration.text!)!
        trip!.tripDestination = tripDestination.text!
    }
    
    // Set the trip details as passed from the trips list view
    override func viewWillAppear(_ anited: Bool) {
        if trip != nil {
            tripDate.text = Utilities.dateFormatter.string(for: trip!.tripDate)
            tripDestination.text = trip!.tripDestination
            tripDuration.text = "\(trip!.tripDuration)"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
