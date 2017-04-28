import UIKit

class TblViewControllerTrips: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Utilities.loadTrips()
        // Push the Table View below the bar
        self.tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
    }
    
    // How many sections in my table - currently I want one section
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Utilities.trips.count
    }

    // Fill the table view
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tripCell", for: indexPath)
        cell.textLabel?.text = "\(Utilities.trips[indexPath.row].tripDestination), \(Utilities.trips[indexPath.row].tripDuration)"
        cell.detailTextLabel?.text = "\(Utilities.dateFormatter.string(from: Utilities.trips[indexPath.row].tripDate))"
        cell.imageView?.image = Utilities.trips[indexPath.row].destinationImage
        return cell
    }
    
    // Trigger the segue for the selected cell, and send the trip object to the details view
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segueTripDetails", sender: Utilities.trips[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // I created a segue from the cell to the Trip Info and changed the identified to segueTripDetails
        if segue.identifier == "segueTripDetails" {
            (segue.destination as! TblViewControllerTripInfo).trip = (sender as! Trip)
        }
    }
    
    // called in the unwind segue - exit Trip Info
    @IBAction func unWindSegue(segue : UIStoryboardSegue) {
        self.tableView.reloadData()
    }
    
    // Editing Table View - tap left on the table to see
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            Utilities.trips.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
