import UIKit

class AnswerOptionCollectionViewCell: UICollectionViewCell {

    @IBOutlet private var answerOptionNameLabel: UILabel!
    @IBOutlet private var answerOptionView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
//    func getLabelWidth() -> (CGFloat) {
//        return answerOptionNameLabel.frame.greatestFiniteMagnitude
//    }
    
    func setupCell(optionName: String, height: CGFloat) {
        answerOptionNameLabel.text = optionName
        answerOptionView.layer.cornerRadius = height
        answerOptionView.layer.borderWidth = 1
    }
}
