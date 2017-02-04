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
        
        let codigoAgencia = codigoTextField.text
        
        if (codigoAgencia?.isEmpty)!
        {
            //
            let myAlert = UIAlertController(title:"Aviso", message:"Debes introducir un código de agencia", preferredStyle:
                UIAlertControllerStyle.alert);
            let okAction = UIAlertAction(title:"Cerrar", style:
                UIAlertActionStyle.default, handler:nil)
            myAlert.addAction(okAction);
            self.present(myAlert, animated: true, completion: nil)
            
            
            return
        }
        
        let myURL = NSURL (string: "http://www.miasesorautomotriz.com/php_ios/scripts/getAgencia.php");
        
        let request = NSMutableURLRequest (url:myURL! as URL);
        request.httpMethod = "POST";
        
        let postString = ("nombreAgencia=\(codigoAgencia!)");
        
        request.httpBody = postString.data (using: String.Encoding.utf8);
        
        URLSession.shared.dataTask(with: request as URLRequest,
                completionHandler: { (data, response,error) -> Void in
                    
                DispatchQueue.main.async
                {
                   if (error != nil)
                   {
                    //display an alert
                    var myAlert = UIAlertController(title:"Aviso",message:error?.localizedDescription,
                                                    preferredStyle:UIAlertControllerStyle.alert);
                    let okAction = UIAlertAction(title:"Cerrar",style:UIAlertActionStyle.default, handler: nil);
                    
                    myAlert.addAction(okAction);
                    self.present(myAlert,animated:true,completion:nil)
                    return
                    }
                    
                    do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                    
                    if let parseJSON = json {
                        
                        let codigo_de_agencia = parseJSON["direccion_agencia"] as! String?
                        
                        if (codigo_de_agencia != nil){
                            //pasamos los datos NSUserDefaults
                            print (codigo_de_agencia!)
                            
                            let nombre_de_agencia = parseJSON["nombre_agencia"] as! String?
                            let direccion_de_agencia = parseJSON["direccion_agencia"] as! String?
                            
                            
                            
                            
                            let prefs = UserDefaults.standard
                            prefs.setValue(codigo_de_agencia, forKey: "miCodigoAgencia")
                             prefs.setValue(nombre_de_agencia, forKey: "miAgencia")
                            prefs.setValue(direccion_de_agencia, forKey: "miDireccionAgencia")
                            
                            
                            self.nombreAgenciaLabel.text = nombre_de_agencia
                            self.direccionAgenciaLabel.text = direccion_de_agencia
                            
                        }
                        else{
                            //alert
                            let mensaje = parseJSON["message"] as? String
                            var myAlert = UIAlertController(title:"Aviso",message:mensaje,
                                                            preferredStyle:UIAlertControllerStyle.alert);
                            let okAction = UIAlertAction(title:"Cerrar",style:UIAlertActionStyle.default, handler: nil);
                            
                            myAlert.addAction(okAction);
                            self.present(myAlert,animated:true,completion:nil)
                        }
                    }
                        
                    }catch let error as NSError{
                        print (error)
                    }
                }
        }).resume()
        
        
        
        
        
        
        
    }
}
