//
//  Costos5ViewController.swift
//  MiAsesorAutomotriz
//
//  Created by MODESTO VASCO FORNAS on 2/13/17.
//  Copyright © 2017 Modesto Vasco. All rights reserved.
//

import UIKit
import MessageUI

class Costos5ViewController: UIViewController, UITextViewDelegate,MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate {
    
    
    
    @IBOutlet weak var comentariosTxt: UITextView!
    
    
    
    var emailAsesor = String()
    var telAsesor = String()
    var appStoreAgencia = String()
    var fecha = String()
    var hora = String()
    
    
    var searchResults = [["Nombre": "Cargando asesores", "Apellidos": " de la agencia", "Id": "656", "Tel":"656", "Email":"email"]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.comentariosTxt.delegate = self
        
        comentariosTxt.returnKeyType = UIReturnKeyType.done
        
        
        
        
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
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            textView.resignFirstResponder()
        }
        return true
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func aceptarButton(_ sender: Any) {
        
        let comentarios = comentariosTxt.text
        let prefs = UserDefaults.standard
        prefs.setValue(comentarios, forKey: "misComentariosCita")
        if let hh = UserDefaults.standard.object(forKey:"misComentariosCita") as? String
        {
            print ("Comentarios:" + hh)
        }
        
        
        let nombre_usuario = UserDefaults.standard.object(forKey:"miNombre") as? String
        let email_usuario = UserDefaults.standard.object(forKey:"miEmail") as? String
        let tel_usuario = UserDefaults.standard.object(forKey:"miTel") as? String
        let modelo = UserDefaults.standard.object(forKey:"miModeloCita") as? String
        let ano = UserDefaults.standard.object(forKey:"miAnoCita") as? String
        let fecha = UserDefaults.standard.object(forKey:"miFechaCita") as? String
        let hora = UserDefaults.standard.object(forKey:"miHoraCita") as? String
        let km = UserDefaults.standard.object(forKey:"misKmCita") as? String
     
       
        let emailAsesor = UserDefaults.standard.object(forKey:"miAsesorEmail") as? String
        let agencia = UserDefaults.standard.object(forKey:"miCodigoAgencia") as? String
        
        let codigo_cita = randomString(length: 7)
        
        print (nombre_usuario!)
        print(email_usuario!)
        print (tel_usuario!)
        print (modelo!)
        print (ano!)
        print (fecha!)
        print (hora!)
       
    
        print(comentarios!)
     
        print(emailAsesor!)
        print (agencia!)
        print (codigo_cita)
        
        
      
        
        
        let request = NSMutableURLRequest(url: NSURL(string: "http://www.miasesorautomotriz.com/php_ios/scripts/enviarCostos.php")! as URL)
        request.httpMethod = "POST"
        let postString = "a=\(nombre_usuario!)&b=\(email_usuario!)&c=\(tel_usuario!)&d=\(modelo!)&e=\(ano!)&f=\(km!)&h=\(fecha!)&i=\(hora!)&j=\(comentarios!)&k=\(codigo_cita)&l=\(agencia!)&n=\(emailAsesor!)"
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            if error != nil {
                print("error=\(error)")
                return
            }
            
            print("response = \(response)")
            
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("responseString = \(responseString)")
            
            let alertController = UIAlertController(title: "Gracias", message: "Consulta de Costos de Servicio " + codigo_cita + " enviada con éxito", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Cerrar", style: .default, handler:  { action in self.performSegue(withIdentifier: "segue2", sender: self) })
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        }
        task.resume()
        
        
        
    }
    func randomString(length: Int) -> String {
        
        let letters : NSString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)
        
        var randomString = ""
        
        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        
        return randomString
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
    
    
    
    
    func displayAlertMessage(_ userMessage: String)
    {
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert);
        let okAction =  UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
        myAlert.addAction(okAction);
        self.present(myAlert, animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    
    
    
}
