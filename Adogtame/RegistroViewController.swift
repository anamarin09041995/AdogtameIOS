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

    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var pass: UITextField!
    
    @IBOutlet weak var city: UITextField!
    
    //Se crean variables para guardar datos del registro
    var info: String!
    
    @IBAction func registro(_ sender: Any) {
        let password = email.text!
        let username = pass.text!
        let ciudad = city.text!
        
        if(username != "" && password != "" && ciudad != ""){
            performSegue(withIdentifier: "catalogo", sender: nil)
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
