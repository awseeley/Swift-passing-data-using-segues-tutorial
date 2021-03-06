



import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    var selMake = String()
    
    
    var tableData: [String] = ["Ferrari", "BMW", "Mitsubishi", "Lambo"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Register custom cell
        var nib = UINib(nibName: "vwTblCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "cell")

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell 	{
        
        var cell:TblCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as TblCell
        
        cell.lblCarName.text = tableData[indexPath.row]
        cell.imgCarName.image = UIImage(named: tableData[indexPath.row])
        
        return cell

    }
    

    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        println("Row \(indexPath.row) selected")
        
        selMake = tableData[indexPath.row]
        performSegueWithIdentifier("modelView", sender: self)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
        if(segue.identifier == "modelView") {
            var vc = segue.destinationViewController as modelView
            vc.selMake = selMake
        }
        
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
    }
    
    
    
    
    
    
    
}

