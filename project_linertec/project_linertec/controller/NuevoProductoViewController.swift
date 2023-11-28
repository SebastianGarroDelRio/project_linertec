//
//  NuevoProductoViewController.swift
//  project_linertec
//
//  Created by DAMII on 27/11/23.
//

import UIKit
import Alamofire
import DropDown

class NuevoProductoViewController: UIViewController {

    @IBOutlet weak var txtDescripcion: UITextField!
    @IBOutlet weak var txtStock: UITextField!
    @IBOutlet weak var cboCategoria: UIButton!
    
    var comboCargo = DropDown()
    var combo = "Error"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnRegistrar(_ sender: UIButton) {
        comboCargo.anchorView = sender
        comboCargo.bottomOffset = CGPoint(x:0,y:(comboCargo.anchorView?.plainView.bounds.height)!)
        comboCargo.show()
        comboCargo.selectionAction = { [unowned self]
        (index: Int, item:String) in
        sender.setTitle(item, for: .normal)
        
        //leer cajas
        let des=txtDescripcion.text ?? ""
        let sto=txtStock.text ?? ""
        
        let bean=Producto(idproducto: 0, descripcion: des, stock: sto, categoria: 1)
        registrarProducto(obj: bean)
    }
        
    }
    
    func registrarProducto(obj:Producto){
        AF.request("https://api-linertec.onrender.com/api/producto/RegistrarProducto",
                   method: .post,
                   parameters: obj,
                   encoder: JSONParameterEncoder.default)
        .response( completionHandler: { data in
            //validar data
            switch data.result{
               case .success(let info):
                 do{
                     let result = try JSONDecoder().decode(Producto.self,from:info!)
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
