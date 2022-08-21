@@ -0,0 +1,145 @@
//
//  SearchViewController.swift
//  StagedCooking
//
//  Created by Logan Melton on 1/4/22.
//

import Foundation
import UIKit

protocol PassingRequest {
  func loadRecipes(for: String)
}

class SearchViewController: UIViewController {
  
  let navigationBar = UINavigationController()
  let imageView = UIImageView()
  let searchView = SearchView()
  var searched: String? {
    return searchView.searchTextField.text
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpButtonActions()
    style()
    layout()
    print(MyList.searchHistory)
    
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    searchView.searchTextField.text = ""
    searchView.errorLabel.isOpaque = true
    
  }
}


extension SearchViewController {
  private func style() {
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = UIImage(systemName: "fork.knife.circle.fill")?.applyingSymbolConfiguration(.preferringMulticolor())
    imageView.contentMode = .scaleAspectFit
    searchView.translatesAutoresizingMaskIntoConstraints = false
  }
  
  private func layout() {
    view.addSubview(imageView)
    NSLayoutConstraint.activate([
      imageView.heightAnchor.constraint(equalToConstant: 125),
      imageView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 5),
      imageView.widthAnchor.constraint(equalTo: view.widthAnchor)
    ])
    
    view.addSubview(searchView)
    NSLayoutConstraint.activate([
      searchView.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 10),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: searchView.trailingAnchor, multiplier: 1),
      searchView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
      searchView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      
      // will not work without this. if removed, textfield and button become unresponsive. not able to find any conflicting constraints
      //      searchView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
      searchView.heightAnchor.constraint(lessThanOrEqualToConstant: (view.frame.height / 4))
    ])
  }
}


extension SearchViewController {
  // MARK: - Show History VC Button
  @objc func showSearchedHistory(sender: UIButton) {
    print(MyList.searchHistory)
    let historyVC = SearchHistoryViewController()
    let navigationController = UINavigationController(rootViewController: historyVC)
    navigationController.modalPresentationStyle = .fullScreen
    navigationController.modalTransitionStyle = .flipHorizontal
    present(navigationController, animated: true)
  }
  
  @objc func showViewedHistory(sender: UIButton) {
    let historyVC = ViewedHistoryViewController()
    let navigationController = UINavigationController(rootViewController: historyVC)
    navigationController.modalPresentationStyle = .fullScreen
    navigationController.modalTransitionStyle = .flipHorizontal
    present(navigationController, animated: true)
  }
  
  // MARK: - Show Search Results
  @objc func searchButtonTapped(sender: UIButton) {
    searchValidation()
  }
  
  private func searchValidation() {
    let listVC = RecipeListTableViewController()
    guard let searched = searched else {
      assertionFailure("searched shouldn't be nil!")
      return
    }
    if searched.isEmpty {
      configureLabel(withMessage: "Search Field Cannot Be Empty")
      return
    } else {
      saveToHistory(searched)
      print(MyList.searchHistory)
      listVC.searchedRecipe = searched
      listVC.leftBarButtonText = "Search"
      if let query = searched.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
        SearchedTerm.searched = query
      }
      let navigationController = UINavigationController(rootViewController: listVC)
      navigationController.modalPresentationStyle = .fullScreen
      navigationController.modalTransitionStyle = .crossDissolve
      present(navigationController, animated: true)
    }
  }
  
  // if searchTextField is blank
  private func configureLabel(withMessage message: String) {
    searchView.errorLabel.isOpaque = false
    searchView.errorLabel.text = message
  }
}

extension SearchViewController {
  private func saveToHistory(_ searched: String) {
    let myList = MyList()
    MyList.searchHistory.insert(searched, at: 0)
    myList.saveChanges()
  }
}


// MARK: - Button Actions
extension SearchViewController {
  func setUpButtonActions() {
    searchView.searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .primaryActionTriggered)
    searchView.showSearchedHistoryButton.addTarget(self, action: #selector(showSearchedHistory), for: .primaryActionTriggered)
    searchView.showViewedHistoryButton.addTarget(self, action: #selector(showViewedHistory), for: .primaryActionTriggered)
  }
}

