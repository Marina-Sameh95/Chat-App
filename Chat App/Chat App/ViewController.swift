//
//  ViewController.swift
//  Chat App
//
//  Created by Marina Sameh on 5/26/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var ref: DatabaseReference?
    var postData = [String]()
    var databaseHandel: DatabaseHandle?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        ref = Database.database().reference()
        
       databaseHandel = ref?.child("posts").observe(.childAdded, with: {(snapshot) in
        let post = snapshot.value as? String
        if let actualPost = post{
            
            self.postData.append(actualPost)
            self.tableView.reloadData()
        }
        })
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = postData[indexPath.row]
        return cell!
    }
}

