//
//  DocumentoViewController.swift
//  project_linertec
//
//  Created by DAMII on 27/11/23.
//

import UIKit
import Alamofire

class DocumentoViewController: UIViewController,UITableViewDataSource,
                               UITableViewDelegate {
    
    //importar tvCliente UITableView!
    
    //tvMedicamentos
    var listaDocumentos:[Documento]=[]

    override func viewDidLoad() {
        super.viewDidLoad()

        tvDocumentos.dataSource=self
        tvDocumentos.delegate=self
        tvDocumentos.rowHeight=100
        cargarDocumentos()
        print("cantidad : ",listaDocumentos.count)
    }
    
    
    func cargarDocumentos(){
        AF.request("https://api-linertec.onrender.com/api/documento")
            .responseDecodable(of:[Documento].self){ response in
            guard let data=response.value else {return}
            self.listaDocumentos=data
            self.tvDocumentos.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaDocumentos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let fila=tvDocumentos.dequeueReusableCell(withIdentifier: "celda") as! ItemDocumentoTableViewCell
        
        //fila.lblCodigo.text="Codigo : "+String(listaClientes[indexPath.row].codigo)
        //fila.lblNombre.text="Nombre : "+listaClientes[indexPath.row].nombre
        return fila
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="editarMed"{
            
        }
    }

}
