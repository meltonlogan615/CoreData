@@ -9,36 +9,23 @@ import Foundation
import UIKit


class DataProvider {
  class DataProvider  {
    
    private let networkDataFlow = NetworkDataFlow()
    
    func getRecipies<T: Decodable>(for food: String, completion: @escaping (Result<[T], Error>) -> Void {
      let recipieEndpoint = EndPoints.getRecipies(for: food)
      networkDataFlow.getData(for: recipieEndpoint.endpointURL) { (result: Result<[T], Error>) in
        func getRecipes<T: Decodable>(for: String, completion: @escaping (Result<T, Error>) -> Void) {
          let recipeEndpoint = EndPoints.getFood(for: SearchedTerm.searched)
          networkDataFlow.getData(for: recipeEndpoint.endpointURL) { (result: Result<T, Error>) in
            completion(result)
          }
        }
        
 
          
          // Later, if additional endpoints or API provided functionality added, will ned to add additional func to recive the data that will be passed back in.
