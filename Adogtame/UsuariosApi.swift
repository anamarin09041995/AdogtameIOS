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
            
            let json = response.result.value as! [String: Any]
            let user = json["user"] as! [String: Any]
            let id = user["_id"] as! String
            let email = user["email"] as! String
            let city = user["city"] as! String
            let password = user["password"] as! String
            
            let usuario = User(email: email, password: password, city: city, id: id)

            callback(usuario)
            
            
          
        }
        
}

    
    

    
    func Email(callback:@escaping (User) ->Void){
        
        let parameters: Parameters=["email": UserDefaults().object(forKey: "email") as Any]
        
        Alamofire.request(url+"email", method:.post,   parameters: parameters ).responseJSON{(response) in
            
            
        }
        
    }

    
    
    
    
    
    
}
