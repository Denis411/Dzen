import UIKit

class TextPartCollectionViewCell: UICollectionViewCell {
    @IBOutlet var taskWordNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setupCell(name: String) {
        taskWordNameLabel.text = name
    }
}
