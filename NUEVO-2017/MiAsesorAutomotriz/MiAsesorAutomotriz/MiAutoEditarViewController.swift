//
//  MiAutoEditarViewController.swift
//  MiAsesorAutomotriz
//
//  Created by MODESTO VASCO FORNAS on 2/5/17.
//  Copyright © 2017 Modesto Vasco. All rights reserved.
//

import UIKit

class MiAutoEditarViewController: UIViewController, UITextFieldDelegate  {

    @IBOutlet weak var serieTxt: UITextField!
    @IBOutlet weak var polizaTxt: UITextField!
    @IBOutlet weak var placasTxt: UITextField!
    @IBOutlet weak var anoTxt: UITextField!
    @IBOutlet weak var modeloTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

            self.modeloTxt.delegate = self
        self.anoTxt.delegate = self
        self.placasTxt.delegate = self
        self.polizaTxt.delegate = self
        self.serieTxt.delegate = self
        
        
       
    }
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        // Try to find next responder
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
        }
        // Do not add a line break
        return false
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
