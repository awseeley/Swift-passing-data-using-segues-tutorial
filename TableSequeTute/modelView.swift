//
//  modelView.swift
//  TableSequeTute
//
//  Created by Andrew Seeley on 24/12/2014.
//  Copyright (c) 2014 Seemu. All rights reserved.
//

import UIKit

class modelView: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    var selMake = String()
    
    var tableData: [String] = []
    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        switch selMake {
            case "Ferrari":
                tableData = ["458", "La Ferrari"]
            case "BMW":
                tableData = ["M3", "335i", "M5"]
            case "Mitsubishi":
                tableData = ["Evo X", "Evo IX"]
            case "Lambo":
                tableData = ["Adventador", "Hurucan", "Gallado"]
        default:
            println("undefined ")
        }
        
        
        println("Sel Make: \(selMake)")
        
        self.tableView.reloadData()

        // Do any additional setup after loading the view.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        cell.textLabel?.text = self.tableData[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("Row \(indexPath.row) selected")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
