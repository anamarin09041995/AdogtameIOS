//
//  Fundaciones.swift
//  Adogtame
//
//  Created by Anita Martínez on 4/05/17.
//  Copyright © 2017 Anita Martínez. All rights reserved.
//

import Foundation

class Fundaciones {
    
    var nombre: String!
    var direccion: String!
    var contacto: Int!
    var horario: String!
    var descripcion: String!
    var imagen: String!
    
    init(nombre: String, direccion: String, descripcion: String, horario: String, imagen: String, contacto: Int){
        
        self.nombre = nombre
        self.direccion = direccion
        self.descripcion = descripcion
        self.horario = horario
        self.imagen = imagen
        self.contacto = contacto
        
    }
    
}
