//
//  DonacionesViewController.swift
//  Adogtame
//
//  Created by Anita Martínez on 4/05/17.
//  Copyright © 2017 Anita Martínez. All rights reserved.
//

import UIKit

class DonacionesViewController: UIViewController, UITableViewDataSource {

    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "donacionesCelda") as! DonacionesCell
        
        cell.nombre.text = "Nombre"
        cell.direccion.text = "Direccion"
        cell.contacto.text = "Contacto"
        
        return cell
    }


}
