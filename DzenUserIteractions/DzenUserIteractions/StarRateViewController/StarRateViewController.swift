import UIKit

class StarRateViewController: UIViewController {
    private var selectedRate: Int = 0
    private let feedbackGenerator = UISelectionFeedbackGenerator()
    
    private let container: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 70
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var starContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = . horizontal
        stackView.distribution = .fillEqually
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didSelectRate))
        stackView.addGestureRecognizer(tapGesture)
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createStars()
        setupUI()
    }
    
    @objc func didSelectRate(gesture: UITapGestureRecognizer) {
        let location = gesture.location(in: starContainer)
        let starWidth = starContainer.bounds.width / CGFloat(Constants.starConts)
        let rate = Int(location.x / starWidth) + 1
        
        if rate != self.selectedRate {
            feedbackGenerator.selectionChanged()
            self.selectedRate = rate
        }
        
        starContainer.arrangedSubviews.forEach { subview in
            guard let starImageView = subview as? UIImageView else {
                return
            }
            starImageView.isHighlighted = starImageView.tag <= rate
        }
    }
    
    private func createStars() {
        for index in 1...Constants.starConts {
            let star = makeStarIcons()
            star.tag = index
            starContainer.addArrangedSubview(star)
        }
    }
    
    private func makeStarIcons() -> UIImageView {
        let imageView = UIImageView(image: UIImage(named: "emptyStar")!,
                                    highlightedImage: UIImage(named: "filledStar")!)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
    
    private func setupUI() {
        view.addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.containerHorizontalInsets).isActive = true
        container.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -Constants.containerHorizontalInsets).isActive = true
        container.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: Constants.containerHorizontalInsets).isActive = true
        
        starContainer.translatesAutoresizingMaskIntoConstraints = false
        starContainer.heightAnchor.constraint(equalToConstant: Constants.starContainerHeight).isActive = true
        
        container.addArrangedSubview(starContainer)
    }
    
    private struct Constants {
        static let starConts: Int = 5
        static let containerHorizontalInsets: CGFloat = 20
        static let starContainerHeight: CGFloat = 40
    }
}
