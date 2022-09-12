//
//  CustomTableViewCell.swift
//  Closures
//
//  Created by Pawan iOS on 06/09/2022.
//  Copyright © 2022 Ninesol Tech. All rights reserved.
//

import UIKit

class  CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var moviesName: UILabel!
    @IBOutlet weak var checkBox: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
                
        checkBox.isHidden = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    class func  CellRegister(tableView : UITableView, indexPath: IndexPath) -> CustomTableViewCell {
        
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        return cell
    }
}
