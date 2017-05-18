//
//  User.swift
//  Adogtame
//
//  Created by Gina Marcela Cruz on 5/17/17.
//  Copyright © 2017 Anita Martínez. All rights reserved.
//

import Foundation

class User {
    
    var email: String!
    var password: String!
    var city: String!
    var id: String!
    
    init(email: String, password: String, city: String, id: String ){
        
        self.email = email
        self.password = password
        self.city = city
        self.id = id
      
        
    }
 
}
