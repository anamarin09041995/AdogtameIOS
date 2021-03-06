//
//  VoluntariadoViewController.swift
//  Adogtame
//
//  Created by Anita Martínez on 4/05/17.
//  Copyright © 2017 Anita Martínez. All rights reserved.
//

import UIKit
import SCLAlertView
import SDWebImage

class VoluntariadoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
var indicador:UIActivityIndicatorView = UIActivityIndicatorView()
    var data: [Fundaciones] = []
    var api:MascotasApi!

    
    @IBOutlet weak var table: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicador.center = self.view.center
        indicador.hidesWhenStopped = true
        indicador.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        view.addSubview(indicador)
        indicador.startAnimating()
        
        api = MascotasApi()
        api.ListarFundaciones{(arrayFundaciones) in
            self.data = arrayFundaciones
            print(self.data)
            self.table.reloadData()
             self.indicador.stopAnimating()
            
        }

        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: -Table Data Source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "voluntariadoCelda") as! VoluntariadoCell
        let f = data[indexPath.row]
        
        cell.nombre.text = f.nombre
        cell.direccion.text = f.direccion
        cell.contacto.text = "\(f.contacto!)"
        cell.descripcion.text = f.descripcion
        cell.img.sd_setImage(with: URL(string:f.imagen))
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let f = data[indexPath.row]
        
        let appearance = SCLAlertView.SCLAppearance(
            kTitleFont: UIFont(name: "HelveticaNeue", size: 18)!,
            kTextFont: UIFont(name: "HelveticaNeue", size: 14)!,
            kButtonFont: UIFont(name: "HelveticaNeue-Bold", size: 14)!,
            showCloseButton: false
        )
        
        let alertView = SCLAlertView(appearance: appearance)
        
        alertView.addButton("Ok") {
            print("Ok")
            self.navigationController?.popViewController(animated: true)
        }
        
        alertView.showTitle("Fundacion \(f.nombre!)", subTitle: "Gracias por ser parte del cambio! Nuestros horarios son \(f.horario!)", style: .notice, colorStyle: 0x08AE9E, colorTextButton: 0xFFFFFF)

    }
    

}
