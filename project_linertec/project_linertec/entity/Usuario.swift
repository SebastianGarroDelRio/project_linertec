//
//  Usuario.swift
//  project_linertec
//
//  Created by DAMII on 27/11/23.
//

import UIKit

struct Usuario:Codable {
    
    var idusuario:Int
    var username:String
    var password:String
    
    var empleado:Empleado
    var rol:Rol
    
}
