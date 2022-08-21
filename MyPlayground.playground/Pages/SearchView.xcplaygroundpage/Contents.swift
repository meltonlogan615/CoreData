@@ -0,0 +1,104 @@
//
//  SearchView.swift
//  StagedCooking
//
//  Created by Logan Melton on 1/4/22.
//

import Foundation
import UIKit

class SearchView: UIView {
  
  let stackView = UIStackView()
  let historyStack = UIStackView()
  let searchTextField = UITextField()
  let searchButton = UIButton(type: .system)
  let errorLabel = UILabel()
  let showSearchedHistoryButton = UIButton(type: .system)
  let showViewedHistoryButton = UIButton(type: .system)
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    style()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

extension SearchView {
  
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
    
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.spacing = 32
    
    searchTextField.translatesAutoresizingMaskIntoConstraints = false
    searchTextField.placeholder = "Search For Food"
    searchTextField.textAlignment = .center
    searchTextField.backgroundColor = .secondarySystemBackground
    searchTextField.font = .systemFont(ofSize: 24)
    searchTextField.isSecureTextEntry = false
    searchTextField.delegate = self
    searchTextField.layer.cornerRadius = 5
    searchButton.clipsToBounds = true
    
    searchButton.translatesAutoresizingMaskIntoConstraints = false
    searchButton.configuration = .filled()
    searchButton.setTitle("Search", for: [])
    
    errorLabel.translatesAutoresizingMaskIntoConstraints = false
    errorLabel.numberOfLines = 0
    errorLabel.textColor = .systemRed
    errorLabel.textAlignment = .center
    errorLabel.isOpaque = true
    
    historyStack.translatesAutoresizingMaskIntoConstraints = false
    historyStack.axis = .horizontal
    historyStack.spacing = 8
    historyStack.distribution = .equalSpacing
    
    showSearchedHistoryButton.translatesAutoresizingMaskIntoConstraints = false
    showSearchedHistoryButton.setTitle("Show Search History", for: [])
    
    showViewedHistoryButton.translatesAutoresizingMaskIntoConstraints = false
    showViewedHistoryButton.setTitle("Show Viewed Recipes", for: [])
    
  }
  
  func layout() {
    stackView.addArrangedSubview(searchTextField)
    stackView.addArrangedSubview(searchButton)
    stackView.addArrangedSubview(historyStack)
    historyStack.addArrangedSubview(showSearchedHistoryButton)
    historyStack.addArrangedSubview(showViewedHistoryButton)
    stackView.addArrangedSubview(errorLabel)
    
    addSubview(stackView)
    NSLayoutConstraint.activate([
      trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2),
      stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
    ])
  }
}

// MARK: - UITextFieldDelegate
extension SearchView: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    searchTextField.endEditing(true)
    searchTextField.resignFirstResponder()
    return true
  }
  func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
    return true
  }
  
  func textFieldDidEndEditing(_ textField: UITextField) {
  }
}
