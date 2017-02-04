//
//  AsesorViewController.swift
//  MiAsesorAutomotriz
//
//  Created by MODESTO VASCO FORNAS on 2/2/17.
//  Copyright © 2017 Modesto Vasco. All rights reserved.
//

import UIKit

class AsesorViewController: UIViewController, UISearchBarDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
   


   
    
    @IBOutlet weak var pickerAsesores: UIPickerView!
    
    
    @IBOutlet weak var agenciaLabel: UILabel!
    
    
    var searchResults = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       
      
        
        pickerAsesores.dataSource = self
        pickerAsesores.delegate = self
        
        if let x = UserDefaults.standard.object(forKey:"miAgencia") as? String
        {
            agenciaLabel.text = x
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        doSearch("")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
  
    func doSearch(_ searchWord: String)
    {
        // Dismiss the keyboard
   
        
        // Create URL
        let myUrl = URL(string: "http://www.miasesorautomotriz.com/php_ios/scripts/getAsesores.php")
        
        // Create HTTP Request
        let request = NSMutableURLRequest(url:myUrl!);
        request.httpMethod = "POST";
        
        let postString = "searchWord=\(searchWord)";
        
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
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
                            for friendObj in friends
                            {
                                let fullName = (friendObj["nombre"] as! String) + " " + (friendObj["apellidos"] as! String)
                                
                                self.searchResults.append(fullName)
                            }
                            
                        
                            self.pickerAsesores.reloadAllComponents()
                            
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
        return searchResults[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print (searchResults[row])
        
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = searchResults[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 15.0)!,NSForegroundColorAttributeName:UIColor.white])
        return myTitle
    }
    
}
