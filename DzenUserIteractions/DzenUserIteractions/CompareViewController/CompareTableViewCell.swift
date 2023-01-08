import UIKit

class CompareTableViewCell: UITableViewCell {

    @IBOutlet private var compareView: UIView!
    @IBOutlet private var compareNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func setup(name: String) {
        compareView.layer.cornerRadius = 25
        compareView.layer.borderWidth = 2
        compareNameLabel.text = name
    }
}
