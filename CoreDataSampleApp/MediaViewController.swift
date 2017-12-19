
import UIKit


class MediaViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var tblView: UITableView!
    
    var countriesArray:[String] = ["India", "Aus", "pak" ,"eng" , "sri" , "wi" , "nz"]
    
    var searchedArray:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.delegate =  self
        tblView.dataSource = self
        searchedArray = countriesArray
        searchBar.addTarget(self, action: #selector(searchRecordsAsPerText(_ :)), for: .editingChanged)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchedArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = searchedArray[indexPath.row]
        return cell!
    }
    func searchRecordsAsPerText(_ textfield:UITextField) {
        searchedArray.removeAll()
        if textfield.text?.characters.count != 0 {
            for strCountry in countriesArray {
                let range = strCountry.lowercased().range(of: textfield.text!, options: .caseInsensitive, range: nil,   locale: nil)
                
                if range != nil {
                    searchedArray.append(strCountry)
                }
            }
        } else {
            searchedArray = countriesArray
        }
        self.tblView?.reloadData()
    }
    
}
