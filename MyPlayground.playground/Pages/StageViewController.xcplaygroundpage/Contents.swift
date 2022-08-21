@@ -0,0 +1,62 @@
//
//  StagesContainerViewController.swift
//  StagedCooking
//
//  Created by Logan Melton on 1/9/22.
//

import UIKit

class StageViewController: UIViewController {
  
  let stagedCardView = StagedCardView()
  
  let stackView = UIStackView()
  let stepName = UILabel()
  let imageView = UIImageView()
  let stepDirection = UILabel()
  
  var stepTitle = String()
  var imageName = String()
  var directions = String()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    style()
    layout()
  }
  
  init(stepTitle: String, imageName: String) {
    self.stepTitle = stepTitle
    self.imageName = imageName
    
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
}

extension StageViewController {
  
  func style() {
    view.translatesAutoresizingMaskIntoConstraints = false
    
    stagedCardView.translatesAutoresizingMaskIntoConstraints = false
    stagedCardView.backgroundColor = .red
    
  }
  
  func layout() {
    view.addSubview(stagedCardView)
    NSLayoutConstraint.activate([
      stagedCardView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
      stagedCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: stagedCardView.bottomAnchor, multiplier: 1),
      stagedCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
    ])
  }
}
