//
//  BananaSplitViewController.swift
//  MiMenuIdeal
//
//  Created by Aplimovil on 12/11/15.
//  Copyright © 2015 Aplimovil. All rights reserved.
//

import UIKit

class BananaSplitViewController: UIViewController, UITableViewDataSource {

    var data:[IngreBananaSplit]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        data = [IngreBananaSplit(nombre: "Banano")
            ,IngreBananaSplit(nombre: "Chantilli")
            ,IngreBananaSplit(nombre: "Pasas")
            ,IngreBananaSplit(nombre: "Helado")
            ,IngreBananaSplit(nombre: "Maní")
            ,IngreBananaSplit(nombre: "Chips de Chocolate")
            ,IngreBananaSplit(nombre: "Galleta")
            ,IngreBananaSplit(nombre: "Cerezas")
            ,IngreBananaSplit(nombre: "Glaciados")
            
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
        
        let cell: BananaSplitTableViewCell = tableView.dequeueReusableCellWithIdentifier("bananasplit") as! BananaSplitTableViewCell
        
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
