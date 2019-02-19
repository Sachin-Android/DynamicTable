
//
//  ListViewController.swift
//  DynamicHeight
//
//  Created by WIthYouHamesh on 19/02/19.
//  Copyright © 2019 SachinDaingade. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tblList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tblList.register(UINib.init(nibName: "ListCell", bundle: nil), forCellReuseIdentifier: "Cell")
        tblList.estimatedRowHeight = 80
        tblList.rowHeight = UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
     //   tableView.estimatedRowHeight = 80.0 // standard tableViewCell height
        //tableView.rowHeight = UITableView.automaticDimension
        return 5
        
        
    }
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return   UITableView.automaticDimension
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell  = tableView.dequeueReusableCell(withIdentifier: "Cell") as! ListCell
        
        cell.lblTitle.text = "Test Sachin Daingade";
        return cell;
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    

}
