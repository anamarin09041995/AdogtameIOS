//
//  Mascotas.swift
//  Adogtame
//
//  Created by Anita Martínez on 4/05/17.
//  Copyright © 2017 Anita Martínez. All rights reserved.
//

import Foundation

class Mascota{
    
    var nombre: String!
    var raza: String!
    var descripcion: String!
    var fundacion: String!
    var tamanio: String!
    var edad: String!
    var imagen: String!
    var contacto: Int64!
    
    init(nombre: String, raza: String, descripcion: String, fundacion: String, tamanio: String, edad: String, imagen: String, contacto: Int64){
        
        self.nombre = nombre
        self.raza = raza
        self.descripcion = descripcion
        self.fundacion = fundacion
        self.tamanio = tamanio
        self.edad = edad
        self.imagen = imagen
        self.contacto = contacto
        
    }
}
