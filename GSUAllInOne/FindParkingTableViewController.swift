//
//  FindParkingTableViewController.swift
//  GSUAllInOne
//
//  Created by Riyazh Dholakia on 10/7/18.
//  Copyright © 2018 Riyazh Dholakia. All rights reserved.
//

import UIKit

class FindParkingTableViewController: UITableViewController {
    
    let parkingSpaces = [
        "Blue Lot #230",
        "Blue Lot #199",
        "Blue Lot #005",
        "Blue Lot #021",
        "Blue Lot #119",
        "Blue Lot #021",
        "G-Deck #115 (faculty)",
        "G-Deck #180 (faculty)",
        "G-Deck #190 (faculty)",
        "G-Deck #135 (faculty)",
        "G-Deck #160 (faculty)",
        "I-Deck #105 (recital only)",
        "I-Deck #195 (recital only)",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parkingSpaces.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)  -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "A", for: indexPath)
    cell.textLabel?.text = parkingSpaces[indexPath.row]
    return cell
    }
}

