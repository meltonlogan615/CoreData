@@ -0,0 +1,45 @@
//
//  ParseObjectProperties.swift
//  StagedCooking
//
//  Created by Logan Melton on 12/7/21.
//

import Foundation


struct ParseObjectProperties {
  static func iterateObject<T: Decodable>(_ object: T) -> [String: String] {
    var objectPropertyDictionary = [String: String]()
    let mirroredObject = Mirror(reflecting: object)
    for (label, value) in mirroredObject.children {
      guard let label = label else { continue }
      if let propertyValue = value as? String {
        objectPropertyDictionary[label] = propertyValue
      } else if let propertyValue = value as? Int {
        objectPropertyDictionary[label] = String(propertyValue)
      } else if let propertyValue = value as? Double {
        objectPropertyDictionary[label] = String(propertyValue)
      } else if let propertyValue = value as? Bool {
        objectPropertyDictionary[label] = String(propertyValue)
      } else if let props = value as? Product {
        objectPropertyDictionary[label] = props.title
      } else if let props = value as? Equipment {
        objectPropertyDictionary[label] = props.name
      } else if let props = value as? Ingredient {
        objectPropertyDictionary[label] = props.name
      } else if let props = value as? Nutrients {
        objectPropertyDictionary[label] = props.name
      } else if let props = value as? Recipe {
        objectPropertyDictionary[label] = props.title
      }
    }
    return objectPropertyDictionary
  }
}

// Source:
// https://medium.com/@how_noobs_think/how-to-iterate-through-struct-properties-swift4-9da09b30342d

// Referenced Stack Overflow Question:
// https://stackoverflow.com/questions/27989094/how-to-unwrap-an-optional-value-from-any-type
