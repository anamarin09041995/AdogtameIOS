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
    
    @IBOutlet weak var descripcion: UITextView!
    
    @IBOutlet weak var contacto: UILabel!
    
    @IBOutlet weak var fundacion: UILabel!
    
    
    
    var api:UsuariosApi!
    
    var data: [MascotaSeg] = []
    var api1: MascotasApi!
    var val: Bool = false
    


    
    
    /*@IBAction func adoptar(_ sender: Any) {
        let mascota = data[indexPath.row]
        
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
        
        alertView.showTitle("Gracias por adoptar a \(mascota.nombre!)", subTitle: "Gracias por adoptar! Se envió a tu correo un formulario de adopción", style: .notice, colorStyle: 0x08AE9E, colorTextButton: 0xFFFFFF)
    }
    */
    
    
    
    @IBAction func Adoptar(_ sender: Any) {
        
        
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
            self.api = UsuariosApi()
            self.api.Email()
            print("Ok")
            self.navigationController?.popViewController(animated: true)
        }
        
        alertView.showTitle("¡Gracias por adoptar a \(self.mascota.nombre!)!", subTitle: "Se envió a tu correo el formulario de adopción para continuar con el proceso", style: .notice, colorStyle: 0x08AE9E, colorTextButton: 0xFFFFFF)
        
    }
    
    
    @IBAction func Apadrinar(_ sender: Any) {
        
        //func tabBarController(_ tabBarController: UITabBarController,
        //                      shouldSelect viewController: SeguimientoViewController) -> false {}
        
        
        api1 = MascotasApi()
        api1.ListarSeguimiento{(arraymascotas) in
            
            for i in 0 ..< arraymascotas.count {
            
                if arraymascotas[i].nombre == self.mascota.nombre {
                    let appearance = SCLAlertView.SCLAppearance(
                        kTitleFont: UIFont(name: "HelveticaNeue", size: 20)!,
                        kTextFont: UIFont(name: "HelveticaNeue", size: 14)!,
                        kButtonFont: UIFont(name: "HelveticaNeue-Bold", size: 14)!,
                        showCloseButton: false
                    )
                    
                    let alertView = SCLAlertView(appearance: appearance)
                    
                    alertView.addButton("Ok") {
                        print("Ok")
                        self.navigationController?.popViewController(animated: true)
                    }
                    
                    alertView.showTitle("Ya apadrinaste a \(self.mascota.nombre!)", subTitle: "Puedes ver tus perritos apadrinados en la pestaña de seguimiento", style: .notice, colorStyle: 0x08AE9E, colorTextButton: 0xFFFFFF)
                    print("ya esta apadrinado")
                    self.val = true
                    
                }
                
                

            }
            
            
            if !self.val {
                
                //let storyBoard : UIStoryboard = UIStoryboard(name: "Catalogo", bundle:nil)
                
                //let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Seguimiento") as! SeguimientoViewController
                
                //self.present(nextViewController, animated:true, completion:nil)
                
                let appearance = SCLAlertView.SCLAppearance(
                    kTitleFont: UIFont(name: "HelveticaNeue", size: 14)!,
                    kTextFont: UIFont(name: "HelveticaNeue", size: 12)!,
                    kButtonFont: UIFont(name: "HelveticaNeue-Bold", size: 14)!,
                    showCloseButton: false
                )
                
                let alertView = SCLAlertView(appearance: appearance)
                
                alertView.addButton("Ok") {
                    print("Ok")
                    self.navigationController?.popViewController(animated: true)
                }
                
                alertView.showTitle("Gracias por apadrinar a \(self.mascota.nombre!)", subTitle: "Puedes ver tus perritos apadrinados en la pestaña de seguimiento", style: .notice, colorStyle: 0x08AE9E, colorTextButton: 0xFFFFFF)
                
                print("HOLAAA")
                self.api1.AddApadrinados(nombre: self.mascota.nombre,imagen: self.mascota.imagen, descripcion: self.mascota.descripcion)
            }
            
        }
        
            }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nombre.text = mascota.nombre
        contacto.text = "\(mascota.contacto!)"
        fundacion.text = mascota.fundacion
        img.sd_setImage(with: URL(string:mascota.imagen))
        descripcion.text = mascota.descripcion
        
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
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
