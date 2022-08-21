@@ -0,0 +1,97 @@
//
//  IngredientsView.swift
//  StagedCooking
//
//  Created by Logan Melton on 1/13/22.
//

import Foundation
import UIKit

class IngredientsView: UIView {
  
  let ingredientsStack = UIStackView()
  
  // for initial setup purposes
  let label1 = UILabel()
  let label2 = UILabel()
  let label3 = UILabel()
  let label4 = UILabel()
  let label5 = UILabel()
  let label6 = UILabel()
  
  let directionsLabel = UILabel()
  var directions = UILabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    //    backgroundColor = .green
    //    alpha = 0.5
    style()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension IngredientsView {
  
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
    
    ingredientsStack.translatesAutoresizingMaskIntoConstraints = false
    ingredientsStack.axis = .vertical
    ingredientsStack.spacing = 2
    ingredientsStack.distribution = .equalSpacing
    
    label1.translatesAutoresizingMaskIntoConstraints = false
    label1.numberOfLines = 1
    label1.text = ""
    
    label2.translatesAutoresizingMaskIntoConstraints = false
    label2.text = "poop"
    
    label3.translatesAutoresizingMaskIntoConstraints = false
    label3.text = "poop"
    
    label4.translatesAutoresizingMaskIntoConstraints = false
    label4.text = "poop"
    
    label5.translatesAutoresizingMaskIntoConstraints = false
    label5.text = "poop"
    
    label6.translatesAutoresizingMaskIntoConstraints = false
    label6.text = "poop"
    
    directionsLabel.translatesAutoresizingMaskIntoConstraints = false
    directionsLabel.font = UIFont.preferredFont(forTextStyle: .title2)
    directionsLabel.text = "Directions:"
    
    directions.translatesAutoresizingMaskIntoConstraints = false
    directions.numberOfLines = 0
    directions.textAlignment = .justified
    
  }
  
  func layout() {
    ingredientsStack.addArrangedSubview(label1)
    ingredientsStack.addArrangedSubview(label2)
    ingredientsStack.addArrangedSubview(label3)
    ingredientsStack.addArrangedSubview(label4)
    ingredientsStack.addArrangedSubview(label5)
    ingredientsStack.addArrangedSubview(label6)
    ingredientsStack.addArrangedSubview(directionsLabel)
    ingredientsStack.addArrangedSubview(directions)
    
    addSubview(ingredientsStack)
    NSLayoutConstraint.activate([
      ingredientsStack.widthAnchor.constraint(equalTo: widthAnchor),
      ingredientsStack.centerXAnchor.constraint(equalTo: centerXAnchor)
      //      ingredientsStack.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1)
      //      trailingAnchor.constraint(equalToSystemSpacingAfter: ingredientsStack.trailingAnchor, multiplier: 1),
      //      ingredientsStack.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1)
    ])
  }
}
