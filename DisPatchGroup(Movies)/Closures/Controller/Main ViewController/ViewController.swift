
//
//  ViewController.swift
//  Closures
//
//  Created by Ninesol Tech on 17/08/2022.
//  Copyright © 2022 Ninesol Tech. All rights reserved.
//

import UIKit


class ViewController: UIViewController{
    
    @IBOutlet weak var tbView: UITableView!
    @IBOutlet weak var tbView2: UITableView!
    @IBOutlet weak var pendingLabel: UILabel!
    @IBOutlet weak var downloadLabel: UILabel!
    
    let group = DispatchGroup()
    
    var counter = [Int]()
    
    var imagesArray = [UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3"),UIImage(named: "1"),UIImage(named: "2"),UIImage(named: "3"),]
    
    var moviesName = ["Hindi" ,"Punjabi", "Tamail","South" ,"Tollywood", "Saraki"]
    
    
    var newArray = [UIImage]()
    var newName = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pendingLabel.text = "Pending Movies (\(self.imagesArray.count))"
        self.downloadLabel.text = "Download Movies (\(self.newArray.count))"
        
        tbView.delegate = self
        tbView.dataSource = self
        
        tbView2.delegate = self
        tbView2.dataSource = self
    }
    
    @IBAction func startButtonTap(_ sender: UIButton) {
        
        for i in counter {
            Thread.sleep(forTimeInterval: 1)
            group.enter()
            newArray.append(imagesArray[i]!)
            newName.append(moviesName[i])
            
            moviesName.remove(at: i)
            imagesArray.remove(at: i)
            group.leave()
        }
        
        group.notify(queue: .main) { [self] in
            self.alertUser(strTitle: "Alert", strMessage: "All Images Downloaded", viewController: self)
            self.pendingLabel.text = "Pending Movies (\(self.imagesArray.count))"
            self.downloadLabel.text = "Download Movies (\(self.newArray.count))"
        }
        counter.removeAll()
        self.tbView.reloadData()
        self.tbView2.reloadData()
        
    }
    
    public func alertUser(strTitle: String, strMessage: String, viewController: UIViewController) {
        let myAlert = UIAlertController(title: strTitle, message: strMessage, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        myAlert.addAction(okAction)
        viewController.present(myAlert, animated: true, completion: nil)
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tbView {
            return imagesArray.count
            
        } else {
            return newArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == tbView {
            
            let cell = CustomTableViewCell.CellRegister(tableView: tableView, indexPath: indexPath)
            cell.profileImage.image = imagesArray[indexPath.row]
            cell.moviesName.text = moviesName[indexPath.row]
            cell.checkBox.isHidden  = true
            return cell
            
        } else  {
            let cell = CustomTableCell2.CellRegister(tableView: tableView, indexPath: indexPath)
            cell.profileImage.image = newArray[indexPath.row]
            cell.moviesName.text = newName[indexPath.row]
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        counter.append(indexPath.row)
        
        let cell = tableView.cellForRow(at: indexPath) as! CustomTableViewCell
        cell.checkBox.isHidden = false
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
