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
    @IBOutlet var UserSaved: UILabel!
    
    @IBOutlet var pass: UITextField!
    
    var userD:NSUserDefaults!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userD = NSUserDefaults()
        
        //? valor opcional, puede que no exista
        let data:String? = userD.objectForKey("data") as? String
        UserSaved.text = data

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnLog(sender: AnyObject) {
        
        let username = usr.text
        let password = pass.text
        
//        let query = PFQuery(className:"User")
//        query.whereKey("Nombre", equalTo:usr.text!)
//        query.findObjectsInBackgroundWithBlock {
//            (objects: [PFObject]?, error: NSError?) -> Void in
//            
//            if error == nil {
//                // The find succeeded.
//                print("Successfully retrieved \(objects!.count) scores.")
//                
//                ///dirigir a principal
//                //if objects!.count == 0 no login 
//                //else if ==1 principal
//                
//                // Do something with the found objects
//                if let objects = objects {
//                    for object in objects {
//                        
//                        //s.nombreSemana = object[C_NAME_SEM]
//                        print(object.objectId)
//                        
//                        
//                    }
//                }
//            } else {
//                // Log details of the failure
//                print("Error: \(error!) \(error!.userInfo)")
//            }
//        }
//        
        
        
        
        
        self.userD.setObject(usr.text, forKey: "data")
        
        PFUser.logInWithUsernameInBackground(username!, password:password!) {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                // Yes, User Exists
                
                print("ok")
            } else {
                // No, User Doesn't Exist
               
                print("error")
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
