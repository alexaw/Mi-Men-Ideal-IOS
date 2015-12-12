//
//  RegisterViewController.swift
//  MiMenuIdeal
//
//  Created by Aplimovil on 12/10/15.
//  Copyright © 2015 Aplimovil. All rights reserved.
//

import UIKit
import Parse

class RegisterViewController: UIViewController {

    @IBOutlet var name: UITextField!
    @IBOutlet var lastname: UITextField!
    @IBOutlet var ident: UITextField!
    @IBOutlet var userLog: UITextField!
    @IBOutlet var passLog: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnReg(sender: AnyObject) {
        
        
        let n = name.text
        let ln = lastname.text
        let id = ident.text
        let usr = userLog.text
        let pass = passLog.text
        
        if n != "" && ln != "" && id != "" && usr != "" && pass != "" {
            // If not empty then yay, do something
            userSingUp()
            
        } else {
            print("Error")
            
        }
        
        
    }
    
    func userSingUp(){
        
        
        let user = PFUser()
        
        user["Name"] = name.text
        user["Lastname"] = lastname.text
        user["Ident"] = ident.text
        user.username = userLog.text
        user.password = passLog.text
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            if let error = error {
                let errorString = error.userInfo["error"] as? NSString
                // Show the errorString somewhere and let the user try again.
                
                print(errorString)
            } else {
                // Hooray! Let them use the app now.
            }
        }
        
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
