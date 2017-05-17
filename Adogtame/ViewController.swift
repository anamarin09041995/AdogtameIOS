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
        
        let url = ""
        let parameters: Parameters=[
            "username" : user.text!,
            "password" : pass.text!
        ]
        
        Alamofire.request(url, method:.post, parameters: parameters, encoding: JSONEncoding.default).responseJSON {(reponse) in
        
        }
        
        let passw = pass.text!
        let email = user.text!

        
        api1 = UsuariosApi()
        api1.Login(email: email , password: passw){(arrayUsuarios) in
            print(arrayUsuarios)
            
        }
    
        
        
        
        if(email ==  "anamarin@unicauca.edu.co" && passw == "123456"){
            userD.set(email, forKey: "email")
            userD.set(passw, forKey: "passw")
            userD.set(true, forKey: "logged")
            print(userD.string(forKey: "email")!)
            
            performSegue(withIdentifier: "login", sender: nil)
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

