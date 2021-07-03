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
    @IBOutlet weak var ownerAvater: UIImageViewAsync!
    var repo : Values? {
        didSet {
            repositoriesOwnerTitleLabel.text = repo?.owner?.display_name
            repositoriesOwnerTypeLabel.text = repo?.owner?.type
            repositoriesCreationDdate.text = repo?.created_on
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
