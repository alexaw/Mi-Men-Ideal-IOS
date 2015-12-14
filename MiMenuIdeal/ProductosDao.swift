//
//  ProductosDao.swift
//  MiMenuIdeal
//
//  Created by Aplimovil on 12/12/15.
//  Copyright © 2015 Aplimovil. All rights reserved.
//

import Foundation
import SQLite

class ProductosDao{
    var db:Connection!
    let table = Table("productos")
    let id = Expression<Int64>("id")
    let nombre = Expression<String>("nombre")
    let ingrediente = Expression<String>("ingrediente")
    
    init(){
        do{
            let path = NSSearchPathForDirectoriesInDomains(
                .DocumentDirectory, .UserDomainMask, true
                ).first!
            
            db = try Connection("\(path)/productos.sqlite3")
            try db!.run(table.create(ifNotExists:true){ t in
                t.column(id, primaryKey: true)
                t.column(nombre)
                t.column(ingrediente)
                })
            
        }catch{
            db = nil
        }
        
    }
    
    func insert(p:Productos)->Int64{
        let insert = table.insert(nombre <- p.nombre, ingrediente <- p.ingrediente)
        
        do{
            return try db.run(insert)
        }catch{
            return -1
        }
    }
    
    func update(p:Productos){
        let filter = table.filter(id == p.id)
        let update = filter.update(nombre <- p.nombre, ingrediente <- p.ingrediente)
        
        do{
            try db.run(update)
        }catch{
        }
        
    }
    
    func delete(p:Productos){
        let filter = table.filter(id == p.id)
        do{
            try db.run(filter.delete())
        }catch{
        }
        
        
    }
    
    func findById(idProducto:Int64)->Productos?{
        let filter = table.filter(id == idProducto)
        let data = db.prepare(filter)
        var row:Row?
        
        
        for r  in data {
            row = r
            break
        }
        
        return rowToProductos(row)
    }
    
    func getAll()->[Productos]{
        return rowsToList(db.prepare(table))
        
    }
    
    func getAllByNombre(nombre:String)->[Productos]{
        
        return statementToList(db.prepare("SELECT * FROM productos WHERE nombre LIKE '%\(nombre)%'",nil))
    }
    
    
    
    private func rowsToList(rows:AnySequence<Row>)->[Productos]{
        var data:[Productos] = [Productos]()
        
        for r in rows{
            data.append(rowToProductos(r)!)
        }
        
        return data
    }
    
    private func rowToProductos(row:Row? )->Productos?{
        if row == nil{ 
            return nil
        }else{
            var p:Productos =  Productos()
            p.id = row![id]
            p.nombre = row![nombre]
            p.ingrediente = row![ingrediente]
            return p
        }
    }
    
    private func statementToList(s:Statement)->[Productos]{
        var data:[Productos] = [Productos]()
        
        for r in s{
            var p:Productos = Productos()
            p.id = r[0] as! Int64
            p.nombre = "\(r[1])"
            p.ingrediente = "\(r[2])"
            
            data.append(p)
        }
        
        return data
        
    }


}
