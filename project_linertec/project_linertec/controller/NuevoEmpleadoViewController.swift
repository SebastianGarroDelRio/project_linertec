//
//  NuevoEmpleadoViewController.swift
//  project_linertec
//
//  Created by DAMII on 27/11/23.
//

import UIKit

class NuevoEmpleadoViewController: UIViewController {
    
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtApellido: UITextField!
    @IBOutlet weak var txtTelefono: UITextField!
    @IBOutlet weak var txtCorreo: UITextField!
    @IBOutlet weak var cboTipoDocumento: UIButton!
    @IBOutlet weak var txtDocumento: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    @IBAction func btnRegistrar(_ sender: UIButton) {
        //leer cajas
        let nom=txtNombre.text ?? ""
        let ape=txtApellido.text ?? ""
        let cor=txtCorreo.text ?? ""
        let bean=Cliente(idcliente: 0, nombre: nom, apellido: ape, dni: dni, correo: cor)
        registrarProveedor(obj: bean)
    }
    
    
    func registrarProveedor(obj:Proveedor){
        AF.request("https://puedeser.onrender.com/api/proveedor/RegistrarProveedor",
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
