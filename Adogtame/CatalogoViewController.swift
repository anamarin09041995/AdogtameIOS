//
//  CatalogoViewController.swift
//  Adogtame
//
//  Created by Anita Martínez on 4/05/17.
//  Copyright © 2017 Anita Martínez. All rights reserved.
//

import UIKit
import SDWebImage

class CatalogoViewController: UIViewController, UITableViewDataSource {

    
    var data: [Mascota] = []
    @IBOutlet var table: UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        data = [
            Mascota(nombre: "Tango", raza: "Criollo", descripcion: "Tango fue encontrado en estado de desnutricion. Ahora se encuentra recuperado y en busca de un hogar que le brinde amor", fundacion: "Fundación: Vida animal", tamanio: "Mediano", edad: "18 meses", imagen: "https://s-media-cache-ak0.pinimg.com/736x/0b/e2/9b/0be29b71ba515ec579e44ce702ee36b1.jpg", contacto:3125704567),
            Mascota(nombre: "Luna", raza: "Bulldog", descripcion: "Luna nacio dentro de la fundación como resultado del embarazo de Milagros, una perrita que se encontraba en situacion de calle y fue acogida", fundacion: "Fundación: Morris", tamanio: "Pequeña", edad: "6 meses", imagen: "https://www.mundoperro.net/wp-content/uploads/Bulldog-485x300.jpg", contacto:3134567890),
            Mascota(nombre: "Nacho", raza: "Criollo", descripcion: "Nacho lleva tres años en la fundación, se encuentra listo para vivir en un hogar que lo llene de amor", fundacion: "Fundación: Paz animal", tamanio: "Mediano", edad: "4 años", imagen: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/aa/AHey_Fatty.jpg/200px-AHey_Fatty.jpg", contacto:3143354418),
            Mascota(nombre: "Lucas", raza: "Pitbull", descripcion: "Lucas fue encontrado en estado de desnutricion. Ahora se encuentra recuperado y en busca de un hogar que le brinde amor", fundacion: "Fundación: PATA", tamanio: "Mediano", edad: "2 años", imagen: "https://t2.ea.ltmcdn.com/es/images/8/0/7/img_nombres_para_perros_pitbull_6708_600.jpg", contacto:3017780834),
        ]
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
