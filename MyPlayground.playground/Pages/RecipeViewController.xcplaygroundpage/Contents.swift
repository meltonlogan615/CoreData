@@ -0,0 +1,144 @@
//
//  RecipeViewController.swift
//  StagedCooking
//
//  Created by Logan Melton on 1/5/22.
//

import Foundation

import UIKit

class RecipeViewController: UIViewController {
  
  let dataprovider = DataProvider()
  var recipe = Recipe()
  
  let label = UILabel()
  let stackView = UIStackView()
  let recipeView = RecipeView()
  let ingredientsView = IngredientsView()
  let searchView = SearchView()
  let startCookingButton = UIButton(type: .roundedRect)
  
  var recipeID = 0
  var propertyDictionary = [String: String]()
  var recipeDetails = [String]()
  var recipeImage = String()
  
  override func viewWillAppear(_ animated: Bool) {
    loadRecipeByID(for: recipeID)
    print(recipeImage)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    style()
    layout()
  }
}

extension RecipeViewController {
  
  func style() {
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.spacing = 8
    //    stackView.distribution = .fillProportionally
    
    recipeView.translatesAutoresizingMaskIntoConstraints = false
    recipeView.backgroundColor = .systemPink
    recipeView.imageView.loadImage(url: recipeImage)
    
    ingredientsView.translatesAutoresizingMaskIntoConstraints = false
    ingredientsView.backgroundColor = .systemMint
    
    searchView.translatesAutoresizingMaskIntoConstraints = false
    
    startCookingButton.translatesAutoresizingMaskIntoConstraints = false
    startCookingButton.configuration = .borderedProminent()
    startCookingButton.setTitle("Start Cooking", for: [])
    startCookingButton.addTarget(self, action: #selector(startCookingButtonTapped), for: .primaryActionTriggered)
  }
  
  func layout() {
    stackView.addArrangedSubview(recipeView)
    recipeView.heightAnchor.constraint(lessThanOrEqualToConstant: (view.frame.height / 4)).isActive = true
    stackView.addArrangedSubview(ingredientsView)
    
    view.addSubview(stackView)
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2),
      view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
      stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2)
    ])
    
    view.addSubview(startCookingButton)
    NSLayoutConstraint.activate([
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: startCookingButton.trailingAnchor, multiplier: 2),
      view.bottomAnchor.constraint(equalToSystemSpacingBelow: startCookingButton.bottomAnchor, multiplier: 6),
      startCookingButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
      startCookingButton.heightAnchor.constraint(equalToConstant: 48)
    ])
  }
}

// MARK: - ButtonActions
extension RecipeViewController {
  @objc func startCookingButtonTapped(_ sender: UIButton) {
    // transitions to the StagedCardContainerVC
    print("tapped")
  }
}

// MARK: - Add Viewed Recipe to MyList.viewedRecipe
extension RecipeViewController {
  private func saveToViewedHistory(_ recipe: Recipe) {
    var myList = MyList()
    myList.addToViewed(recipe)
    myList.saveChanges()
  }
  
}

// MARK: - Recipe Call
extension RecipeViewController: RecipeByID {
  func loadRecipeByID(for chosenID: Int) {
    dataprovider.getRecipeByID(for: chosenID) { [weak self] (foodResult: Result<Recipe, Error>) in
      guard let self = self else { return }
      switch foodResult {
        case .success(let model):
          DispatchQueue.main.async {
            self.recipe = model as Recipe
            self.propertyDictionary = ParseObjectProperties.iterateObject(self.recipe)
            self.setServings()
            self.setAttributeValues()
          }
        case .failure(let error):
          print(error)
      }
    }
  }
}

extension RecipeViewController {
  
  func setServings() {
    guard let servings = propertyDictionary["servings"] else { return }
    ingredientsView.label1.text = "Servings: \(servings)"
  }
  
  func setAttributeValues() {
    if let titleText = propertyDictionary["title"] {
      self.title = titleText
    }
    if let image = propertyDictionary["image"] {
      recipeView.imageView.loadImage(url: image)
    }
    if let summary = propertyDictionary["summary"] {
      ingredientsView.directions.attributedText = summary.htmlAttributedString()
    }
  }
}
