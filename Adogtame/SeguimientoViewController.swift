//
//  SeguimientoViewController.swift
//  Adogtame
//
//  Created by Anita Martínez on 5/05/17.
//  Copyright © 2017 Anita Martínez. All rights reserved.
//

import UIKit
import SDWebImage

class SeguimientoViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    var data: [MascotaSeg] = []
    var api: MascotasApi!
    var dao:  AdogtameDao!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        api = MascotasApi()
       dao = AdogtameDao()
        data = dao.getByid(idusuario: UserDefaults().object(forKey: "id") as! String)!
        
        api.ListarSeguimiento{(seguimientos) in
            
            self.data = seguimientos
            self.table.reloadData()
           
            
        }
        


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }
    


    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "seguimientoCelda") as! SeguimientoCell
        let f = data[indexPath.row]
        
        cell.nombre.text = f.nombre
        cell.descripcion.text = f.descripcion
        cell.img.sd_setImage(with: URL(string:f.imagen))
        print(f.imagen)
        
        return cell
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
