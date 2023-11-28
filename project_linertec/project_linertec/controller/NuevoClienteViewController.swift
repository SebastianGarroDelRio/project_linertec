//
//  NuevoClienteViewController.swift
//  project_linertec
//
//  Created by DAMII on 27/11/23.
//

import UIKit
import Alamofire

class NuevoClienteViewController: UIViewController {

    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtApellido: UITextField!
    @IBOutlet weak var txtDni: UITextField!
    @IBOutlet weak var txtCorreo: UITextField!
        
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func btnRegistrar(_ sender: UIButton) {
        //leer cajas
        let nom=txtNombre.text ?? ""
        let ape=txtApellido.text ?? ""
        let dni=txtDni.text ?? ""
        let cor=txtCorreo.text ?? ""
        let bean=Cliente(idcliente: 0, nombre: nom, apellido: ape, dni: dni, correo: cor)
        registrarCliente(obj: bean)
    }
    
    func registrarCliente(obj:Cliente){
        AF.request("https://puedeser.onrender.com/api/cliente/RegistrarCliente",
                   method: .post,
                   parameters: obj,
                   encoder: JSONParameterEncoder.default)
        .response( completionHandler: { data in
            //validar data
            switch data.result{
               case .success(let info):
                 do{
                     let result = try JSONDecoder().decode(Cliente.self,from:info!)
                 }
                 catch{
                  print("Error en el JSON")
                 }
                 case.failure(let error):
                     print(error.localizedDescription)
            }
        })
    }

}
