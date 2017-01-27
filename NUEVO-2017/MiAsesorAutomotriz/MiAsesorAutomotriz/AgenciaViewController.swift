//
//  AgenciaViewController.swift
//  MiAsesorAutomotriz
//
//  Created by MODESTO VASCO FORNAS on 1/25/17.
//  Copyright © 2017 Modesto Vasco. All rights reserved.
//

import UIKit

class AgenciaViewController: UIViewController, UITextFieldDelegate  {

    @IBOutlet weak var direccionAgenciaLabel: UILabel!
    @IBOutlet weak var nombreAgenciaLabel: UILabel!
    @IBOutlet weak var codigoTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.codigoTextField.delegate = self
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

    @IBAction func buscarButtonAction(_ sender: Any) {
        
        
        let codigo = codigoTextField.text
        
        if (codigo?.isEmpty)!{
            //display alert
            
            let myAlert = UIAlertController(title:"Aviso", message:"Debes escribir un código de Agencia",preferredStyle:UIAlertControllerStyle.alert);
            let okAction = UIAlertAction(title:"Cerrar", style:UIAlertActionStyle.default, handler:nil)
            myAlert.addAction(okAction);
            self.present(myAlert, animated:true,completion:nil)
            
            return
        }
    }
}
