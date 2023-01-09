import UIKit

class CompareViewController: UIViewController {

    @IBOutlet private var firstTableView: UITableView!
    @IBOutlet private var secondTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    private func setup() {
        firstTableView.register(UINib(nibName: "CompareTableViewCell", bundle: nil), forCellReuseIdentifier: "CompareTableViewCell")
        firstTableView.delegate = self
        firstTableView.dataSource = self
        secondTableView.register(UINib(nibName: "CompareTableViewCell", bundle: nil), forCellReuseIdentifier: "CompareTableViewCell")
        secondTableView.delegate = self
        secondTableView.dataSource = self
    }
}

extension CompareViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case firstTableView: return 1
        case secondTableView: return 1
        default: return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView {
        case firstTableView: let cell = firstTableView.dequeueReusableCell(withIdentifier: "CompareTableViewCell", for: indexPath) as! CompareTableViewCell
            return cell
        case secondTableView: let cell = secondTableView.dequeueReusableCell(withIdentifier: "CompareTableViewCell", for: indexPath) as! CompareTableViewCell
            return cell
        default: return UITableViewCell()
        }
    }
}
