//
//  DonacionesCell.swift
//  Adogtame
//
//  Created by Anita Martínez on 4/05/17.
//  Copyright © 2017 Anita Martínez. All rights reserved.
//

import UIKit

class DonacionesCell: UITableViewCell {

    
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var nombre: UILabel!
    
    @IBOutlet weak var direccion: UILabel!
    
    @IBOutlet weak var contacto: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
