//
//  Citas7ViewController.swift
//  MiAsesorAutomotriz
//
//  Created by MODESTO VASCO FORNAS on 2/9/17.
//  Copyright © 2017 Modesto Vasco. All rights reserved.
//


import UIKit
import MessageUI

class Citas7ViewController: UIViewController, UITextViewDelegate,MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate {
    
    
    
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
        let tipo = UserDefaults.standard.object(forKey:"miTipoCita") as? String
        let taller = UserDefaults.standard.object(forKey:"miEmailTallerAgencia") as? String
        let emailAsesor = UserDefaults.standard.object(forKey:"miAsesorEmail") as? String
        let agencia = UserDefaults.standard.object(forKey:"miCodigoAgencia") as? String
    
        
        print (nombre_usuario!)
        print(email_usuario!)
        print (tel_usuario!)
        print (modelo!)
        print (ano!)
        print (fecha!)
        print (hora!)
        print (km!)
        print (tipo!)
        print(comentarios!)
        print(taller!)
        print(emailAsesor!)
        print (agencia!)
        
        
        // Dismiss the keyboard
        
        
        // Create URL
        let myUrl = URL(string: "http://www.miasesorautomotriz.com/php_ios/scripts/enviarCita.php")
        
        // Create HTTP Request
        let request = NSMutableURLRequest(url:myUrl!);
        request.httpMethod = "POST";
        
        if let x = UserDefaults.standard.object(forKey:"miCodigoAgencia") as? String {
            print (x)
            let postString = "searchWord=\(x)".addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed);
            print (postString as Any)
            request.httpBody = postString?.data(using: String.Encoding.utf8)
            request.setValue("\(request.httpBody?.count)", forHTTPHeaderField:"Content-Length")
        }
        
        // Execute HTTP Request
        URLSession.shared.dataTask(with: request as URLRequest,
                                   completionHandler: { (data, response,error) -> Void in
                                    
                                    // Run new async task to be able to interact with UI
                                    DispatchQueue.main.async {
                                        
                                        // Check if error took place
                                        if error != nil
                                        {
                                            // display an alert message
                                            self.displayAlertMessage(error!.localizedDescription)
                                            return
                                        }
                                        
                                        
                                        do {
                                            
                                            // Convert data returned from server to NSDictionary
                                            let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                                            
                                            
                                            
                                            // Cleare old search data and reload table
                                            self.searchResults.removeAll(keepingCapacity: false)
                                            
                                            
                                            // If friends array is not empty, populate searchResults array
                                            if let parseJSON = json {
                                                
                                                if let friends  = parseJSON["friends"] as? [AnyObject]
                                                {
                                                    let primerName = ["Nombre": "Selecciona un asesor" ,"Apellidos": " ", "Id": " ", "Tel": " ", "Email": " " ]
                                                    self.searchResults.append(primerName)
                                                    
                                                    for friendObj in friends
                                                    {
                                                        let fullName = ["Nombre": friendObj["nombre"] as! String, "Apellidos": friendObj["apellidos"] as! String, "Id": friendObj["id"] as! String, "Tel": friendObj["tel"] as! String, "Email": friendObj["email"] as! String]
                                                        
                                                        self.searchResults.append(fullName)
                                                        
                                                    }
                                                    
                                                    
                                                  
                                                    
                                                } else if(parseJSON["message"] != nil)
                                                {
                                                    // if no friends returned, display message returned from server side
                                                    let errorMessage = parseJSON["message"] as? String
                                                    
                                                    if(errorMessage != nil)
                                                    {
                                                        // display an alert message
                                                        self.displayAlertMessage(errorMessage!)
                                                    }
                                                }
                                            }
                                            
                                        } catch {
                                            print(error);
                                        }
                                        
                                    } // End of dispatch_async
                                    
                                    
        }) // End of data task
            
            
            .resume()    }
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
