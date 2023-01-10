import UIKit

class InsertTextViewController: UIViewController {
    private let answerOptionsViewModel = InsertTextViewModel()
    @IBOutlet private var taskTextField: UITextField!
    @IBOutlet private var answerOptionCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollection()
    }
    
    private func setupCollection() {
        answerOptionCollectionView.dragDelegate = self
        answerOptionCollectionView.dropDelegate = self
        answerOptionCollectionView.dragInteractionEnabled = true
        answerOptionCollectionView.delegate = self
        answerOptionCollectionView.dataSource = self
        answerOptionCollectionView.register(UINib(nibName: "AnswerOptionCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AnswerOptionCollectionViewCell")
    }
}

extension InsertTextViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return answerOptionsViewModel.answerOptionsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = answerOptionCollectionView.dequeueReusableCell(withReuseIdentifier: "AnswerOptionCollectionViewCell", for: indexPath) as! AnswerOptionCollectionViewCell
        cell.setupCell(optionName: self.answerOptionsViewModel.answerOptionsArray[indexPath.item], height: 20)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 50)
        
    }
}

// настройка перетягивания

extension InsertTextViewController: UICollectionViewDragDelegate, UICollectionViewDropDelegate {
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        return [UIDragItem]()
    }
    
    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
        
    }
    
    
}
