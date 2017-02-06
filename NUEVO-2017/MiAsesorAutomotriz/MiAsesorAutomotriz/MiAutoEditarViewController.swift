//
//  MiAutoEditarViewController.swift
//  MiAsesorAutomotriz
//
//  Created by MODESTO VASCO FORNAS on 2/5/17.
//  Copyright © 2017 Modesto Vasco. All rights reserved.
//

import UIKit

class MiAutoEditarViewController: UIViewController {

    @IBOutlet weak var serieTxt: UITextField!
    @IBOutlet weak var polizaTxt: UITextField!
    @IBOutlet weak var placasTxt: UITextField!
    @IBOutlet weak var anoTxt: UITextField!
    @IBOutlet weak var modeloTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func aceptarButton(_ sender: Any) {
    }
    @IBAction func compartirButton(_ sender: Any) {
    }
    @IBAction func smsButton(_ sender: Any) {
    }
    @IBAction func emailButton(_ sender: Any) {
    }
    @IBAction func llamarButton(_ sender: Any) {
    }
}
