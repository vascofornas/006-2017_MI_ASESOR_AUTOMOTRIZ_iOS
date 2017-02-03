//
//  AsesorViewController.swift
//  MiAsesorAutomotriz
//
//  Created by MODESTO VASCO FORNAS on 2/2/17.
//  Copyright © 2017 Modesto Vasco. All rights reserved.
//

import UIKit

class AsesorViewController: UIViewController,UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
       

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    
    {
        return 1
    }
   
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell

    {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell",for: indexPath)
        myCell.textLabel?.text = "probando"
        myCell.textLabel?.textColor = UIColor.gray
      
        myCell.textLabel?.font = UIFont(name:"Avenir", size:22)
        return myCell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print ("He pulsado la celda \(indexPath.row)")
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        print ("USre typed \(searchBar.text)")
    }
}
