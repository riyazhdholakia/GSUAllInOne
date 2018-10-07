//
//  SecondViewController.swift
//  GSUAllInOne
//
//  Created by Riyazh Dholakia on 10/6/18.
//  Copyright © 2018 Riyazh Dholakia. All rights reserved.
//

import UIKit
import SafariServices
import WebKit

class TicketsViewController: UIViewController {

    @IBOutlet weak var webViewOutlet: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //if let url = URL(string: "google.com") {
        let url = URL(string: "https://fbschedules.com/georgia-state-football-schedule/")
                let request = URLRequest(url: url!)
                self.webViewOutlet.load(request)
        
    }

    @IBAction func onGetMyTicketsTapped(_ sender: Any) {
        if let url = URL(string: "https://georgiastatesports.expapp.com/passes/register/382") {
            let svc = SFSafariViewController(url: url)
            self.present(svc, animated: true, completion: nil)
        }
        
    }
    
}

