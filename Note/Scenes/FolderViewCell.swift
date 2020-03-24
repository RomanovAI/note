//
//  FolderViewCell.swift
//  Note
//
//  Created by Артем Романов on 18.03.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import UIKit

class FolderViewCell: UITableViewCell {
    
    
    var tableCellModel: FolderCellModel? {
        willSet(model) {
            guard let model = model else { return }
            titleLabel.text = model.title
            countLabel.text = model.count
        }
    }

    
    @IBOutlet weak var picture: UIImageView! {
        didSet {
            picture.tintColor = .yellow
            picture.image = UIImage(named: "folder2")
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .gray
        backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        accessoryType = .disclosureIndicator
    }
    
    
}
