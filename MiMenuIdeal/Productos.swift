//
//  Productos.swift
//  MiMenuIdeal
//
//  Created by Aplimovil on 12/12/15.
//  Copyright © 2015 Aplimovil. All rights reserved.
//

import Foundation

struct Productos {
    
    var nombre:String!
    var ingrediente:String!
    
    init(){
        nombre = ""
        ingrediente = ""
       
    }
    
    init(nombre:String, ingrediente:String){
        
        self.nombre = nombre
        self.ingrediente = ingrediente
    }
}