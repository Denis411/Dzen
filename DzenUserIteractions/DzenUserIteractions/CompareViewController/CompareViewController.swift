import UIKit

class CompareViewController: UIViewController {

    @IBOutlet private var firstTableView: UITableView!
    @IBOutlet private var secondTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    private func setup() {
        firstTableView.delegate = self
        firstTableView.dataSource = self
        secondTableView.delegate = self
        secondTableView.dataSource = self
        firstTableView.register(UINib(nibName: "CompareTableViewCell", bundle: nil), forCellReuseIdentifier: "CompareTableViewCell")
        secondTableView.register(UINib(nibName: "CompareTableViewCell", bundle: nil), forCellReuseIdentifier: "CompareTableViewCell")
    }
}

extension CompareViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}
