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
            cell.setupCell(optionName: self.insertTexViewModel.taskArray[indexPath.item], height: 20)
            return cell
            // AnswerCollection
        case answerOptionCollectionView:
            let gertureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(touched))
            let cell = answerOptionCollectionView.dequeueReusableCell(withReuseIdentifier: "AnswerOptionCollectionViewCell", for: indexPath) as! AnswerOptionCollectionViewCell
            cell.setupCell(optionName: self.insertTexViewModel.answerOptionsArray[indexPath.item], height: 20)
            cell.addGestureRecognizer(gertureRecognizer)
            return cell
            
        default: return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 50)
    }
}
