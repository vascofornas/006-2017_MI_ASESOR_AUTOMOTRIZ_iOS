//
//  Citas5ViewController.swift
//  MiAsesorAutomotriz
//
//  Created by user123556 on 2/9/17.
//  Copyright © 2017 Modesto Vasco. All rights reserved.
//

import UIKit
import MessageUI

class Citas5ViewController: UIViewController, UITextFieldDelegate,MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    
    @IBOutlet weak var pickerAutos: UIPickerView!
    
    
    var emailAsesor = String()
    var telAsesor = String()
    var appStoreAgencia = String()
    var fecha = String()
    var hora = String()
    
    
    var searchResults = [["Nombre": "Cargando km"]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        pickerAutos.dataSource = self
        pickerAutos.delegate = self
        
        
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        doSearch("")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func aceptarButton(_ sender: Any) {
        
        
        
        
        
        
        
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
    
    func doSearch(_ searchWord: String)
    {
        // Dismiss the keyboard
        
        
        // Create URL
        let myUrl = URL(string: "http://www.miasesorautomotriz.com/php_ios/scripts/getKm.php")
        
        // Create HTTP Request
        let request = NSMutableURLRequest(url:myUrl!);
        request.httpMethod = "POST";
        
        if let x = UserDefaults.standard.object(forKey:"miCodigoAgencia") as? String {
            print (x)
            var postString = "searchWord=\(x)".addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed);
            print (postString)
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
                                                    let primerName = ["Nombre": "Selecciona los km de tu auto" ]
                                                    self.searchResults.append(primerName)
                                                    
                                                    for friendObj in friends
                                                    {
                                                        let x = friendObj["km"]
                                                        let myString = String(describing: x)
                                                        let fullName = ["Nombre": myString]
                                                        print (fullName)
                                                        self.searchResults.append(fullName)
                                                        
                                                    }
                                                    
                                                    
                                                    self.pickerAutos.reloadAllComponents()
                                                    
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
            
            
            .resume()
        
    } // end of doSearch() function
    
    
    func displayAlertMessage(_ userMessage: String)
    {
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert);
        let okAction =  UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
        myAlert.addAction(okAction);
        self.present(myAlert, animated: true, completion: nil)
    }
    
    
    
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return searchResults.count
    }
    //MARK: Delegates
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let x = searchResults[row]["Nombre"]
        let myString = String(describing: x)
        return myString
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        let prefs = UserDefaults.standard
        prefs.setValue(searchResults[row]["Nombre"], forKey: "misKm_Cita")
        if let hh = UserDefaults.standard.object(forKey:"misKm_Cita") as? String
        {
            print ("Km:" + hh)
        }
        
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData =  searchResults[row]["Nombre"]!
        let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 15.0)!,NSForegroundColorAttributeName:UIColor.white])
        return myTitle
    }
    
    
    
    
}
