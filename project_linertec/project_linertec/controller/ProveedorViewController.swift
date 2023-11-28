//
//  ProveedorViewController.swift
//  project_linertec
//
//  Created by DAMII on 27/11/23.
//

import UIKit
import Alamofire

class ProveedorViewController: UIViewController,UITableViewDataSource,
                               UITableViewDelegate {

    //importar tvCliente UITableView!
    
    //tvMedicamentos
    var listaProveedores:[Proveedor]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tvProveedores.dataSource=self
        tvProveedores.delegate=self
        tvProveedores.rowHeight=100
        cargarProveedores()
        print("cantidad : ",listaProveedores.count)
    }
    
    func cargarProveedores(){
        AF.request("https://api-linertec.onrender.com/api/proveedor")
            .responseDecodable(of:[Proveedor].self){ response in
            guard let data=response.value else {return}
            self.listaProveedores=data
            self.tvProveedores.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaProveedores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let fila=tvProveedores.dequeueReusableCell(withIdentifier: "celda") as! ItemProveedorTableViewCell
        
        //fila.lblCodigo.text="Codigo : "+String(listaClientes[indexPath.row].codigo)
        //fila.lblNombre.text="Nombre : "+listaClientes[indexPath.row].nombre
        return fila
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="editarMed"{
            
        }
    }
}
