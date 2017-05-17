//
//  PaymentViewController.swift
//  Adogtame
//
//  Created by Gina Marcela Cruz on 5/11/17.
//  Copyright © 2017 Anita Martínez. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController {

    @IBOutlet weak var nombre: UILabel!
    var fundacion: Fundaciones!
    var pressed: String = ""
    var value : Int64 = 0
    @IBOutlet weak var imagenfundacion: UIImageView!
    
    
    var checkbox = UIImage (named: "Checked.png")
    var unchecked = UIImage (named: "Unchecked.png")
    var bolsapressed = UIImage (named: "bagPressed.png")
    var bolsa = UIImage (named: "Money Bag Filled-50.png")
    var isClicked :Bool!
    var isClicked1 :Bool!

    var bolsa1 :Bool!
    var bolsa2 :Bool!
    var bolsa3 :Bool!
    var bolsa5 :Bool!
    
    
    
    
    @IBOutlet weak var bolsa10: UIButton!
    @IBOutlet weak var bolsa20: UIButton!
    @IBOutlet weak var bolso30: UIButton!
    @IBOutlet weak var bolso50: UIButton!
    

    
    
    
    
    
    @IBAction func Abolsa50(_ sender: Any) {
        
        if bolsa5 {
            bolsa5 = false
            
        }
        else {
            
            bolsa5 = true
            
        }
        
        
        if bolsa5 {
            
            bolso50.setImage(bolsapressed, for: UIControlState.normal)
            pressed = ""
            value = 50000
            
            print(value)
            print(pressed)

            
            
            
           
        }
        else {
            
            bolso50.setImage(bolsapressed, for: UIControlState.normal)
            
            bolsa20.setImage(bolsa, for: UIControlState.normal)
            bolsa10.setImage(bolsa, for: UIControlState.normal)
            bolso50.setImage(bolsa, for: UIControlState.normal)

                        value = 0
        }
        
    }
    
    
    
    
    @IBAction func Abolsa30(_ sender: Any) {
        
        if bolsa3 {
            bolsa3 = false
            
        }
        else {
            
            bolsa3 = true
            
        }
        
        
        if bolsa3 {
            bolso30.setImage(bolsapressed, for: UIControlState.normal)
            
            bolsa20.setImage(bolsa, for: UIControlState.normal)
            bolsa10.setImage(bolsa, for: UIControlState.normal)
            bolso50.setImage(bolsa, for: UIControlState.normal)
            
            value = 30000
            
            print(value)
        }
        else {
            bolso30.setImage(bolsa, for: UIControlState.normal)
            value = 0
            pressed = ""
            print(pressed)
        }
        
    }
    
    
    
    
    @IBAction func Abolsa20(_ sender: Any) {
        
        if bolsa2 {
            bolsa2 = false
            
        }
        else {
            
            bolsa2 = true
            
        }
        
        
        if bolsa2 {
            bolsa20.setImage(bolsapressed, for: UIControlState.normal)
            
            bolsa10.setImage(bolsa, for: UIControlState.normal)
            bolso30.setImage(bolsa, for: UIControlState.normal)
            bolso50.setImage(bolsa, for: UIControlState.normal)
            
            value = 20000
            
            print(value)
        }
            
        else {
            bolsa20.setImage(bolsa, for: UIControlState.normal)
            value = 0
            pressed = ""
            print(pressed)
        }
        
        
        
        
    }
    @IBAction func Abolsa10(_ sender: Any) {
    
        if bolsa1 {
            bolsa1 = false
            
        }
        else {
            
            bolsa1 = true
            
        }
        
        
        if bolsa1 {
            bolsa10.setImage(bolsapressed, for: UIControlState.normal)
            
            bolsa20.setImage(bolsa, for: UIControlState.normal)
            bolso30.setImage(bolsa, for: UIControlState.normal)
            bolso50.setImage(bolsa, for: UIControlState.normal)
            
            value = 10000
            
            print(value)
        }
        else {
            value = 0
            bolsa10.setImage(bolsa, for: UIControlState.normal)
            pressed = ""
            print(pressed)
        }
        
    }
    
    
    
    
    
    
    
    
    
    

    
    
    
    
    @IBAction func AlimentoButton(_ sender: UIButton) {
        
        if isClicked {
        isClicked = false
            
        }
        else {
            
        isClicked = true
            
        }
        
        
        if isClicked {
        Alimento1.setImage(checkbox, for: UIControlState.normal)
        implementos.setImage(unchecked, for: UIControlState.normal)
            pressed = "Alimento"
            print(pressed)
        }
        else {
        Alimento1.setImage(unchecked, for: UIControlState.normal)
            pressed = ""
            print(pressed)
        }
        
        
        
        
    }


    
    override func viewDidLoad() {
        super.viewDidLoad()
        nombre.text = "!Vas a donar a la fundacion "+fundacion.nombre+"!"
        imagenfundacion.sd_setImage(with: URL(string:fundacion.imagen))
        isClicked = false
        isClicked1 = false
        
        bolsa1 = false
        bolsa2 = false
        bolsa3 = false
        bolsa5 = false
        
        print(pressed)
    
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBOutlet weak var Alimento1: UIButton!
    
    @IBOutlet weak var implementos: UIButton!
    
    
    @IBAction func implementos1(_ sender: UIButton) {
    
        if isClicked1 {
            isClicked1 = false
            
        }
        else {
            
            isClicked1 = true
            
        }
        
        
        if isClicked1 {
            implementos.setImage(checkbox, for: UIControlState.normal)
            Alimento1.setImage(unchecked, for: UIControlState.normal)
            pressed = "implementos"
            
            print(pressed)
        }
        else {
            implementos.setImage(unchecked, for: UIControlState.normal)
            pressed = ""
            print(pressed)
        }
        

    
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
