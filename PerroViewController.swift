//
//  PerroViewController.swift
//  MiMenuIdeal
//
//  Created by Aplimovil on 12/11/15.
//  Copyright © 2015 Aplimovil. All rights reserved.
//

import UIKit

class PerroViewController: UIViewController, UITableViewDataSource {

    var data:[IngrePerro]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        data = [IngrePerro(nombre: "Pan")
                ,IngrePerro(nombre: "Salchicha")
                ,IngrePerro(nombre: "Ripio")
            ,IngrePerro(nombre: "Pollo")
            ,IngrePerro(nombre: "Jamon")
            ,IngrePerro(nombre: "Queso")
            ,IngrePerro(nombre: "Cebolla")
            ,IngrePerro(nombre: "Salsa de Tomate")
            ,IngrePerro(nombre: "Salsa de Ajo")
            ,IngrePerro(nombre: "Mayonesa")
            ,IngrePerro(nombre: "Mostaza")
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
        
       /* var cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("hotdog")
        
        if cell == nil{
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "hotdog")
        }
        
        cell?.textLabel?.text = "Hola" */
        
        let cell: PerroTableViewCell = tableView.dequeueReusableCellWithIdentifier("hotdog") as! PerroTableViewCell
        
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
