//
//  UsuarioViewController.swift
//  project_linertec
//
//  Created by DAMII on 27/11/23.
//

import UIKit
import Alamofire

class UsuarioViewController: UIViewController,UITableViewDataSource,
                             UITableViewDelegate {
    
    //importar tvCliente UITableView!
    
    //tvMedicamentos
    var listaUsuarios:[Usuario]=[]

    override func viewDidLoad() {
        super.viewDidLoad()

        tvUsuarios.dataSource=self
        tvUsuarios.delegate=self
        tvUsuarios.rowHeight=100
        cargarUsuarios()
        print("cantidad : ",listaUsuarios.count)
    }
    
    func cargarUsuarios(){
        AF.request("https://api-linertec.onrender.com/api/usuarios")
            .responseDecodable(of:[Usuarios].self){ response in
            guard let data=response.value else {return}
            self.listaUsuarios=data
            self.tvUsuarios.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaUsuarios.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let fila=tvUsuarios.dequeueReusableCell(withIdentifier: "celda") as! ItemUsuarioTableViewCell
        
        //fila.lblCodigo.text="Codigo : "+String(listaClientes[indexPath.row].codigo)
        //fila.lblNombre.text="Nombre : "+listaClientes[indexPath.row].nombre
        return fila
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="editarMed"{
            
        }
    }

}
