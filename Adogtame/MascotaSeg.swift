//
//  MascotaSeg.swift
//  Adogtame
//
//  Created by Gina Marcela Cruz on 5/17/17.
//  Copyright © 2017 Anita Martínez. All rights reserved.
//

import Foundation


class MascotaSeg{
    
    var nombre: String!
    var descripcion: String!
    var imagen: String!
    var idusuario: String!
    
    init(nombre: String, descripcion: String, imagen: String, idusuario:String) {
        
        self.nombre = nombre
        
        self.descripcion = descripcion
       
        self.imagen = imagen
        
        self.idusuario = idusuario
        
    }
}
