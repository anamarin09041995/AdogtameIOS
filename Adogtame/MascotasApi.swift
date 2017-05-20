//
//  Mascotas.swift
//  Adogtame
//
//  Created by Gina Marcela Cruz on 5/13/17.
//  Copyright © 2017 Anita Martínez. All rights reserved.
//

import Foundation
import Alamofire

class MascotasApi{
    
     var data: [Mascota] = []
     var segui: [MascotaSeg] = []
     var fundaciones: [Fundaciones] = []

    
    var json = [NSDictionary]()
    var dao: AdogtameDao!
   
    
    
    let url = "https://test1-adogtame.herokuapp.com/"
    
    
    func ListarMascotas(callback:@escaping (Array<Mascota>) ->Void){
        Alamofire.request(url+"mascotas", method:.get).responseJSON{(response) in
    
            switch response.result {
            
                case .success:
                
            self.json = response.result.value as! [NSDictionary]
            
            print(self.json.count)
            
            for i in 0 ..< self.json.count{
                let mascotasArray = self.json[i] 
                let nombre = mascotasArray["nombre"] as? String
                let imagen = mascotasArray["imagen"] as? String
                let descripcion = mascotasArray["descripcion"] as? String
                let raza = mascotasArray["raza"] as? String
                let contacto = mascotasArray["contacto"] as? Int64
                let edad = mascotasArray["edad"] as? String
                let tamanio = mascotasArray["tamanio"] as? String
                let fundacion = mascotasArray["fundacion"] as? String
                
                let mascota_obj = Mascota(nombre: nombre!, raza: raza!, descripcion:descripcion!, fundacion :fundacion!, tamanio: tamanio! ,edad: edad!, imagen: imagen! ,contacto: contacto!  )

           
                self.data.append(mascota_obj)
                
            }
            
            print(self.data[2].fundacion)
            callback (self.data)
                
              
             case .failure:
                
                callback(self.data)
                
            }
            
        }

        
    }
    
    
    
    func ListarFundaciones(callback:@escaping (Array<Fundaciones>) ->Void){
        Alamofire.request(url+"fundaciones", method:.get).responseJSON{(response) in
            
            switch response.result {
                case .success:
            
            self.json = response.result.value as! [NSDictionary]
            
            print(self.json.count)
            
            for i in 0 ..< self.json.count{
                let mascotasArray = self.json[i]
                
                let nombre = mascotasArray["nombre"] as? String
                let direccion = mascotasArray["direccion"] as? String
                let contacto = mascotasArray["telefono"] as? Int64
                let descripcion = mascotasArray["descripcion"] as? String
                let imagen = mascotasArray["imagen"] as? String
                let horario = mascotasArray["horario"] as? String
                
                let fundacion_obj = Fundaciones(nombre: nombre!, direccion: direccion!, descripcion: descripcion!, horario: horario!, imagen: imagen!, contacto: contacto!)
                
                
                
                self.fundaciones.append(fundacion_obj)
                
            }
            

                callback (self.fundaciones)
                
                
                case .failure:
                
                print("error al cargar")
                callback(self.fundaciones)
        
            }
            
            
            
            }
        
        
    }
    
   
    
    
    func ListarSeguimiento(callback:@escaping (Array<MascotaSeg>) ->Void){
   
        dao = AdogtameDao()
        let seguimiento: String = UserDefaults().object(forKey: "id") as! String
        
    
        
        Alamofire.request(url+"seguimiento/"+seguimiento, method:.get ).responseJSON{(response) in
            
            switch response.result {
            
                case .success:
            
           self.json =  response.result.value as! [NSDictionary]
            
            
            print(self.json.count)
            
            for i in 0 ..< self.json.count{
                let mascotasArray = self.json[i]
                let nombre = mascotasArray["nombre"] as? String
                let imagen = mascotasArray["imagen"] as? String
                let descripcion = mascotasArray["descripcion"] as? String
                
                let mascota_obj = MascotaSeg(nombre: nombre!, descripcion:descripcion!,  imagen: imagen! , idusuario: UserDefaults().object(forKey: "id") as! String )
                 let idusu = UserDefaults().object(forKey: "id") as! String
                
                for k in 0 ..< self.dao.getByid(idusuario: idusu )!.count{
                
                    if self.dao.getByid(idusuario: idusu)![k].nombre != nombre && self.dao.getByid(idusuario: idusu)![k].idusuario != idusu{
                        print("inserto sqlite")
                        self.dao.insertar(mascota: mascota_obj)
                    }
                }
                
                if self.dao.getByid(idusuario: idusu)!.count == 0 {
                    print("inserto en sqlite")
                    print(mascota_obj.nombre)
                    self.dao.insertar(mascota: mascota_obj)
                }

    
                
                self.segui.append(mascota_obj)
    
            }
            
            
            callback (self.segui)
                
                
                case .failure:
                    let idusu = UserDefaults().object(forKey: "id") as! String
                    print("sqlite")
                    print(self.dao.getByid(idusuario: idusu)!.count)
                    self.segui = self.dao.getByid(idusuario: idusu)!
                callback(self.segui)
        
            }
            
            }
        
           }
    


    
    
    
    func AddApadrinados(nombre: String, imagen: String, descripcion: String){
        
        let email = UserDefaults().object(forKey: "email") as! String
        let id = UserDefaults().object(forKey: "id") as! String

        let usuario = ["id": id , "email":email]
    
        let parameters: Parameters=["nombre":nombre,"imagen":imagen,"descripcion":descripcion, "usuario":usuario]
    
        Alamofire.request(url+"seguimiento", method: .post,   parameters: parameters , encoding: JSONEncoding.default ).responseJSON{(response) in
    
            
        }
        
    }

    
    
    
    
    
    
}
