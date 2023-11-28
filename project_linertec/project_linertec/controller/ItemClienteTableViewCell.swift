//
//  ClienteTableViewCell.swift
//  project_linertec
//
//  Created by DAMII on 27/11/23.
//

import UIKit

class ItemClienteTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var lblCodigo: UILabel!
    
    @IBOutlet weak var lblNombre: UILabel!
    
    @IBOutlet weak var lblApellido: UILabel!
    
    @IBOutlet weak var lblCorreo: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
