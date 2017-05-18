//
//  ViewController.swift
//  Adogtame
//
//  Created by Anita Martínez on 3/05/17.
//  Copyright © 2017 Anita Martínez. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var user: UITextField!
    
    @IBOutlet weak var pass: UITextField!
    
    var userD: UserDefaults!
    var api1:UsuariosApi!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userD = UserDefaults()
        
        let email =  userD.object(forKey: "email") as? String
        user.text = email
        let passw = userD.object(forKey: "passw") as? String
        pass.text = passw
        
    }
    
    @IBAction func login(_ sender: Any) {
        

        let passw = pass.text!
        let email = user.text!

        
        api1 = UsuariosApi()
        api1.Login(email: email , password: passw){(Usuario) in
            print(Usuario)
            
            if(email ==  Usuario.email && passw == Usuario.password){
                UserDefaults().set(email, forKey: "email")
                UserDefaults().set(passw, forKey: "passw")
                UserDefaults().set(Usuario.id, forKey: "id")
               print(self.userD.string(forKey: "id") as Any)
                UserDefaults().set(true, forKey: "logged")
                print(self.userD.string(forKey: "email")!)
                
                self.performSegue(withIdentifier: "login", sender: nil)
            }
            else {
            print("No esta el usuario")
            }
    
        }
    
        
        
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "registro" {
            //let registro = segue.destination as! RegistroViewController
        }
        //Se pasan los datos de las variables creadas en el registroViewController para obtener la informacion
    }
    
    @IBAction func goToLogin(_ segue:UIStoryboardSegue){
        
    
    }


}

