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
    @IBOutlet weak var anolabel: UILabel!
    @IBOutlet weak var placasLabel: UILabel!
    @IBOutlet weak var polizaLabel: UILabel!
    
    @IBOutlet weak var serieLabel: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
