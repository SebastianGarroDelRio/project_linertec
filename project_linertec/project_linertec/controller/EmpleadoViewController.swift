//
//  EmpleadoViewController.swift
//  project_linertec
//
//  Created by DAMII on 27/11/23.
//

import UIKit
import Alamofire

class EmpleadoViewController: UIViewController,UITableViewDataSource,
                              UITableViewDelegate {

    //importar tvCliente UITableView!
    @IBOutlet weak var tvEmpleados: UITableView!
    
    //tvMedicamentos
    var listaEmpleados:[Empleado]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tvEmpleados.dataSource=self
        tvEmpleados.delegate=self
        tvEmpleados.rowHeight=100
        cargarEmpleados()
        print("cantidad : ",listaEmpleados.count)
    }
    
    func cargarEmpleados(){
        AF.request("https://api-linertec.onrender.com/api/empleado")
            .responseDecodable(of:[Empleado].self){ response in
            guard let data=response.value else {return}
            self.listaEmpleados=data
            self.tvEmpleados.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaEmpleados.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let fila=tvEmpleados.dequeueReusableCell(withIdentifier: "celda") as! ItemEmpleadoTableViewCell
        
        //fila.lblCodigo.text="Codigo : "+String(listaClientes[indexPath.row].codigo)
        //fila.lblNombre.text="Nombre : "+listaClientes[indexPath.row].nombre
        return fila
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="editarMed"{
            
        }
    }

}
