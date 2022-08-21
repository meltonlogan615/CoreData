@@ -0,0 +1,70 @@
//
//  HistoryViewController.swift
//  StagedCooking
//
//  Created by Logan Melton on 1/14/22.
//

import UIKit

class SearchHistoryViewController: UITableViewController {
  
  let myHistory = MyList()
  
  var searched = String()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    myHistory.loadData()
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "historyCell")
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Search", style: .plain, target: self, action: #selector(dismissHistory))
    style()
    layout()
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return MyList.searchHistory.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath)
    var config = cell.defaultContentConfiguration()
    config.text = MyList.searchHistory[indexPath.row]
    cell.contentConfiguration = config
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    searchFromHistoryList(searched: MyList.searchHistory[indexPath.row])
  }
  
}

extension SearchHistoryViewController {
  
  func style() {
  }
  
  func layout() {
    
  }
}

extension SearchHistoryViewController {
  @objc func dismissHistory(sender: UIButton) {
    self.dismiss(animated: true)
  }
  
  private func searchFromHistoryList(searched: String) {
    let listVC = RecipeListTableViewController()
    listVC.searchedRecipe = searched
    if let query = searched.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
      SearchedTerm.searched = query
    }
    listVC.leftBarButtonText = "History"
    let navigationController = UINavigationController(rootViewController: listVC)
    navigationController.modalPresentationStyle = .fullScreen
    navigationController.modalTransitionStyle = .crossDissolve
    present(navigationController, animated: true)
  }
}
