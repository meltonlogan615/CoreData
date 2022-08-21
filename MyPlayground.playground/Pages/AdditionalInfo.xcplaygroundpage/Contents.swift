@@ -0,0 +1,159 @@
//
//  AdditionalInfoView.swift
//  StagedCooking
//
//  Created by Logan Melton on 1/14/22.
//

import Foundation
import UIKit

class AdditionalInfoView: UIView {
  
  let holderData = DummyData()
  
  let infoStack = UIStackView()
  
  let servingsLabel = UILabel()
  let prepTimeLabel = UILabel()
  let cookTimeLabel = UILabel()
  let totalTime = UILabel()
  let pricePerServing = UILabel()
  
  let occasionsLabel = UILabel()
  var occasionsText = String()
  
  let dietsLabel = UILabel()
  var dietsText = String()
  
  let vegetarianLabel = UILabel()
  let veganLabel = UILabel()
  let glutenFreeLabel = UILabel()
  let dairyFreeLabel = UILabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    style()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

extension AdditionalInfoView {
  
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
    
    infoStack.translatesAutoresizingMaskIntoConstraints = false
    infoStack.axis = .vertical
    infoStack.spacing = 2
    
    servingsLabel.translatesAutoresizingMaskIntoConstraints = false
    //    servingsLabel.text = "Servings: \(holderData.servings)"
    servingsLabel.text = "Servings: \(holderData.servings)"
    
    prepTimeLabel.translatesAutoresizingMaskIntoConstraints = false
    prepTimeLabel.text = "Prep Time: \(holderData.preparationMinutes)"
    
    cookTimeLabel.translatesAutoresizingMaskIntoConstraints = false
    cookTimeLabel.text = "Cook Time: \(holderData.cookingMinutes)"
    
    totalTime.translatesAutoresizingMaskIntoConstraints = false
    totalTime.text = "Total Time: \(holderData.readyInMinutes)"
    
    
    pricePerServing.translatesAutoresizingMaskIntoConstraints = false
    pricePerServing.text = "Cost Per Serving: $\(String(format: "%.2f", holderData.pricePerServing))"
    
    occasionsLabel.translatesAutoresizingMaskIntoConstraints = false
    for i in holderData.occasions {
      if holderData.occasions.count > 1 {
        if i == holderData.occasions.last {
          occasionsText += i
        } else {
          occasionsText += "\(i), "
        }
      } else {
        occasionsText = i
      }
    }
    occasionsLabel.text = "Occasions: \(occasionsText)"
    
    dietsLabel.translatesAutoresizingMaskIntoConstraints = false
    for i in holderData.diets {
      if holderData.diets.count > 1 {
        if i == holderData.diets.last {
          dietsText += i
        } else {
          dietsText += "\(i), "
        }
      } else {
        dietsText = i
      }
    }
    dietsLabel.text = "Diets: \(dietsText)"
    
    vegetarianLabel.translatesAutoresizingMaskIntoConstraints = false
    if holderData.vegetarian == true {
      vegetarianLabel.text = "Vegetarian"
    }
    
    veganLabel.translatesAutoresizingMaskIntoConstraints = false
    if holderData.vegan == true {
      veganLabel.text = "Vegan"
    }
    
    glutenFreeLabel.translatesAutoresizingMaskIntoConstraints = false
    if holderData.glutenFree == true {
      glutenFreeLabel.text = "Gluten Free"
    }
    
    dairyFreeLabel.translatesAutoresizingMaskIntoConstraints = true
    if holderData.dairyFree == true {
      dairyFreeLabel.text = "Dairy Free"
    }
  }
  
  func layout() {
    infoStack.addArrangedSubview(servingsLabel)
    infoStack.addArrangedSubview(prepTimeLabel)
    infoStack.addArrangedSubview(cookTimeLabel)
    infoStack.addArrangedSubview(totalTime)
    infoStack.addArrangedSubview(pricePerServing)
    infoStack.addArrangedSubview(occasionsLabel)
    infoStack.addArrangedSubview(dietsLabel)
    infoStack.addArrangedSubview(vegetarianLabel)
    infoStack.addArrangedSubview(veganLabel)
    infoStack.addArrangedSubview(glutenFreeLabel)
    infoStack.addArrangedSubview(dairyFreeLabel)
    
    addSubview(infoStack)
    infoStack.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor).isActive = true
  }
}

/*
 var servings = 4
 var preparationMinutes = 30
 var cookingMinutes = 30
 var readyInMinutes = 60
 
 var pricePerServing = 3.50
 var occasions = ["Hungry"]
 
 var diets = ["Vegetarian", "Gluten Free", "Farts"]
 var vegan = false
 var glutenFree = true
 var dairyFree = false
 
 // Copywrite Info
 var creditsText: String?
 var sourceName: String?
 var sourceUrl: URL?
 var license: String?
 */
