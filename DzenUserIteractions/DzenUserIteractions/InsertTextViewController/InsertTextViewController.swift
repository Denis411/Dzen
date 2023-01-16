import UIKit

class InsertTextViewController: UIViewController {
    private let insertTexViewModel = InsertTextViewModel()
    
    @IBOutlet var taskColletcionView: UICollectionView!
    @IBOutlet private var answerOptionCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollection()
    }
    
    private func setupCollection() {
        taskColletcionView.delegate = self
        taskColletcionView.dataSource = self
        taskColletcionView.register(UINib(nibName: "AnswerOptionCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AnswerOptionCollectionViewCell")
        answerOptionCollectionView.delegate = self
        answerOptionCollectionView.dataSource = self
        answerOptionCollectionView.register(UINib(nibName: "AnswerOptionCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AnswerOptionCollectionViewCell")
    }
    
    @objc private func touched(_ gestureRecognizer: UIPanGestureRecognizer) {
        if let touchedView = gestureRecognizer.view {
            
            if gestureRecognizer.state == .began {
                let beginningPosition = gestureRecognizer.location(in: touchedView)
            } else if gestureRecognizer.state == .changed {
                let locationInView = gestureRecognizer.location(in: touchedView)
                let newX = touchedView.center.x + locationInView.x
                let newY = touchedView.center.y + locationInView.y
                touchedView.frame.origin = CGPoint(x: newX, y: newY)
                gestureRecognizer.setTranslation(CGPoint.zero, in: touchedView)
            }
        }
    }
}

extension InsertTextViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case taskColletcionView: return insertTexViewModel.taskArray.count
        case answerOptionCollectionView: return insertTexViewModel.answerOptionsArray.count
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
            // TaskCollection
        case taskColletcionView:
            let cell = taskColletcionView.dequeueReusableCell(withReuseIdentifier: "AnswerOptionCollectionViewCell", for: indexPath) as! AnswerOptionCollectionViewCell
            if indexPath.item == 1 || indexPath.item == 4 {
                cell.setupTaskCell(taskWordName: changeTaskName(taskName: insertTexViewModel.taskArray[indexPath.item]))
            } else {
                cell.setupTaskCell(taskWordName: self.insertTexViewModel.taskArray[indexPath.item])
            }
            return cell
            // AnswerCollection
        case answerOptionCollectionView:
            let gertureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(touched))
            let cell = answerOptionCollectionView.dequeueReusableCell(withReuseIdentifier: "AnswerOptionCollectionViewCell", for: indexPath) as! AnswerOptionCollectionViewCell
            cell.setupAnswerCell(optionName: self.insertTexViewModel.answerOptionsArray[indexPath.item])
            
            cell.addGestureRecognizer(gertureRecognizer)
            return cell
            
        default: return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case taskColletcionView:
            let size = CGSize(width: 100, height: 30)
            let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)]
            let estimatedFrame = NSString(string: insertTexViewModel.taskArray[indexPath.row]).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
            return CGSize(width: estimatedFrame.width, height: estimatedFrame.height)
            
        case answerOptionCollectionView:
            let size = CGSize(width: 100, height: 50)
            let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)]
            let estimatedFrame = NSString(string: insertTexViewModel.answerOptionsArray[indexPath.row]).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
            return CGSize(width: estimatedFrame.width + 10, height: estimatedFrame.height + 5)
            
        default: return CGSize(width: 100, height: 100)
        }
    }
}

extension InsertTextViewController {
    private func changeTaskName(taskName: String) -> String {
        let letters = taskName
        var result = ""
        let start = letters.startIndex
        let end = letters.endIndex
        for _ in letters {
        result += letters.replacingCharacters(in: start..<end, with: "_")
        }
        return(result)
    }
}

