//
//  AsesorViewController.swift
//  MiAsesorAutomotriz
//
//  Created by MODESTO VASCO FORNAS on 2/2/17.
//  Copyright © 2017 Modesto Vasco. All rights reserved.
//

import UIKit

class AsesorViewController: UIViewController,UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    @IBOutlet weak var mySearchBar: UISearchBar!
    @IBOutlet weak var myTableView: UITableView!
    
    
    
    
    var searchResults = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        doSearch("")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return searchResults.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        myCell.textLabel?.text = searchResults[indexPath.row]
        
        return myCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("Did select is called \(indexPath.row)")
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        print("User typed \(searchBar.text) ")
        
        doSearch(searchBar.text!)
    }
    
    
    func doSearch(_ searchWord: String)
    {
        // Dismiss the keyboard
        mySearchBar.resignFirstResponder()
        
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
                    self.myTableView.reloadData()
                    
                    // If friends array is not empty, populate searchResults array
                    if let parseJSON = json {
                        
                        if let friends  = parseJSON["friends"] as? [AnyObject]
                        {
                            for friendObj in friends
                            {
                                let fullName = (friendObj["nombre"] as! String) + " " + (friendObj["apellidos"] as! String)
                                
                                self.searchResults.append(fullName)
                            }
                            
                            self.myTableView.reloadData()
                            
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
    
    @IBAction func cancelButtonTapped(_ sender: AnyObject) {
        
        mySearchBar.text = ""
        mySearchBar.resignFirstResponder()
        searchResults.removeAll(keepingCapacity: false)
        myTableView.reloadData()
        doSearch("")
    }
    
    
}
