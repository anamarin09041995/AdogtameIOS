//
//  CatalogoViewController.swift
//  Adogtame
//
//  Created by Anita Martínez on 4/05/17.
//  Copyright © 2017 Anita Martínez. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage


class CatalogoViewController: UIViewController, UITableViewDataSource {
     var indicador:UIActivityIndicatorView = UIActivityIndicatorView()
    
    var data1 = [NSMutableDictionary]()
    
    var data: [Mascota] = []
    
    @IBOutlet var table: UITableView!
    
    var api:MascotasApi!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicador.center = self.view.center
        indicador.hidesWhenStopped = true
        indicador.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        view.addSubview(indicador)
        indicador.startAnimating()
        api = MascotasApi()
        api.ListarMascotas{(arrayMascota) in
            self.data = arrayMascota
            print(self.data)
            self.table.reloadData()
            self.indicador.stopAnimating()
        
        }
  
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
    
    // MARK: - Table Data Source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "catalogoCelda") as! CatalogoCell
        let m = data[indexPath.row]
        
        cell.nombre.text = m.nombre
        cell.tamanio.text = m.tamanio
        cell.raza.text = m.raza
        cell.edad.text = m.edad
        cell.img.sd_setImage(with: URL(string:m.imagen))

        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailCatalogo" {
            
            let selected = table.indexPathForSelectedRow?.row
            let destination = segue.destination as! DetailCatalogoViewController
            
            destination.mascota = data[selected!]
            
            //let registro = segue.destination as! RegistroViewController
        }
        //Se pasan los datos de las variables creadas en el registroViewController para obtener la informacion
    }

}
