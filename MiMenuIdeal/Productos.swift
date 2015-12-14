//
//  Productos.swift
//  MiMenuIdeal
//
//  Created by Aplimovil on 12/12/15.
//  Copyright © 2015 Aplimovil. All rights reserved.
//

import Foundation

struct Productos {
    
    var id:Int64
    var nombre:String!
    var ingrediente:String!
    
    init(){
        id = 0
        nombre = ""
        ingrediente = ""
       
    }
    
    init(nombre:String, ingrediente:String){
        self.id = 0
        self.nombre = nombre
        self.ingrediente = ingrediente
    }
}