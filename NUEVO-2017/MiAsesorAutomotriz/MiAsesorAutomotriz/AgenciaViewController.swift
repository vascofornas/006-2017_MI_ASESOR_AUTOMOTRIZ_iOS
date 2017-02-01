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
                    return
                    }
                    
                    do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                    
                    if let parseJSON = json {
                        
                        let codigo_de_agencia = parseJSON["codigo_agencia"];
                    }
                        
                    }catch let error as NSError{
                        print (error)
                    }
                }
        }).resume()
        
        
        
        
        
        
        
    }
}
