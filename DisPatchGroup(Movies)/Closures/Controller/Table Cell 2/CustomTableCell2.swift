//
//  CustomTableCell2.swift
//  Closures
//
//  Created by Pawan iOS on 06/09/2022.
//  Copyright © 2022 Ninesol Tech. All rights reserved.
//

import UIKit

class CustomTableCell2: UITableViewCell {

    @IBOutlet weak var moviesName: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    class func  CellRegister(tableView : UITableView, indexPath: IndexPath) -> CustomTableCell2 {
        
        tableView.register(UINib(nibName: "CustomTableCell2", bundle: nil), forCellReuseIdentifier: "Cell")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableCell2
        
        return cell
    }
    
}
