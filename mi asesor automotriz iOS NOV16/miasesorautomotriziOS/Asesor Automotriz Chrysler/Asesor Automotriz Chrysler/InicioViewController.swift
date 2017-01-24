//
//  ViewController.swift
//  Pedro Villarejo App Clientes
//
//  Created by MODESTO VASCO FORNAS on 1/8/16.
//  Copyright © 2016 Modesto Vasco. All rights reserved.
//

import UIKit
import Parse
import Foundation
import MessageUI
import MediaPlayer

class InicioViewController: UIViewController, UITextFieldDelegate  {

    @IBOutlet weak var nombreAgenciaLabel: UILabel!
  
 
    
    @IBOutlet weak var nombreAsesorLabel: UILabel!
   
    
    @IBOutlet weak var botonSeleccionar: UIButton!
    @IBOutlet weak var botonAceptar: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        self.nombreAgenciaLabel.text = "No has seleccionado ninguna Agencia"
        self.nombreAsesorLabel.text = "No has seleccionado ningún Asesor"
        
    
        

        
    }
    
   
    @IBAction func botonAceptarAction(_ sender: Any) {
        
    }
    @IBAction func botonSeleccionarAction(_ sender: Any) {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
       
      if let x = UserDefaults.standard.object(forKey: "miAgencia") as? String
      {
        self.nombreAgenciaLabel.text = x
        
        }
        if let y = UserDefaults.standard.object(forKey: "miAsesor") as? String
        {
            self.nombreAsesorLabel.text = y
            
        }
       
    }

   
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   

    
   
    

    
    }


    

  
    
 
    

   

    
   
    
  



    


