//
//  MenuViewController.swift
//  MiAsesorAutomotriz
//
//  Created by MODESTO VASCO FORNAS on 2/4/17.
//  Copyright © 2017 Modesto Vasco. All rights reserved.
//

import UIKit
import MessageUI

class MenuViewController: UIViewController {

    @IBOutlet weak var asesorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        if let x = UserDefaults.standard.object(forKey:"miAsesor") as? String
        {
            asesorLabel.text = x
        }
        else
        {
            asesorLabel.text = "No has seleccionado ningún Asesor"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   //botones de la barra inferior
    @IBAction func llamarButton(_ sender: Any) {
        
        if let y = UserDefaults.standard.object(forKey:"miAsesor") as? String
        {
        
        let refreshAlert = UIAlertController(title: "Aviso", message: "Quieres marcar a tu asesor "+y+"?", preferredStyle: UIAlertControllerStyle.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Si", style: .default, handler: { (action: UIAlertAction!) in
            
            if let x = UserDefaults.standard.object(forKey:"miAsesorTel") as? String
            {
                
                print("Handle Ok logic here")
                if let url = URL(string: "tel://\(x)") {
                    UIApplication.shared.open(url, options: [:])
                }
            }
            
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: { (action: UIAlertAction!) in
            print("Handle Cancel Logic here")
        }))
        
        present(refreshAlert, animated: true, completion: nil)
        
    }
    
        
    }
    @IBAction func smsButton(_ sender: Any) {
    }
    
    
    @IBAction func compartirButton(_ sender: Any) {
    }
    
    @IBAction func emailButton(_ sender: Any) {
        
        
        
         }
   
    
    //botones del menu
    @IBAction func financieraButton(_ sender: Any) {
        
        if (UserDefaults.standard.object(forKey:"miAsesor") as? String) != nil
        {
            
            let refreshAlert = UIAlertController(title: "Aviso", message: "Quieres marcar a la Financiera?", preferredStyle: UIAlertControllerStyle.alert)
            
            refreshAlert.addAction(UIAlertAction(title: "Si", style: .default, handler: { (action: UIAlertAction!) in
                
                if let x = UserDefaults.standard.object(forKey:"miFinancieraAgencia") as? String
                {
                    
                    print("Handle Ok logic here")
                    if let url = URL(string: "tel://\(x)") {
                        UIApplication.shared.open(url, options: [:])
                    }
                }
                
            }))
            
            refreshAlert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: { (action: UIAlertAction!) in
                print("Handle Cancel Logic here")
            }))
            
            present(refreshAlert, animated: true, completion: nil)
    }
    
    }
    
    
 
    
    @IBAction func auxilioVialMexButton(_ sender: Any) {
        
        
        if (UserDefaults.standard.object(forKey:"miAsesor") as? String) != nil
        {
            
            let refreshAlert = UIAlertController(title: "Aviso", message: "Quieres marcar a Auxilio Vial MEX?", preferredStyle: UIAlertControllerStyle.alert)
            
            refreshAlert.addAction(UIAlertAction(title: "Si", style: .default, handler: { (action: UIAlertAction!) in
                
                if let x = UserDefaults.standard.object(forKey:"miAuxilioVialMex") as? String
                {
                    
                    print("Handle Ok logic here")
                    if let url = URL(string: "tel://\(x)") {
                        UIApplication.shared.open(url, options: [:])
                    }
                }
                
            }))
            
            refreshAlert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: { (action: UIAlertAction!) in
                print("Handle Cancel Logic here")
            }))
            
            present(refreshAlert, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func auxilioVialUSAButton(_ sender: Any) {
        
        
        if (UserDefaults.standard.object(forKey:"miAsesor") as? String) != nil
        {
            
            let refreshAlert = UIAlertController(title: "Aviso", message: "Quieres marcar a Auxilio Vial USA?", preferredStyle: UIAlertControllerStyle.alert)
            
            refreshAlert.addAction(UIAlertAction(title: "Si", style: .default, handler: { (action: UIAlertAction!) in
                
                if let x = UserDefaults.standard.object(forKey:"miAuxilioVialUsa") as? String
                {
                    
                    print("Handle Ok logic here")
                    if let url = URL(string: "tel://\(x)") {
                        UIApplication.shared.open(url, options: [:])
                    }
                }
                
            }))
            
            refreshAlert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: { (action: UIAlertAction!) in
                print("Handle Cancel Logic here")
            }))
            
            present(refreshAlert, animated: true, completion: nil)
        }
        
    }
}
