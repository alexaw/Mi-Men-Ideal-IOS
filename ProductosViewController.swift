//
//  ProductosViewController.swift
//  MiMenuIdeal
//
//  Created by Aplimovil on 12/12/15.
//  Copyright © 2015 Aplimovil. All rights reserved.
//

import UIKit

class ProductosViewController: UIViewController, UITableViewDataSource{
    
    var data:[Productos] = [Productos]()
    var productosDao:ProductosDao!
    @IBOutlet var table:UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productosDao = ProductosDao()
        
        data = productosDao.getAll()
        
        //data = [Productos(nombre: "Pizza", ingrediente: "Jamon")
         //   ,Productos(nombre: "Taco", ingrediente: "Queso")]

        // Do any additional setup after loading the view.
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: ProductosTableViewCell = tableView.dequeueReusableCellWithIdentifier("productos") as! ProductosTableViewCell
        
        let pos = indexPath.row
        
        cell.nom.text = data[pos].nombre
        cell.ing.text = data[pos].ingrediente
     
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    @IBAction func editPlaneta(sender:AnyObject){
        
        if(table.indexPathForSelectedRow == nil){
            self.showUnselectedMessage("Editar Planeta")
        }else{
            performSegueWithIdentifier("edit", sender: nil)
        }
        
    }
    
    @IBAction func deletePlanetaAlert(sender:AnyObject){
        
        if(table.indexPathForSelectedRow == nil){
            self.showUnselectedMessage("Eliminar Planeta")
        }else{
            showDeletePlaneta()
        }
        
    }

}
