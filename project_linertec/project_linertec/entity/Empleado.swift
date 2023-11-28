//
//  Empleado.swift
//  project_linertec
//
//  Created by DAMII on 27/11/23.
//

import UIKit

struct Empleado:Codable {
    
    var idempleado:Int
    var nombre:String
    var apellido:String
    var telefono:String
    var correo:String
    var numerodocumento:String
    var documento:Documento
    
}
