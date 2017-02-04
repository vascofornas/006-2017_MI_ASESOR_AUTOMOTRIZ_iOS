//
//  ViewController.swift
//  MiAsesorAutomotriz
//
//  Created by MODESTO VASCO FORNAS on 1/23/17.
//  Copyright © 2017 Modesto Vasco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var agenciaLabel: UILabel!
    
    @IBOutlet weak var asesorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
       
        if let x = UserDefaults.standard.object(forKey:"miAgencia") as? String
        {
            agenciaLabel.text = x
        }
        else
        {
            agenciaLabel.text = "No has seleccionado ninguna Agencia"
        }
        if let y = UserDefaults.standard.object(forKey:"miAsesor") as? String
        {
            asesorLabel.text = y
        }
        else
        {
            asesorLabel.text = "No has seleccionado ningún Asesor"
        }
    }


}

