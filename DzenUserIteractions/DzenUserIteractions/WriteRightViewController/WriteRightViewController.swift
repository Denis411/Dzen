import UIKit

class WriteRightViewController: UIViewController {
    private let viewModel = WrightRightViewModel()
    @IBOutlet private var resulNameLabel: UILabel!
    @IBOutlet private var descriptionNameLabel: UILabel!
    @IBOutlet private var taskCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        getAllTextFieldText(collectionView: taskCollectionView)
    }
    private func setup() {
        self.descriptionNameLabel.layer.cornerRadius = 20
        self.taskCollectionView.delegate = self
        self.taskCollectionView.dataSource = self
        self.taskCollectionView.register(UINib(nibName: "TextPartCollectionViewCell",
                                               bundle: nil), forCellWithReuseIdentifier: "TextPartCollectionViewCell")
        self.taskCollectionView.register(UINib(nibName: "WriteOptionTextCollectionViewCell",
                                               bundle: nil), forCellWithReuseIdentifier: "WriteOptionTextCollectionViewCell")
    }
}

extension WriteRightViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.taskArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 || indexPath.item == 4 {
            let cell = taskCollectionView.dequeueReusableCell(withReuseIdentifier: "WriteOptionTextCollectionViewCell", for: indexPath) as! WriteOptionTextCollectionViewCell
            cell.layer.borderWidth = 0.5
            cell.layer.cornerRadius = 10
            return cell
        } else {
            let cell = taskCollectionView.dequeueReusableCell(withReuseIdentifier: "TextPartCollectionViewCell", for: indexPath) as! TextPartCollectionViewCell
            cell.setupCell(name: viewModel.taskArray[indexPath.item])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0 || indexPath.item == 4 {
        return CGSize(width: 108, height: 28)
        } else {
        let size = CGSize(width: 120, height: 50)
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)]
        let estimatedFrame = NSString(string: viewModel.taskArray[indexPath.item]).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        return CGSize(width: estimatedFrame.width, height: estimatedFrame.height)
        }
    }
}

extension WriteRightViewController {
    func getAllTextFieldText(collectionView: UICollectionView) {
        for i in 0...viewModel.taskArray.count {
            let indexPath = IndexPath(item: i, section: 0)
            if let cell = taskCollectionView.cellForItem(at: indexPath) as? WriteOptionTextCollectionViewCell {
                if cell.writeOptionTextField.text == viewModel.taskArray[i]  {
                    descriptionNameLabel.text = "Отличная работа!"
                } else {
                    descriptionNameLabel.text = "Пропробуй еще"
                }
            }
        }
    }

}

