//
//  CopaHeladoViewController.swift
//  MiMenuIdeal
//
//  Created by Aplimovil on 12/11/15.
//  Copyright © 2015 Aplimovil. All rights reserved.
//

import UIKit

class CopaHeladoViewController: UIViewController, UITableViewDataSource {

    var data:[IngreCopaHelado]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        data = [IngreCopaHelado(nombre: "Helado")
            ,IngreCopaHelado(nombre: "Queso")
            ,IngreCopaHelado(nombre: "Masmelos")
            ,IngreCopaHelado(nombre: "Chantilli")
            ,IngreCopaHelado(nombre: "Galleta")
            ,IngreCopaHelado(nombre: "Grajeas")
            ,IngreCopaHelado(nombre: "Glaciados")
            
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
        
        let cell: CopaHeladoTableViewCell = tableView.dequeueReusableCellWithIdentifier("copahelado") as! CopaHeladoTableViewCell
        
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
