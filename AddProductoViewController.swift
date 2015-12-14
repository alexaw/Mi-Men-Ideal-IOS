//
//  AddProductoViewController.swift
//  MiMenuIdeal
//
//  Created by Aplimovil on 12/12/15.
//  Copyright © 2015 Aplimovil. All rights reserved.
//

import UIKit

class AddProductoViewController: UIViewController {
    
    var list:ProductosViewController!
    var pos:Int?
    var productosDao:ProductosDao!

    @IBOutlet var nombre: UITextField!
    @IBOutlet var ingrediente: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if(pos != nil){
            self.title = "Editar"
            nombre.text = list.data[pos!].nombre
            ingrediente.text = list.data[pos!].ingrediente
        }
        productosDao = ProductosDao()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func saveProducto(sender:AnyObject){
        
        if(pos != nil){
            list.data[pos!].ingrediente = ingrediente.text!
            list.data[pos!].nombre = nombre.text!
            
            productosDao.update(list.data[pos!])
            
        }else{
            var p:Productos = Productos()
            p.nombre = nombre.text!
            p.ingrediente = ingrediente.text!
            
            
            list.data.append(p)
            productosDao.insert(p)
        }
        
        self.navigationController?.popToViewController(list, animated: true)
        
    }


}
