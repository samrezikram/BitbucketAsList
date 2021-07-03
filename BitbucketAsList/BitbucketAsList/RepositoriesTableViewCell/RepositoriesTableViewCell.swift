//
//  RepositoriesTableViewCell.swift
//  BitbucketAsList
//
//  Created by Samrez Ikram on 03/07/2021.
//
import UIKit

public class RepositoriesTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var repositoriesOwnerTitleLabel: UILabel!
    @IBOutlet weak var repositoriesOwnerTypeLabel: UILabel!
    @IBOutlet weak var repositoriesCreationDdate: UILabel!
    
    var news : Values? {
        didSet {
            repositoriesOwnerTitleLabel.text = news?.owner?.display_name
            repositoriesOwnerTypeLabel.text = news?.owner?.type
            repositoriesCreationDdate.text = news?.created_on
        }
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
