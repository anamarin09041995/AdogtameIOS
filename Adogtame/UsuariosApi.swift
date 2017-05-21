//
//  UsuariosApi.swift
//  Adogtame
//
//  Created by Gina Marcela Cruz on 5/17/17.
//  Copyright © 2017 Anita Martínez. All rights reserved.
//

import Foundation

import Alamofire

class UsuariosApi{

    var fundaciones: [Fundaciones] = []
    
    
    let url = "https://test1-adogtame.herokuapp.com/"
    
    
    func Login(email:String, password:String ,callback:@escaping (User) ->Void){
        
        let parameters: Parameters=["email": email  , "password": password  ]
            
        Alamofire.request(url+"users/login", method:.post,   parameters: parameters ).responseJSON{(response) in
            
            switch response.result {
            
            case .success:
            let json = response.result.value as! [String: Any]
            let succ = json["success"] as! Bool
            
            if succ {
            
            let user = json["user"] as! [String: Any]
            let id = user["_id"] as! String
            let email = user["email"] as! String
            let city = user["city"] as! String
            let password = user["password"] as! String
            
            let usuario = User(email: email, password: password, city: city, id: id)
               
            callback(usuario)
                }
                
            else {
                
                print("EL USUARIO NO SE ENCUENTRA REGISTRADO")
                }
                
                
                
            case .failure:
                let usuario = User(email: "", password: "", city: "", id: "")
                print("Error, no hay internet")
                callback(usuario)
                
            }
          
        }
        
}

    
    
    
    
    func Verificar(email:String,callback:@escaping (Bool) ->Void){
        var val:Bool = false
        let parameters: Parameters=["email": email   ]
        
        Alamofire.request(url+"users/login", method:.post,   parameters: parameters ).responseJSON{(response) in
       
            print("valor de verificar")
     
            switch response.result {
            
            case .success:
                print("success")
                
                let json = response.result.value as! [String: Any]
                if json["user"] == nil {
                    val = true
                }
                else {
                    val = false
                }
                
            case .failure:
                
                print("error")
                val = false
                
            
            }
            
            callback(val)
            
            }
        
            
        }
    
    
    
    

    
    func Email(){
        
        let email = UserDefaults().object(forKey: "email") as! String
        let parameters: Parameters=["email": email]
        
        Alamofire.request(url+"email", method:.post,   parameters: parameters ).responseJSON{(response) in
            
            print("enviado")
            
        }
        
    }

    
    
    
    
    
    
    func regis(email:String, password:String, city:String, callback:@escaping (Bool) ->Void){
        
        let parameters: Parameters=["email": email  , "password": password, "city":city ]
        
        Alamofire.request(url+"users/signin", method:.post,   parameters: parameters ).responseJSON{(response) in
            
            let json = response.result.value as! [String: Any]
      
            let succ = json["success"] as! Bool
            if !succ {
            
            print ("el usuario ya existe")
                callback (false)
            }
            
            if succ {
            
                print("usuario registrado con exito")
                callback (true)
            
            }
            

            
            
            
            
        }
        
    }

    
    
    
    
}
