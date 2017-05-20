//
//  RegistroViewController.swift
//  Adogtame
//
//  Created by Anita Martínez on 3/05/17.
//  Copyright © 2017 Anita Martínez. All rights reserved.
//

import UIKit
import SDWebImage

class RegistroViewController: UIViewController {
    var indicador:UIActivityIndicatorView = UIActivityIndicatorView()
    var api1:UsuariosApi!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var pass: UITextField!
    
    @IBOutlet weak var city: UITextField!

    
    //Se crean variables para guardar datos del registro
    var info: String!
    
       @IBAction func registro(_ sender: Any) {
        
        indicador.center = self.view.center
        indicador.hidesWhenStopped = true
        indicador.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        view.addSubview(indicador)
        indicador.startAnimating()
        
        
        let email = self.email.text!
        let password = pass.text!
        let city = self.city.text!
        
        
        api1 = UsuariosApi()
        api1.Verificar(email: email ){(val) in
            if val {
            
            self.api1.regis(email: email, password: password, city: city)
    
            
                self.api1.Login(email: email , password: password){(Usuario) in
                    print(Usuario)
                    
                    if(email ==  Usuario.email && password == Usuario.password){
                        UserDefaults().set(email, forKey: "email")
                        UserDefaults().set(password, forKey: "passw")
                        UserDefaults().set(Usuario.id, forKey: "id")
                        UserDefaults().set(true, forKey: "logged")
                        UserDefaults().set(Usuario.city, forKey: "city")
                        
                        self.performSegue(withIdentifier: "catalogo", sender: nil)
                    }
                    else {
                        print("No esta el usuario")
                    }
                    
                }

            
            }

    
            else {
            
            print("USUARIO YA REGISTRADO ")
                //AQUI VAAAAA ALERTAAAAAAAAAAAAA
                
            }
         self.indicador.stopAnimating()
        }
        
    }
        
        
    
        
      
        

    override func viewDidLoad() {
        super.viewDidLoad()
        email.text = info

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
