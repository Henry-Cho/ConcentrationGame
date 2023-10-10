//
//  Array+Index.swift
//  Concentration Game
//
//  Created by Henry Cho on 10/9/23.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching targetElement: Element) -> Int? {
        for chosenIndex in self.indices {
            if self[chosenIndex].id == targetElement.id {
                return chosenIndex
            }
        }
        
        return nil
    }
}
