//
//  AdogtameDAO.swift
//  Adogtame
//
//  Created by Gina Marcela Cruz on 5/19/17.
//  Copyright © 2017 Anita Martínez. All rights reserved.
//

import Foundation
import SQLite




class AdogtameDao {

    let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
    
    
    var table:Table = Table("seguimiento")
    var id = Expression<Int64>("id")
    var idusuario = Expression<String>("idusuario")
    var nombre = Expression<String>("nombre")
    var descripcion = Expression<String>("descripcion")
    var imagen = Expression<String>("imagen")
    var contacto = Expression<Int64>("contacto")
    var direccion = Expression<String>("direccion")
    var horario = Expression<String>("horario")
    
    var db:Connection!
    
    init() {
        do{
        db = try Connection("\(path)/seguimiento.db")
            let createTable = table.create(block: {(t) in
        
            t.column(idusuario)
            t.column(nombre)
            t.column(descripcion)
            t.column(imagen)
                
            })
           try db.run(createTable)
            
        }catch{}
    
    }

    
    
    func insertar(mascota:MascotaSeg)->Int64 {
    let insertMascotaSegui = table.insert(idusuario <- UserDefaults().object(forKey: "id") as! String , nombre <- mascota.nombre , descripcion <- mascota.descripcion , imagen <- mascota.imagen )
        do{
          return  try db.run(insertMascotaSegui)
            
        }catch{
        
        return -1
        }
    
    }
    
    
    func  getByid(idusuario: String) -> [MascotaSeg]? {
        let filter = table.filter(self.idusuario == idusuario)
        var mascotaSegui:MascotaSeg?
        var data: [MascotaSeg] = []
    
        do{
            for  stm in try db.prepare(filter){
        
                
                
               let idusuario = stm[self.idusuario]
                let nombre = stm[self.nombre]
                let descripcion = stm[self.descripcion]
                let imagen = stm[self.imagen]
                
                mascotaSegui = MascotaSeg(nombre: nombre, descripcion: descripcion, imagen: imagen, idusuario: idusuario)
               
                data.append(mascotaSegui!)
      
            }
            }catch{}
        
        return data
    }
    
    
    
    func all()-> [MascotaSeg]{
    
    var data: [MascotaSeg] = []
        
        let sql = "SELECT * FROM seguimiento"
    
        do{
        
        
            for row in try db.prepare(sql){
                let idusuario = row[0] as! String
                let nombre = row[1] as! String
                let descripcion = row[2] as! String
                let imagen = row[3] as! String
                let m = MascotaSeg(nombre: nombre, descripcion: descripcion, imagen: imagen, idusuario: idusuario)

                data.append(m)
            }
        
        
        }
        catch{}
        
        return data
        
    }
    
    
    
    
    


}
