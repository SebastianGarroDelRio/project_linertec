//
//  NuevoProveedorViewController.swift
//  project_linertec
//
//  Created by DAMII on 27/11/23.
//

import UIKit
import Alamofire
import DropDown

class NuevoProveedorViewController: UIViewController {
    
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtApellido: UITextField!
    @IBOutlet weak var txtTelefono: UITextField!
    @IBOutlet weak var txtCorreo: UITextField!
    @IBOutlet weak var cboTipoDocumento: UIButton!
    @IBOutlet weak var txtDocumento: UITextField!
    
    var comboCargo = DropDown()
    var combo = "Error"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        comboCargo.dataSource = ["RUC","DNI"]
    }
    
    @IBAction func btnRegistrar(_ sender: UIButton) {
        comboCargo.anchorView = sender
        comboCargo.bottomOffset = CGPoint(x:0,y:(comboCargo.anchorView?.plainView.bounds.height)!)
        comboCargo.show()
        comboCargo.selectionAction = { [unowned self]
        (index: Int, item:String) in
        sender.setTitle(item, for: .normal)
        
        //leer cajas
        let nom=txtNombre.text ?? ""
        let ape=txtApellido.text ?? ""
        let tel=txtTelefono.text ?? ""
        let cor=txtCorreo.text ?? ""
        let doc=txtDocumento.text ?? ""
        
        
        let bean=Proveedor(idproveedor: 0, nombre: nom, telefono: ape, correo: tel, numerodocumento: doc, documento: 1)
        registrarProveedor(obj: bean)
    }
}
    
    func registrarProveedor(obj:Proveedor){
        AF.request("https://api-linertec.onrender.com/api/proveedor/RegistrarProveedor",
                   method: .post,
                   parameters: obj,
                   encoder: JSONParameterEncoder.default)
        .response( completionHandler: { data in
            //validar data
            switch data.result{
               case .success(let info):
                 do{
                     let result = try JSONDecoder().decode(Proveedor.self,from:info!)
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
