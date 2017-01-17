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

class SeleccionarAgenciaViewController: UIViewController, UITextFieldDelegate  {

  
 
    
   @IBOutlet weak var nombreAgenciaLabel: UILabel!
    @IBOutlet weak var nombreAsesorLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        self.nombreAgenciaLabel.text = "message"
        self.nombreAsesorLabel.text = "message2"
     
           }
    
    
    override func viewDidAppear(_ animated: Bool) {
       
      
       
    }

   
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   

    
    @IBAction func botonAceptarAction(_ sender: UIButton) {
        
     
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        
        
     
        }
    }


    

  
    
 
    

   

    
   
    
  



    


