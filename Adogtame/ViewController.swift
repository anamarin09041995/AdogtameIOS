//
//  ViewController.swift
//  Adogtame
//
//  Created by Anita Martínez on 3/05/17.
//  Copyright © 2017 Anita Martínez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var user: UITextField!
    
    @IBOutlet weak var pass: UITextField!
    
    var userD: UserDefaults!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //btnRegi.layer.cornerRadius = 10
        userD = UserDefaults()
        
        let username =  userD.object(forKey: "username") as? String
        user.text = username
        let password = userD.object(forKey: "password") as? String
        pass.text = password
        
    }
    
    @IBAction func login(_ sender: Any) {
        let password = pass.text!
        let username = user.text!
        
        if(username ==  "anamarin@unicauca.edu.co" && password == "123456"){
            userD.set(username, forKey: "username")
            userD.set(password, forKey: "password")
            userD.set(true, forKey: "logged")
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

