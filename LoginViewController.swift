//
//  LoginViewController.swift
//  MiMenuIdeal
//
//  Created by Aplimovil on 12/12/15.
//  Copyright © 2015 Aplimovil. All rights reserved.
//

import UIKit
import Parse
import Foundation

class LoginViewController: UIViewController {

    @IBOutlet var usr: UITextField!
    @IBOutlet var pass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnLog(sender: AnyObject) {
        PFUser.logInWithUsernameInBackground(usr.text!, password:pass.text!) {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                // Yes, User Exists
                print("ok")
            } else {
                // No, User Doesn't Exist
            }
        }

    }

    @IBAction func regHere(sender: AnyObject) {
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
