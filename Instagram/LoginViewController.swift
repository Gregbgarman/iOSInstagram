//
//  LoginViewController.swift
//  Instagram
//
//  Created by Greg Garman on 10/2/21.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var TFUsername: UITextField!
    
    
    @IBOutlet weak var TFPassword: UITextField!
    
    
    @IBAction func btnSignIn(_ sender: Any) {
        let Username=TFUsername.text!
        let Password=TFPassword.text!
        
        PFUser.logInWithUsername(inBackground: Username, password: Password) { user, error in
            if user != nil{
                self.performSegue(withIdentifier: "LoginSegue", sender: nil)
            }
            else{
                print("Error signing in")
            }
        }
        
    }
    
    
    @IBAction func btnSignUp(_ sender: Any) {
        let user=PFUser()
        user.username=TFUsername.text
        user.password=TFPassword.text
        user.signUpInBackground { success, Error in
            if success{
                self.performSegue(withIdentifier: "LoginSegue", sender: nil)
            }
            else{
                print("Error signing up")
            }
            
        }
        
        
    }
    
    

}
