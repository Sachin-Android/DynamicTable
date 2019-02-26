
//
//  ListViewController.swift
//  DynamicHeight
//
//  Created by WIthYouHamesh on 19/02/19.
//  Copyright © 2019 SachinDaingade. All rights reserved.
//

import UIKit
import FoldingCell

class ListViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var tblList: UITableView!
    
    
    enum Const {
        static let closeCellHeight: CGFloat = 140
        static let openCellHeight: CGFloat = 400
        static let rowsCount = 10
    }
    
    var cellHeights: [CGFloat] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        self.tblList.register(UINib.init(nibName: "ExpandTableViewCell", bundle: nil), forCellReuseIdentifier: "FoldingCell")
        setup()
        
        // Do any additional setup after loading the view.
        //   self.tblList.register(UINib.init(nibName: "ListCell", bundle: nil), forCellReuseIdentifier: "Cell")
        //   tblList.estimatedRowHeight = 80
        // tblList.rowHeight = UITableView.automaticDimension
    }
    
    
    
    private func setup() {
        cellHeights = Array(repeating: Const.closeCellHeight, count: Const.rowsCount)
        self.tblList.estimatedRowHeight = Const.closeCellHeight
        self.tblList.rowHeight = UITableView.automaticDimension
       // self.tblList.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "dd_xuv300"))
        if #available(iOS 10.0, *) {
            self.tblList.refreshControl = UIRefreshControl()
            tblList.refreshControl?.addTarget(self, action: #selector(refreshHandler), for: .valueChanged)
        }
    }
    
    @objc func refreshHandler() {
        let deadlineTime = DispatchTime.now() + .seconds(1)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime, execute: { [weak self] in
            if #available(iOS 10.0, *) {
                self?.tblList.refreshControl?.endRefreshing()
            }
            self?.tblList.reloadData()
        })
    }
    
    
    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //
    //        return UITableView.automaticDimension
    //    }
    //
    //
    //    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //
    //     //   tableView.estimatedRowHeight = 80.0 // standard tableViewCell height
    //        //tableView.rowHeight = UITableView.automaticDimension
    //        return 5
    //
    //
    //    }
    //
    //
    //    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
    //    {
    //        return   UITableView.automaticDimension
    //    }
    //
    //
    //
    //    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //
    //        let cell  = tableView.dequeueReusableCell(withIdentifier: "Cell") as! ListCell
    //
    //        cell.lblTitle.text = "Test Sachin Daingade";
    //        return cell;
    //
    //    }
    //
    //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //
    //
    //    }
    
    
    
    
    
    
     func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int
     {
        return 10
    }
    
     func tableView(_: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
     {
        
        if (indexPath.row % 2) == 0
        {
            cell.alpha = 0
            let transform = CATransform3DTranslate(CATransform3DIdentity, -250, 0, 0)
            cell.layer.transform = transform
            UIView.animate(withDuration: 1.0, animations: {
                cell.alpha = 1.0
                cell.layer.transform = CATransform3DIdentity
            })
        }else{
            cell.alpha = 0
            let transform = CATransform3DTranslate(CATransform3DIdentity, 250, 0, 0)
            cell.layer.transform = transform
            UIView.animate(withDuration: 1.0, animations: {
                cell.alpha = 1.0
                cell.layer.transform = CATransform3DIdentity
            })
        }
        
        
        guard case let cell as ExpandTableViewCell = cell else {
            return
        }
        
        cell.backgroundColor = .clear
        
        if cellHeights[indexPath.row] == Const.closeCellHeight {
            cell.unfold(false, animated: false, completion: nil)
        } else {
            cell.unfold(true, animated: false, completion: nil)
        }
        
        //cell.number = indexPath.row
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
     {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoldingCell", for: indexPath) as! FoldingCell
        let durations: [TimeInterval] = [0.26, 0.2, 0.2]
        cell.durationsForExpandedState = durations
        cell.durationsForCollapsedState = durations
        return cell
    }
    
     func tableView(_: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
     {
        return cellHeights[indexPath.row]
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! FoldingCell
        
        if cell.isAnimating() {
            return
        }
        
        var duration = 0.0
        let cellIsCollapsed = cellHeights[indexPath.row] == Const.closeCellHeight
        if cellIsCollapsed {
            cellHeights[indexPath.row] = Const.openCellHeight
            cell.unfold(true, animated: true, completion: nil)
            duration = 0.5
        } else {
            cellHeights[indexPath.row] = Const.closeCellHeight
            cell.unfold(false, animated: true, completion: nil)
            duration = 0.8
        }
        
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: { () -> Void in
            tableView.beginUpdates()
            tableView.endUpdates()
        }, completion: nil)
    }
    
    
}
