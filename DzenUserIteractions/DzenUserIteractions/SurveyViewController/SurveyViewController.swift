import UIKit

class SurveyViewController: UIViewController {
    private var surveyViewModel = SurveyViewModel()
    @IBOutlet private var questionNumberNameLabel: UILabel!
    @IBOutlet private var surveyNumberNameLabel: UILabel!
    @IBOutlet private var surveyTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private func setup() {
        self.surveyTableView.delegate = self
        self.surveyTableView.dataSource = self
        self.surveyTableView.register(UINib(nibName: "SurveyTableViewCell",
                                            bundle: nil), forCellReuseIdentifier: "SurveyTableViewCell")
    }
}

extension SurveyViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        guard let cell = tableView.cellForRow(at: indexPath) as? SurveyTableViewCell else { return }
        cell.showMarkImageView()
        
        //         not surverTableView
//         if let cell = surveyTableView.cellForRow(at: indexPath) as? SurveyTableViewCell {
//             cell.showMarkImageView()
//             this logic must be in showMarkImageView()
//             surveyTableView.setNeedsLayout()
//             surveyTableView.layoutIfNeeded()
//             surveyTableView.isUserInteractionEnabled = false
        }
    }
    
    /*
     нужно отобразить все проценты
     */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        surveyViewModel.surveyArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = surveyTableView.dequeueReusableCell(withIdentifier: "SurveyTableViewCell",
                                                       for: indexPath) as! SurveyTableViewCell
        cell.setupCell(choiseName: surveyViewModel.surveyArray[indexPath.row].0,
                       percentOfChoise: Int(surveyViewModel.getChoisePercents(indexPath: indexPath.row)))
        
        return cell
    }
}
