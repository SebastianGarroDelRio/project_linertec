//
//  ClienteViewController.swift
//  project_linertec
//
//  Created by DAMII on 27/11/23.
//

import UIKit
import Alamofire

class ClienteViewController: UIViewController,UITableViewDataSource,
                             UITableViewDelegate {
    
    
    //importar tvCliente UITableView!
    @IBOutlet weak var tvClientes: UITableView!
    
    //tvMedicamentos
    var listaClientes:[Cliente]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tvClientes.dataSource=self
        tvClientes.delegate=self
        tvClientes.rowHeight=100
        cargarClientes()
        print("cantidad : ",listaClientes.count)
    }
    
    func cargarClientes(){
        AF.request("https://api-linertec.onrender.com/api/documento")
            .responseDecodable(of:[Cliente].self){ response in
            guard let data=response.value else {return}
            self.listaClientes=data
            self.tvClientes.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaClientes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let fila=tvClientes.dequeueReusableCell(withIdentifier: "celda") as! ItemClienteTableViewCell
        
        //fila.lblCodigo.text="Codigo : "+Int(listaClientes[indexPath.row])
        fila.lblNombre.text="Nombre : "+listaClientes[indexPath.row].nombre
        fila.lblApellido.text="Apellido : "+listaClientes[indexPath.row].apellido
        return fila
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="editarMed"{
            
        }
    }
    
    
    

}
