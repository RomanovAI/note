//
//  NoteViewCell.swift
//  Note
//
//  Created by Артем Романов on 19.03.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import UIKit

class NoteViewCell: UITableViewCell {

    var tableCellModel: NoteCellModel? {
        willSet(model) {
            guard let model = model else { return }
            titleLabel.text = model.title
            dateLabel.text = model.date
            subtitleLabel.text = model.subtitle
        }
    }
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .gray
        backgroundColor = UIColor.backgroundColor
    }
    
}
