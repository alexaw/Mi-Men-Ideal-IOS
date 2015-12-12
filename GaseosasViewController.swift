//
//  GaseosasViewController.swift
//  MiMenuIdeal
//
//  Created by Aplimovil on 12/11/15.
//  Copyright © 2015 Aplimovil. All rights reserved.
//

import UIKit

class GaseosasViewController: UIViewController, UITableViewDataSource {

    var data:[IngreGaseosas]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        data = [IngreGaseosas(nombre: "250 mL")
            ,IngreGaseosas(nombre: "350 mL")
            ,IngreGaseosas(nombre: "Litro 1/4")
            ,IngreGaseosas(nombre: "Litro 1/2")
            ,IngreGaseosas(nombre: "Pony mini")
            ,IngreGaseosas(nombre: "Pony litro")
            ,IngreGaseosas(nombre: "Hit 250 mL")
            ,IngreGaseosas(nombre: "Hit 350 mL")
            
        ]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: GaseosasTableViewCell = tableView.dequeueReusableCellWithIdentifier("gaseosas") as! GaseosasTableViewCell
        
        let pos = indexPath.row
        
        cell.title.text = data[pos].nombre
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
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
