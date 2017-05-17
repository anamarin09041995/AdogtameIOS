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
    
    var data: [User] = []
    var fundaciones: [Fundaciones] = []
    
    
    var json = [NSDictionary]()
    
    
    
    let url = "https://test1-adogtame.herokuapp.com/"
    
    
    func Login(email:String, password:String ,callback:@escaping (Array<User>) ->Void){
        
        let parameters = "{\"email\": \""+email+"\"  , \"password\": \""+password+"\"}"
            
        Alamofire.request(url+"users/login", method: .post,   parameters: parameters, encoding: JSONEncoding.default).responseJSON{(response) in
            
            self.json = response.result.value as! [NSDictionary]
            
            print(self.json.count)
            
            for i in 0 ..< self.json.count{
                let userArray = self.json[i]
                
                let email = userArray["email"] as? String
                let password = userArray["password"] as? String
                let id = userArray["_id"] as? String
                let city = userArray["city"] as? String
                
                let user = User(email :email!, password: password!, city :city!, id: id! )
                
                
                self.data.append(user)
                
            }
            
            print(self.data[0].id)
            callback (self.data)
        }
        
        
}

}
