@@ -0,0 +1,70 @@
//
//  ViewedHistoryViewController.swift
//  StagedCooking
//
//  Created by Logan Melton on 1/15/22.
//

import UIKit



class ViewedHistoryViewController: UITableViewController {
  
  let myList = MyList()
  var viewedKeys = [Int]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "viewedRecipe")
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Search", style: .plain, target: self, action: #selector(dismissHistory))
    myList.loadData()
    print( MyList.viewedRecipes)
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return MyList.viewedRecipes.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "viewedRecipe", for: indexPath)
    var config = cell.defaultContentConfiguration()
    config.text = String(describing: MyList.viewedRecipes[indexPath.row].title)
    cell.contentConfiguration = config
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    // show recipe
    print("poop")
  }
  
}

extension ViewedHistoryViewController {
  private func searchFromHistoryList(recipeID: Int) {
    let recipeVC = RecipeViewController()
    recipeVC.recipeID = recipeID
    let navigationController = UINavigationController(rootViewController: recipeVC)
    navigationController.modalPresentationStyle = .fullScreen
    navigationController.modalTransitionStyle = .crossDissolve
    present(navigationController, animated: true)
  }
}

extension ViewedHistoryViewController {
  @objc func dismissHistory() {
    self.dismiss(animated: true)
  }
}

//extension ViewedHistoryViewController {
//  func getRecipeIDs() {
//    for (key, _) in MyList.viewedRecipes {
//      viewedKeys.append(key)
//      printContent(key)
//    }
//  }
//}

