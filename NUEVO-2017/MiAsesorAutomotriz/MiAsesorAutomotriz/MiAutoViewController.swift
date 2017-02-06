//
//  MiAutoViewController.swift
//  MiAsesorAutomotriz
//
//  Created by MODESTO VASCO FORNAS on 2/4/17.
//  Copyright © 2017 Modesto Vasco. All rights reserved.
//

import UIKit

class MiAutoViewController: UIViewController {

    @IBOutlet weak var modeloLabel: UILabel!
    @IBOutlet weak var anoLabel: UILabel!
    @IBOutlet weak var placasLabel: UILabel!
    @IBOutlet weak var polizaLabel: UILabel!
    
    @IBOutlet weak var serieLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let x = UserDefaults.standard.object(forKey:"miAuto") as? String
        {
            modeloLabel.text = x
        }
        else
        {
            modeloLabel.text = "Sin datos"
        }
        if let y = UserDefaults.standard.object(forKey:"miAno") as? String
        {
            anoLabel.text = y
        }
        else
        {
            anoLabel.text = "Sin datos"
        }
        if let z = UserDefaults.standard.object(forKey:"misPlacas") as? String
        {
            placasLabel.text = z
        }
        else
        {
            placasLabel.text = "Sin datos"
        }
        if let a = UserDefaults.standard.object(forKey:"miPoliza") as? String
        {
            polizaLabel.text = a
        }
        else
        {
            polizaLabel.text = "Sin datos"
        }
        if let b = UserDefaults.standard.object(forKey:"miSerie") as? String
        {
            serieLabel.text = b
        }
        else
        {
            serieLabel.text = "Sin datos"
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func compartirButton(_ sender: Any) {
    }
    @IBAction func smsButton(_ sender: Any) {
    }
    @IBAction func emailButton(_ sender: Any) {
    }
    @IBAction func llamarButton(_ sender: Any) {
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
