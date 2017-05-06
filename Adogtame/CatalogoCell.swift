//
//  CatalogoCell.swift
//  Adogtame
//
//  Created by Anita Martínez on 4/05/17.
//  Copyright © 2017 Anita Martínez. All rights reserved.
//

import UIKit

class CatalogoCell: UITableViewCell {

    
    
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var nombre: UILabel!
    
    @IBOutlet weak var edad: UILabel!
    @IBOutlet weak var raza: UILabel!
    @IBOutlet weak var tamanio: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
