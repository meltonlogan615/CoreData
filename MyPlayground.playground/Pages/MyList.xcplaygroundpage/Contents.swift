@ -11,6 +11,7 @@ struct MyList {
  static var defaults = UserDefaults.standard
  static var favoriteRecipes = [Recipe]()
  static var savedRecipes = [Recipe]() // Saved, but not an explicit favorite. But can still be both
                                       //  static var viewedRecipes = [Int: String]()
  static var viewedRecipes = [Recipe]()
  static var searchHistory = [String]() // perhaps used later as part of an autocomplete in search
  mutating func setFavorites(recipe: Recipe) {
    @ -21,8 +22,11 @@ struct MyList {
      MyList.savedRecipes.append(recipe)
    }
    
    mutating func addToViewed(recipe: Recipe) {
      MyList.viewedRecipes.insert(recipe, at: 0)
      //  mutating func addToViewed(_ key: Int, _ val: String) {
      //    MyList.viewedRecipes[key] = val
      //  }
      mutating func addToViewed(_ recipe: Recipe) {
        MyList.viewedRecipes.append(recipe)
      }
      
      mutating func addToSearchHistory(searchTerm: String) {
