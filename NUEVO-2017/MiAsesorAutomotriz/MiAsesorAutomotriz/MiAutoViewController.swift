//
//  MiAutoViewController.swift
//  MiAsesorAutomotriz
//
//  Created by MODESTO VASCO FORNAS on 2/4/17.
//  Copyright © 2017 Modesto Vasco. All rights reserved.
//

import UIKit
import MessageUI

class MiAutoViewController: UIViewController,MFMailComposeViewControllerDelegate ,MFMessageComposeViewControllerDelegate{

    @IBOutlet weak var modeloLabel: UILabel!
    @IBOutlet weak var anoLabel: UILabel!
    @IBOutlet weak var placasLabel: UILabel!
    @IBOutlet weak var polizaLabel: UILabel!
    
    @IBOutlet weak var serieLabel: UILabel!
    
      var emailAsesor = String()
    var telAsesor = String()
    var appStoreAgencia = String()
    
    
    
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
        
        if let hh = UserDefaults.standard.object(forKey:"miAsesorEmail") as? String
        {
            emailAsesor = hh
        }
        if let tel = UserDefaults.standard.object(forKey:"miAsesorTel") as? String
        {
            telAsesor = tel
        }
        if let appStore = UserDefaults.standard.object(forKey:"miAppStoreAgencia") as? String
        {
            appStoreAgencia = appStore
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func compartirButton(_ sender: Any) {
        
        
        
        if MFMailComposeViewController.canSendMail() {
            
            
            let composeVC = MFMailComposeViewController()
            composeVC.mailComposeDelegate = self
            // Configure the fields of the interface.
            
            let url_app = "<a href='\(appStoreAgencia)'>Te recomiendo que descargues la iOS App MI ASESOR AUTOMOTRIZ (pulsa aqui)</a>"
            composeVC.setSubject("iOS App Mi Asesor Automotriz")
            composeVC.setMessageBody(url_app , isHTML: true)
            // Present the view controller modally.
            self.present(composeVC, animated: true, completion: nil)
        } else {
            // show failure alert
        }
    }
    @IBAction func smsButton(_ sender: Any) {
        
        
        if (MFMessageComposeViewController.canSendText()) {
            let controller = MFMessageComposeViewController()
            controller.body = "SMS desde la App Mi Asesor Automotriz"
            controller.recipients = [telAsesor]
            controller.messageComposeDelegate = self
            self.present(controller, animated: true, completion: nil)
        }
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func emailButton(_ sender: Any) {
        
        if MFMailComposeViewController.canSendMail() {
            
            
            let composeVC = MFMailComposeViewController()
            composeVC.mailComposeDelegate = self
            // Configure the fields of the interface.
            composeVC.setToRecipients([emailAsesor])
            composeVC.setSubject("Email desde la app Mi Asesor Automotriz")
            composeVC.setMessageBody("Escribe aqui el texto de tu email!", isHTML: false)
            // Present the view controller modally.
            self.present(composeVC, animated: true, completion: nil)
        } else {
            // show failure alert
        }
        
        
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }

   
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
