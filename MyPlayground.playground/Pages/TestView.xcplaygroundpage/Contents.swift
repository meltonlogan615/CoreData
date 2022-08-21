@@ -0,0 +1,39 @@
//
//  00-TestViewController.swift
//  StagedCooking
//
//  Created by Logan Melton on 1/13/22.
//

import Foundation
import UIKit

class TestViewController: UIViewController {
  
  let testView = SearchView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    style()
    layout()
  }
  
  
}

extension TestViewController {
  
  func style() {
    testView.translatesAutoresizingMaskIntoConstraints = false
    testView.backgroundColor = .orange
  }
  
  func layout() {
    view.addSubview(testView)
    NSLayoutConstraint.activate([
      testView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      testView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor)
    ])
  }
}
