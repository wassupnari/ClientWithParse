//
//  ViewController.swift
//  ClientWithParse
//
//  Created by Nari Shin on 10/27/16.
//  Copyright © 2016 Nari Shin. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onEmailChanged(_ sender: AnyObject) {
        print("email : \(emailTextField.text)")
    }
    

    @IBAction func onSignupClicked(_ sender: AnyObject) {
        print("signup clicked, \(emailTextField.text)")
        callSignUp(userEmail: emailTextField.text!, password: pwTextField.text!)
    }
    
    func callSignUp(userEmail: String, password: String) {
        var user = PFUser()
        user.username = "Nari1"
        user.password = password
        user.email = userEmail
        // other fields can be set just like with PFObject
        //user["phone"] = "415-392-0202"
        
        user.signUpInBackground {
            (succeeded: Bool, error: Error?) -> Void in
            if let error = error {
                //let errorString = error.userInfo["error"] as? String
                // Show the errorString somewhere and let the user try again.
            } else {
                // Hooray! Let them use the app now.
            }
        }
    }
    
    func callSignIn(userEmail: String, password: String) {
        
    }

}

