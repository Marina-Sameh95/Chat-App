//
//  ComposeViewController.swift
//  Chat App
//
//  Created by Marina Sameh on 5/26/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ComposeViewController: UIViewController {

    @IBOutlet weak var chatTxt: UITextView!
    var ref: DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addChat(_ sender: Any) {
     presentingViewController?.dismiss(animated: true, completion: nil)
        ref?.child("posts").childByAutoId().setValue(chatTxt.text)
    }
    
    @IBAction func deleteChat(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
