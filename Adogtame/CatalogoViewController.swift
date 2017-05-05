//
//  CatalogoViewController.swift
//  Adogtame
//
//  Created by Anita Martínez on 4/05/17.
//  Copyright © 2017 Anita Martínez. All rights reserved.
//

import UIKit

class CatalogoViewController: UIViewController, UITableViewDataSource {

    
    var data: [Mascota] = []
    @IBOutlet var table: UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
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
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "catalogoCelda") as! CatalogoCell
        let m = data[indexPath.row]
        
        cell.nombre.text = m.nombre
        cell.tamanio.text = m.tamanio
        cell.raza.text = m.raza
        cell.edad.text = m.edad
        
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
