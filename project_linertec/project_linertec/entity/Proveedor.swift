//
//  Proveedor.swift
//  project_linertec
//
//  Created by DAMII on 27/11/23.
//

import UIKit

struct Proveedor:Codable {
    
    var idproveedor:Int
    var nombre:String
    var telefono:String
    var correo:String
    var numerodocumento:String
    var documento:Documento
    
}
