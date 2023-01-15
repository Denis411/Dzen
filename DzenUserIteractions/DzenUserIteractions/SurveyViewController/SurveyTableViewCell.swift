import UIKit

class SurveyTableViewCell: UITableViewCell {
    
    @IBOutlet private var choiseNameLabel: UILabel!
    @IBOutlet private var percentOfChoiseNameLabel: UILabel!
    @IBOutlet private var markImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func showChoisePercents() {
        percentOfChoiseNameLabel.isHidden = false
    }
    
    func showMarkImageView() {
        self.markImageView.isHidden = false
    }
    
    func setupCell(choiseName: String, percentOfChoise: Int) {
        markImageView.isHidden = true
        percentOfChoiseNameLabel.isHidden = true
        choiseNameLabel.text = choiseName
        percentOfChoiseNameLabel.text = String(percentOfChoise) + "%"
    }
}
