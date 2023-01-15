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
        if let cell = surveyTableView.cellForRow(at: indexPath) as? SurveyTableViewCell {
        surveyViewModel.addCount(indexPath: indexPath.row)
        cell.showMarkImageView()
        surveyTableView.reloadData()
        surveyTableView.isUserInteractionEnabled = false
        } else { return }
    }
    
//    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
//        let cell = surveyTableView.dequeueReusableCell(withIdentifier: "SurveyTableViewCell",
//                                                       for: indexPath) as! SurveyTableViewCell
//        cell.showMarkImageView()
//        surveyTableView.reloadData()
//    }
    
    /*
    нужно отобразить все проценты
    нужна только одна галочка, чтобы другие не могли выбираться
    отобразить в зависомсти от процентов выбора других
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
