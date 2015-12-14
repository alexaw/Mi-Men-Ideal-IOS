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

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        table.reloadData()
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
    
    
    //MARK: - Datasource TableView
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: ProductosTableViewCell = tableView.dequeueReusableCellWithIdentifier("productos") as! ProductosTableViewCell
        
        let p:Productos = data[indexPath.row]
        
        cell.nom.text = p.nombre
        cell.ing.text = p.ingrediente
     
        
        return cell
    }
    
    //MARK: - CRUD Actions
    
    @IBAction func editProductos(sender:AnyObject){
        
        if(table.indexPathForSelectedRow == nil){
            self.showUnselectedMessage("Editar Producto")
        }else{
            performSegueWithIdentifier("edit", sender: nil)
        }
        
    }
    
    @IBAction func deleteProductoAlert(sender:AnyObject){
        
        if(table.indexPathForSelectedRow == nil){
            self.showUnselectedMessage("Eliminar Producto")
        }else{
            showDeleteProducto()
        }
        
    }

    func showDeleteProducto(){
        
        let p:Productos = data[(table.indexPathForSelectedRow?.row)!]
        
        let alert:UIAlertController = UIAlertController(title: "Eliminar Producto", message: "Desea eliminar el producto \(p.nombre)", preferredStyle: UIAlertControllerStyle.Alert)
        
        let actionOk:UIAlertAction = UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.Default) { (UIAlertAction) -> Void in
            
            self.productosDao.delete(self.data[(self.table.indexPathForSelectedRow?.row)!])
            self.data.removeAtIndex((self.table.indexPathForSelectedRow?.row)!)
            self.table.reloadData()
            
        }
        
        let actionCancel:UIAlertAction = UIAlertAction(title: "Cancelar", style: UIAlertActionStyle.Default, handler: nil)
        
        alert.addAction(actionOk)
        alert.addAction(actionCancel)
        
        presentViewController(alert, animated: true, completion: nil)
        
    }
    
    func showUnselectedMessage(title:String){
        
        let alert:UIAlertController = UIAlertController(title: title, message: "Seleccione un producto", preferredStyle: UIAlertControllerStyle.Alert)
        
        let action:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        
        alert.addAction(action)
        
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    //MARK: Segue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let nextProducto:AddProductoViewController = segue.destinationViewController as! AddProductoViewController
        
        
        if(segue.identifier == "edit"){
            nextProducto.pos = table.indexPathForSelectedRow?.row
        }
        
        nextProducto.list = self
        
        
    }


}
