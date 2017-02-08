//
//  Citas2ViewController.swift
//  MiAsesorAutomotriz
//
//  Created by MODESTO VASCO FORNAS on 2/7/17.
//  Copyright © 2017 Modesto Vasco. All rights reserved.
//

import UIKit
import MessageUI

class Citas2ViewController: UIViewController, UITextFieldDelegate,MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate {
    

    @IBOutlet weak var fechaLabel: UILabel!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    var emailAsesor = String()
    var telAsesor = String()
    var appStoreAgencia = String()
    var fecha = String()
    var hora = String()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/YYYY"
        fecha = formatter.string(from: datePicker.date)
        formatter.dateFormat = "hh:mm"
        hora = formatter.string(from: datePicker.date)
        fechaLabel.text = fecha + " " +  hora
   
        
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
      
       
       
        
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
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        // Try to find next responder
        textField.resignFirstResponder()
        return false
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func aceptarButton(_ sender: Any) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/YYYY"
        fecha = formatter.string(from: datePicker.date)
        formatter.dateFormat = "hh:mm"
        hora = formatter.string(from: datePicker.date)
        fechaLabel.text = fecha + " " +  hora
     
        let prefs = UserDefaults.standard
        prefs.setValue(fecha, forKey: "miFecha")
        prefs.setValue(hora, forKey: "miHora")
        
        print (fecha)
        print (hora)
        
        
        
      
        
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

    @IBAction func cambioFecha(_ sender: Any) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/YYYY"
        fecha = formatter.string(from: datePicker.date)
        formatter.dateFormat = "hh:mm"
        hora = formatter.string(from: datePicker.date)
        fechaLabel.text = fecha + " " + hora
        
    }

}
