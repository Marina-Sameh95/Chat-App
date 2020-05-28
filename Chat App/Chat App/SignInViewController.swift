//
//  SignInViewController.swift
//  Chat App
//
//  Created by Marina Sameh on 5/27/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController {

    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    @IBOutlet weak var signIn: UIButton!
    @IBOutlet weak var switchSign: UISegmentedControl!
    
    var isSignIn : Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view.
    }
    
    @IBAction func switchView(_ sender: UISegmentedControl) {
        isSignIn = !isSignIn
        
        if isSignIn{
            signIn.setTitle("Sign In", for: .normal)
        } else {
            signIn.setTitle("Sign Up", for: .normal)
        }
    }
    
    
    @IBAction func signInBtn(_ sender: UIButton) {
        if let eml = emailTxt.text , let pass = passTxt.text {
            
            if isSignIn {
                Auth.auth().signIn(withEmail: eml, password: pass, completion: {(user , error) in
                    if user != nil {
                        self.performSegue(withIdentifier: "gocompose", sender: self)
                    } else{
                        
                    }
                })
                
            }
         else {
            Auth.auth().createUser(withEmail: eml, password: pass, completion: {(user , error) in
                if user != nil {
                    self.performSegue(withIdentifier: "gocompose", sender: self)
                } else{
                    
                }
            })
        }
    }
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
