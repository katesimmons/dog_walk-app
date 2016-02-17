//
//  ViewController.swift
//  Dog_Walk
//
//  Created by durul dalkanat on 2/16/16.
//  Copyright © 2016 durul dalkanat. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var managedContext: NSManagedObjectContext!

    @IBOutlet weak var tableView: UITableView!
    
    //is this necessary? might be handled by managedContext
    var walks:[Walk] = [
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //Please implement main tableview configuration
    //Tableview Delegation
    //Tableview Datasource
    
    //is this the delegate or the datasource?
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return walks.count //count? what are we doing with this?
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        //what else goes here? I don't know what we're trying to do or display here...
        return cell!
        
    }
    
    
    
}

