//
//  DonacionesViewController.swift
//  Adogtame
//
//  Created by Anita Martínez on 4/05/17.
//  Copyright © 2017 Anita Martínez. All rights reserved.
//

import UIKit
import SDWebImage

class DonacionesViewController: UIViewController, UITableViewDataSource {

    var data: [Fundaciones] = []
    var api:MascotasApi!
   
    @IBOutlet weak var table: UITableView!
    
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        api = MascotasApi()
        api.ListarFundaciones{(arrayFundaciones) in
            self.data = arrayFundaciones
            print(self.data)
            self.table.reloadData()
            
            
        }
        
        

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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "donacionesCelda") as! DonacionesCell
        let f = data[indexPath.row]
        
        cell.nombre.text = f.nombre
        cell.direccion.text = f.direccion
        cell.contacto.text = "\(f.contacto!)"
        cell.img.sd_setImage(with: URL(string:f.imagen))
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DonacionSegue" {
            
            let selected = table.indexPathForSelectedRow?.row
            let destination = segue.destination as! PaymentViewController
            
            destination.fundacion = data[selected!]
            
            //let registro = segue.destination as! RegistroViewController
        }
        //Se pasan los datos de las variables creadas en el registroViewController para obtener la informacion
    }

    
    
    

}
