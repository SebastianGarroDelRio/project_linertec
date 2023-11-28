//
//  ProductoViewController.swift
//  project_linertec
//
//  Created by DAMII on 27/11/23.
//

import UIKit
import Alamofire

class ProductoViewController: UIViewController,UITableViewDataSource,
                              UITableViewDelegate {

    //importar tvCliente UITableView!
    @IBOutlet weak var tvProductos: UITableView!
    
    //tvMedicamentos
    var listaProductos:[Producto]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tvProductos.dataSource=self
        tvProductos.delegate=self
        tvProductos.rowHeight=100
        cargarProductos()
        print("cantidad : ",listaProductos.count)
    }
    
    func cargarProductos(){
        AF.request("https://api-linertec.onrender.com/api/producto")
            .responseDecodable(of:[Producto].self){ response in
            guard let data=response.value else {return}
            self.listaProductos=data
            self.tvProductos.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaProductos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let fila=tvProductos.dequeueReusableCell(withIdentifier: "celda") as! ItemProductoTableViewCell
        
        //fila.lblCodigo.text="Codigo : "+String(listaClientes[indexPath.row].codigo)
        //fila.lblNombre.text="Nombre : "+listaClientes[indexPath.row].nombre
        return fila
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="editarMed"{
            
        }
    }


}
