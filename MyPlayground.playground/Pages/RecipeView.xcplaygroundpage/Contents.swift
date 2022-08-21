@@ -0,0 +1,68 @@
//
//  RecipeView.swift
//  StagedCooking
//
//  Created by Logan Melton on 1/5/22.
//

import Foundation
import UIKit

class RecipeView: UIView {
  
  let recipeStackView = UIStackView()
  let imageView = UIImageView()
  let label = UILabel()
  
  var recipe = Recipe()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    //    backgroundColor = .systemMint
    style()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension RecipeView {
  
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
    
    recipeStackView.translatesAutoresizingMaskIntoConstraints = false
    recipeStackView.axis = .vertical
    recipeStackView.distribution = .fillProportionally
    recipeStackView.spacing = 4
    
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFit
    imageView.backgroundColor = .systemTeal
    imageView.loadImage(url: "")
    
    label.translatesAutoresizingMaskIntoConstraints = false
    label.backgroundColor = .red
    label.font = .systemFont(ofSize: 24)
    label.text = "Hold Up"
    label.textAlignment = .natural
  }
  
  func layout() {
    
    addSubview(recipeStackView)
    NSLayoutConstraint.activate([
      recipeStackView.widthAnchor.constraint(equalTo: widthAnchor)
    ])
    
    recipeStackView.addArrangedSubview(imageView)
    NSLayoutConstraint.activate([
      imageView.heightAnchor.constraint(equalToConstant: 200),
    ])
    
    recipeStackView.addArrangedSubview(label)
    
  }
}
