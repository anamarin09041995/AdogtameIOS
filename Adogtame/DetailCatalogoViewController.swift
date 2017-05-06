//
//  DetailCatalogoViewController.swift
//  Adogtame
//
//  Created by Anita Martínez on 4/05/17.
//  Copyright © 2017 Anita Martínez. All rights reserved.
//

import UIKit
import SCLAlertView
import SDWebImage

class DetailCatalogoViewController: UIViewController {

    
    var mascota: Mascota!
    
    
    @IBOutlet weak var nombre: UILabel!
    
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var descripcion: UILabel!
    
    @IBOutlet weak var contacto: UILabel!
    
    @IBOutlet weak var fundacion: UILabel!
    
    
    @IBAction func adoptar(_ sender: Any) {
        //let mascota = data[indexPath.row]
        
        let appearance = SCLAlertView.SCLAppearance(
            kTitleFont: UIFont(name: "HelveticaNeue", size: 20)!,
            kTextFont: UIFont(name: "HelveticaNeue", size: 14)!,
            kButtonFont: UIFont(name: "HelveticaNeue-Bold", size: 14)!,
            showCloseButton: false
        )

        let alertView = SCLAlertView(appearance: appearance)
        
        alertView.addButton("Cancelar"){
            print("Cancelar")
        }
        alertView.addButton("Ok") {
            print("Ok")
            self.navigationController?.popViewController(animated: true)
        }
        
        alertView.showTitle(mascota.nombre, subTitle: "Gracias por adoptar! Se envió a tu correo un formulario de adopción", style: .notice, colorStyle: 0x08AE9E, colorTextButton: 0xFFFFFF)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nombre.text = mascota.nombre
        descripcion.text = mascota.descripcion
        contacto.text = "\(mascota.contacto)"
        fundacion.text = mascota.fundacion
        
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
