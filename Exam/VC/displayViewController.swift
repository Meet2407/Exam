import UIKit

class displayViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var texts: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let cell = textField.superview?.superview as? displayTableViewCell,
           let indexPath = tableView.indexPath(for: cell) {
            texts[indexPath.row] = textField.text ?? ""
        }
    }
}

extension displayViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return texts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! displayTableViewCell
        cell.first.text = texts[indexPath.row]
        cell.first.isUserInteractionEnabled = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}
