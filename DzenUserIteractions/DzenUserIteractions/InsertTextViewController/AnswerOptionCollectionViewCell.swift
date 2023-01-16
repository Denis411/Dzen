import UIKit

class AnswerOptionCollectionViewCell: UICollectionViewCell {

    @IBOutlet private var answerOptionNameLabel: UILabel!
    @IBOutlet private var answerOptionView: UIView!
        
    override func awakeFromNib() {
         super.awakeFromNib()

     }

    func setupTaskCell(taskWordName: String) {
        answerOptionNameLabel.text = taskWordName
    }
    
    func setupAnswerCell(optionName: String) {
        answerOptionNameLabel.text = optionName
        answerOptionView.layer.cornerRadius = 5
        answerOptionView.layer.borderWidth = 1
    }
}
