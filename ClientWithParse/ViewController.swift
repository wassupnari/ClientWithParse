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
        
        var currentUser = PFUser.current()
        if currentUser != nil {
            // Do stuff with the user
        } else {
            // Show the signup or login screen
        }
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
    
    @IBAction func onSigninClicked(_ sender: AnyObject) {
        callSignIn(userEmail: emailTextField.text!, password: pwTextField.text!)
    }
    
    
    func callSignUp(userEmail: String, password: String) {
        var user = PFUser()
        user.username = "Nari2"
        user.password = password
        user.email = userEmail
        // other fields can be set just like with PFObject
        //user["phone"] = "415-392-0202"
        
        user.signUpInBackground {
            (succeeded: Bool, error: Error?) -> Void in
            var alertController: UIAlertController
            if let error = error {
                let errorString = error.localizedDescription
                alertController = UIAlertController(title: "Error", message: "There was an error while trying to sign up with Parse: " + errorString, preferredStyle: UIAlertControllerStyle.alert)
            } else {
                // Hooray! Let them use the app now.
                alertController = UIAlertController(title: "Sign Up", message: "Signed up successfully!", preferredStyle: UIAlertControllerStyle.alert)
                
            }
        }
    }
    
    func callSignIn(userEmail: String, password: String) {
        
        PFUser.logInWithUsername(inBackground: userEmail, password: password) { (user: PFUser?, error: Error?) in
            var alertController: UIAlertController
            if let error = error {
                let errorString = error.localizedDescription
                alertController = UIAlertController(title: "Error", message: "There was an error while trying to log in with Parse: " + errorString, preferredStyle: UIAlertControllerStyle.alert)
            } else {
                alertController = UIAlertController(title: "Log In", message: "Logged In successfully!", preferredStyle: UIAlertControllerStyle.alert)
                //loggedIn = true
            }
            self.present(alertController, animated: true, completion: nil)
            let OKAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
            alertController.addAction(OKAction)
        }
    }
    
    func showChatModal() {
        //let chatViewController = chatViewController()
        //chatViewController.
    }

}

